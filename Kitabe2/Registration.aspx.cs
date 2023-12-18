using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kitabe2
{
    public partial class Registration : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\HARSH\source\repos\Kitabe2\Kitabe2\App_Data\Kitabe.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            GenerateOTP();

        }
        private bool isValid()
        {
            con.Open();
            bool exists = false;
            SqlCommand cmd = new SqlCommand("Select count(*) from [Registration] where Username=@Username", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@Username", rollno.Text);
            exists = (int)cmd.ExecuteScalar() > 0;
            if (exists)
            {
                Response.Write("<script> alert('Username is already exists...') </script>");
                return false;

            }
            con.Close();
            return true;

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
        

        protected void Button1_Click(object sender, EventArgs e)
        {


            string GETOTP = GenerateOTP().ToString();
            // to send the random password in email  

            //string strNewPassword = GeneratePassword().ToString();

            MailMessage msg = new MailMessage();
            msg.From = new MailAddress("harshpatelcr711@gmail.com");
            msg.To.Add(email.Text);
            msg.Subject = "Random Password for your Account";
            msg.Body = "Your OTP is:" + GETOTP;
            msg.IsBodyHtml = true;

            SmtpClient smt = new SmtpClient();
            smt.Host = "smtp.gmail.com";
            System.Net.NetworkCredential ntwd = new NetworkCredential();
            ntwd.UserName = "harshpatelcr711@gmail.com"; //Your Email ID  
            ntwd.Password = "anushka sharma"; // Your Password  
            smt.UseDefaultCredentials = true;
            smt.Credentials = ntwd;
            smt.DeliveryMethod = SmtpDeliveryMethod.Network;
            smt.Port = 587;
            smt.EnableSsl = true;
            smt.Send(msg);

            //lblMessage.Text = "Email Sent Successfully";
            //lblMessage.ForeColor = System.Drawing.Color.ForestGreen;


            // to save the username and password in database  

            HttpCookie Cookie = new HttpCookie("Email");
            Cookie.Value = email.Text;
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
            cmd.Parameters.AddWithValue("username", rollno.Text);
            cmd.Parameters.AddWithValue("email", email.Text);
            cmd.Parameters.AddWithValue("OTP", GETOTP);
            int i = cmd.ExecuteNonQuery();

            con.Close();


            if (isValid())
            {

                String query = "insert into Registration values('" + first_name.Text + "','" + last_name.Text + "','" + rollno.Text + "','" + gender.SelectedValue.ToString() + "','" + contact.Text + "','" + email.Text + "','" + password.Text + "','" + Cpassword.Text + "')";


                SqlCommand com = new SqlCommand(query, con);
                con.Open();
                int temp = Convert.ToInt32(com.ExecuteNonQuery().ToString());
                if (temp == 1)
                {
                    Response.Redirect("VerifyOTP.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid Password or Username try again..')</script>");
                }

                
                
            }
        }
    }
}