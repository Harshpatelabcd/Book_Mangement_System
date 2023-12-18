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
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                hehe();
            }

        }
        public void hehe1()
        {
            string[] secondNames = new string[500];


            int cont = 0;
            SqlConnection con1 = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\HARSH\source\repos\Kitabe2\Kitabe2\App_Data\Kitabe.mdf;Integrated Security=True;MultipleActiveResultSets=true;");
            con1.Open();
            Label5.Text = "Harsh@61";

            SqlCommand cmd2 = new SqlCommand();
            cmd2 = new SqlCommand("SELECT R_Id FROM Registration where Username='" + Label5.Text + "'", con1);
            int rid = Convert.ToInt32(cmd2.ExecuteScalar());
            con1.Close();


            string cs = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\HARSH\source\repos\Kitabe2\Kitabe2\App_Data\Kitabe.mdf;Integrated Security=True;MultipleActiveResultSets=true;";
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "select Book_Master2.Origian_Title from TblRating inner join Book_Master2 on TblRating.Id=Book_Master2.Id where TblRating.R_Id='" + rid + "'";
                    con.Open();

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    foreach (DataRow row in dt.Rows)
                    {
                        secondNames[cont] = row.Field<string>(0);

                        cont++;
                    }

                    for (int i = 0; i < secondNames.Length; i++)
                    {
                        Response.Write(secondNames[i]);
                    }
                    //====== Providning information to SQL command object about which query to 
                    //====== execute and from where to get database connection information.
                    //SqlCommand cmd4 = new SqlCommand(cmdText, con);

                    //===== To check current state of the connection object. If it is closed open the connection
                    //===== to execute the insert query.
                    string cmd4 = "SELECT TOP(10) Image_Url,Origian_Title,Id FROM Book_Master2 where Origian_Title Like '%" + secondNames + "%'";

                    SqlCommand cmd11 = new SqlCommand(cmd4, con);
                    repeaterNivoSlider.DataSource = cmd11.ExecuteReader();
                    repeaterNivoSlider.DataBind();

                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    //===== Execute Query and bind data to Datalist.
                    con.Close();
                }

            }
        }
        public void querry()
        {

        }
        public void hehe()
        {

            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\HARSH\source\repos\Kitabe2\Kitabe2\App_Data\Kitabe.mdf;Integrated Security=True;MultipleActiveResultSets=true;");
            con.Open();
            Label5.Text = "Harsh@61";

            SqlCommand cmd2 = new SqlCommand();
            cmd2 = new SqlCommand("SELECT R_Id FROM Registration where Username='" + Label5.Text + "'", con);
            int rid = Convert.ToInt32(cmd2.ExecuteScalar());
            con.Close();

            string com = "select Book_Master2.Origian_Title from TblRating inner join Book_Master2 on TblRating.Id=Book_Master2.Id where TblRating.R_Id='" + rid + "'";

            SqlDataAdapter adpt = new SqlDataAdapter(com, con);

            DataSet myDataSet = new DataSet();

            adpt.Fill(myDataSet, "Book_Master2");

            DataTable myDataTable = myDataSet.Tables[0];

            DataRow tempRow = null;



            foreach (DataRow tempRow_Variable in myDataTable.Rows)

            {

                tempRow = tempRow_Variable;

                ListBox1.Items.Add((string)(tempRow["Origian_Title"]));

            }
            
        }
        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string Bname = ListBox1.SelectedItem.ToString();
            string Bn = Bname.Substring(0, 5);
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\HARSH\source\repos\Kitabe2\Kitabe2\App_Data\Kitabe.mdf;Integrated Security=True;MultipleActiveResultSets=true;");
            string cmd4 = "SELECT TOP(10) Image_Url,Origian_Title,Id FROM Book_Master2 where Origian_Title Like '%" + Bn + "%'";
            con.Open();
            SqlCommand cmd11 = new SqlCommand(cmd4, con);
            repeaterNivoSlider.DataSource = cmd11.ExecuteReader();
            repeaterNivoSlider.DataBind();
            /*
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            */
            //===== Execute Query and bind data to Datalist.
            con.Close();
        }

        }

    }
            

        
