using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.Data;
using System.IO;

namespace Kitabe2
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\HARSH\source\repos\Kitabe2\Kitabe2\App_Data\Kitabe.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            GenerateOTP();
        }

        public string GenerateOTP()
        {
            string OTPLength = "6";
            string OTP = "";

            string allowedChars = "";
            allowedChars = "1,2,3,4,5,6,7,8,9,0";
            // allowedChars += "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,";
            //allowedChars += "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,";


            char[] sep = {
            ','
        };
            string[] arr = allowedChars.Split(sep);


            string IDString = "";
            string temp = "";

            Random rand = new Random();

            for (int i = 0; i < Convert.ToInt32(OTPLength); i++)
            {
                temp = arr[rand.Next(0, arr.Length)];
                IDString += temp;
                OTP = IDString;

            }
            return OTP;
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {


            try
            {
                string GETOTP = GenerateOTP().ToString();



                // to send the random password in email  

                //string strNewPassword = GeneratePassword().ToString();

                MailMessage msg = new MailMessage();
                msg.From = new MailAddress("bipatel9878@gmail.com.com");
                msg.To.Add(txtEmail.Text);
                msg.Subject = "Random Password for your Account";
                msg.Body = "Your OTP is:" + GETOTP;
                msg.IsBodyHtml = true;

                SmtpClient smt = new SmtpClient();
                smt.Host = "smtp.gmail.com";
                System.Net.NetworkCredential ntwd = new NetworkCredential();
                ntwd.UserName = "bipatel9878@gmail.com"; //Your Email ID  
                ntwd.Password = "Bhavesh2018"; // Your Password  
                smt.UseDefaultCredentials = false;
                smt.Credentials = ntwd;
                smt.DeliveryMethod = SmtpDeliveryMethod.Network;
                smt.Port = 587;
                smt.EnableSsl = true;
                smt.Send(msg);

                lblMessage.Text = "Email Sent Successfully";
                lblMessage.ForeColor = System.Drawing.Color.ForestGreen;


                // to save the username and password in database  

                HttpCookie Cookie = new HttpCookie("Email");
                Cookie.Value = txtEmail.Text;
                Cookie.Expires = DateTime.Now.AddHours(1);
                Response.Cookies.Add(Cookie);

                HttpWebRequest req = (HttpWebRequest)WebRequest.Create("http://srimca.edu.in");
                HttpWebResponse resp = (HttpWebResponse)req.GetResponse();
                StreamReader sr = new StreamReader(resp.GetResponseStream());
                string results = sr.ReadToEnd();
                sr.Close();

                Session["OTP"] = GETOTP;

                Response.Write(Session["OTP"].ToString());

                // Button4.PostBackUrl = "~/VerifyOTP.aspx";



                SqlCommand cmd = new SqlCommand("insert into Email(username,email,OTP) values (@username,@email,@OTP)", con);
                cmd.Parameters.AddWithValue("username", TextBox1.Text);
                cmd.Parameters.AddWithValue("email", txtEmail.Text);
                cmd.Parameters.AddWithValue("OTP", GETOTP);
                int i = cmd.ExecuteNonQuery();

                Response.Redirect("VerifyOTP.aspx");


            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message.ToString();
            }
            finally
            {
                con.Close();
            }

        }

    }
}