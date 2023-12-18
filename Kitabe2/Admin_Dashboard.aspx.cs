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
    public partial class Book_Management : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\HARSH\source\repos\Kitabe2\Kitabe2\App_Data\Kitabe.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                string query = "select Origian_Title from Book_Master2";
                DataTable dt = GetData(query);
                Book_Title.DataSource = dt;
                Book_Title.DataTextField = "Origian_Title";
                Book_Title.DataValueField = "Origian_Title";
                Book_Title.DataBind();
                Book_Title.Items.Insert(0, new ListItem("Select", ""));
            }
        }
        protected void ddlCountries_SelectedIndexChanged(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd1 = new SqlCommand();
            cmd1 = new SqlCommand("Select Id FROM Book_Master2 where Origian_Title='" + Book_Title.SelectedItem.Value.ToString() + "'", con);
            int BId = Convert.ToInt32(cmd1.ExecuteScalar());
            con.Close();

            string query = string.Format("Select Rating,count(R_Id) total from TblRating where Id = '{0}' group by Rating", BId);
            DataTable dt = GetData(query);

            //Loop and add each datatable row to the Pie Chart Values
            foreach (DataRow row in dt.Rows)
            {
                PieChart1.PieChartValues.Add(new AjaxControlToolkit.PieChartValue
                {
                    Category = row["Rating"].ToString(),
                    Data = Convert.ToDecimal(row["total"])
                });
            }
            PieChart1.Visible = Book_Title.SelectedItem.Value != "";
            
        }
        
        private static DataTable GetData(string query)
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\HARSH\source\repos\Kitabe2\Kitabe2\App_Data\Kitabe.mdf;Integrated Security=True"))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        sda.Fill(dt);
                    }
                }
                return dt;
            }
        }
         
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin_Dashboard2.aspx");
        }

        
    }
}