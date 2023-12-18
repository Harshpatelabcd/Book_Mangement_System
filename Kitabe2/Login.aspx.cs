using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kitabe2
{
    public partial class EmailSending : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\HARSH\source\repos\Kitabe2\Kitabe2\App_Data\Kitabe.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Login_Click(object sender, EventArgs e)
        {

            string query = "select count(*) from [Registration] where Username='" + Username.Text + "' and Password='" + Password.Text + "'";
            SqlCommand com = new SqlCommand(query, con);
            con.Open();
            int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
            if (temp == 1)
            {
                Response.Redirect("EmailSending.aspx?Username =" + Username.Text);
            }
            else
            {
                Response.Write("<script>alert('Invalid Password or Username try again..')</script>");
            }
            con.Close();

        }
    }
}