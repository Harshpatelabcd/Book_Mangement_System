using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kitabe2
{
    public partial class Search_History : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (!IsPostBack)
                {
                    BindDataList();
                }
            }
        }
        public void BindDataList()
        {

            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\HARSH\source\repos\Kitabe2\Kitabe2\App_Data\Kitabe.mdf;Integrated Security=True;MultipleActiveResultSets=true;");
            con.Open();
            Label5.Text = Session["Username"].ToString();

            SqlCommand cmd2 = new SqlCommand();
            cmd2 = new SqlCommand("SELECT R_Id FROM Registration where Username='" + Label5.Text + "'", con);
            int rid = Convert.ToInt32(cmd2.ExecuteScalar());
            con.Close();


            //string Book_id = Request.QueryString["Id"];
            string querry = "select Book_Master2.Id,Book_Master2.Image_Url,Book_Master2.Author_name,Book_Master2.Origian_Title,TblRating1.Rating from TblRating1 inner join Book_Master2 on TblRating1.Id=Book_Master2.Id where TblRating1.R_Id='" + rid + "'";
            SqlCommand cmd = new SqlCommand(querry, con);

            SqlDataAdapter sda = new SqlDataAdapter(cmd);

            DataTable dt = new DataTable();

            sda.Fill(dt);

            DataList1.DataSource = dt;

            DataList1.DataBind();

        }
    }
}
