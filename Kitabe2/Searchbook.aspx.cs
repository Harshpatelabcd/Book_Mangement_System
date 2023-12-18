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
    public partial class Searchbook : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\HARSH\source\repos\Kitabe2\Kitabe2\App_Data\Kitabe.mdf;Integrated Security=True");
        public SqlCommand com;

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Search(object sender, EventArgs e)
        {
            this.SearchBook();
        }


        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static List<string> GetCompletionList(string prefixText, int count)
        {
            return AutoFillProducts(prefixText);

        }

        private static List<string> AutoFillProducts(string prefixText)
        {
            using (SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\HARSH\source\repos\Kitabe2\Kitabe2\App_Data\Kitabe.mdf;Integrated Security=True"))
            {
                using (SqlCommand com = new SqlCommand())
                {
                    com.CommandText = "select Origian_Title from Book_Master2 where " + "Origian_Title like  '%' + @Search + '%'";

                    com.Parameters.AddWithValue("@Search", prefixText);
                    com.Connection = con;
                    con.Open();
                    List<string> countryNames = new List<string>();
                    using (SqlDataReader sdr = com.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            countryNames.Add(sdr["Origian_Title"].ToString());
                            //countryNames.Add(sdr["Smallimage"].ToString());
                        }
                    }
                    con.Close();
                    return countryNames;


                }

            }
        }

        private void SearchBook()
        {
            using (SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\HARSH\source\repos\Kitabe2\Kitabe2\App_Data\Kitabe.mdf;Integrated Security=True"))

            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    string sql = "SELECT * FROM Book_Master2";
                    if (!string.IsNullOrEmpty(TextBox1.Text.Trim()))
                    {
                        sql += " WHERE Origian_Title LIKE @Origian_Title + '%'";
                        cmd.Parameters.AddWithValue("@Origian_Title", TextBox1.Text.Trim());
                    }
                    cmd.CommandText = sql;
                    cmd.Connection = con;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        DataList1.DataSource = dt;
                        DataList1.DataBind();
                    }
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            string query = "SELECT * FROM Book_Master2 where Book_Genre like '" + DropDownList1.SelectedItem.ToString() + "%'";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = query;
            cmd.Connection = con;
            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
            {
                DataTable dt = new DataTable();
                sda.Fill(dt);
                DataList1.DataSource = dt;
                DataList1.DataBind();
            }


        }
    }
}