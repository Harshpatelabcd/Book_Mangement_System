using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kitabe2
{
    public partial class VerifyOTP : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\HARSH\source\repos\Kitabe2\Kitabe2\App_Data\Kitabe.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
        
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            /*
            SqlCommand cmd = new SqlCommand("insert into VerifyOtp(VerifyOTP) values (@VerifyOTP)", con);
            con.Open();
            cmd.Parameters.AddWithValue("VefifyOTP", txtOTP.Text);*/
            if (Session["OTP"].ToString() == txtOTP.Text)
            {
                lblMessage.Text = "Welcome...";
                Session["OTP"] = null;
                Response.Redirect("Login1.aspx");
            }
            else
            {
                lblMessage.Text = "Pleae enter correct OTP.";
            }
        }

        
    }
}