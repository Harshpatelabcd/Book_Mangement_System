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
    public partial class Admin_Dashboard2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindChart1();
        }

        private static DataTable GetData1(string query1)
        {
            DataTable dt1 = new DataTable();
            using (SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\HARSH\source\repos\Kitabe2\Kitabe2\App_Data\Kitabe.mdf;Integrated Security=True"))
            {
                using (SqlCommand cmd1 = new SqlCommand(query1))
                {
                    using (SqlDataAdapter sda1 = new SqlDataAdapter())
                    {
                        cmd1.CommandType = CommandType.Text;
                        cmd1.Connection = con;
                        sda1.SelectCommand = cmd1;
                        sda1.Fill(dt1);
                    }
                }
                return dt1;
            }
        }

        protected void BindChart1()

        {
            string query1 = "select top 10 Registration.Firstname,COUNT(TblRating1.R_Id) Total from TblRating1,Registration where TblRating1.R_Id=Registration.R_Id group by Registration.Firstname order by COUNT(TblRating1.R_Id) DESC";
            DataTable dt1 = GetData1(query1);

            string[] x = new string[dt1.Rows.Count];
            decimal[] y = new decimal[dt1.Rows.Count];
            for (int i = 0; i < dt1.Rows.Count; i++)
            {
                x[i] = dt1.Rows[i][0].ToString();
                y[i] = Convert.ToInt32(dt1.Rows[i][1]);
            }
            LineChart1.Series.Add(new AjaxControlToolkit.LineChartSeries { Data = y });
            LineChart1.CategoriesAxis = string.Join(",", x);

            if (x.Length > 3)
            {
                LineChart1.ChartWidth = (x.Length * 75).ToString();
            }
            LineChart1.Visible = true;

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin_Dashboard.aspx");
        }
    }
}