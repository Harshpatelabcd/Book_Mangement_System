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
    public partial class Homepage1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string firstname = Request.QueryString["Username"];
            if (!Page.IsPostBack)
            {
                bindNivoSlider();
            }
        }

        public void bindNivoSlider()
        {

            //====== Getting connection string defined in the web.config file. Pointed to the database we want to use.
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\HARSH\source\repos\Kitabe2\Kitabe2\App_Data\Kitabe.mdf;Integrated Security=True");

            //======= Select Query.
            string cmdText = "SELECT TOP(10) Image_Url,Origian_Title,Id FROM Book_Master2 where average_rating>=4.6";
            

            //====== Providning information to SQL command object about which query to 
            //====== execute and from where to get database connection information.
            SqlCommand cmd = new SqlCommand(cmdText, con);

            //===== To check current state of the connection object. If it is closed open the connection
            //===== to execute the insert query.
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            //===== Execute Query and bind data to Datalist.
            repeaterNivoSlider.DataSource = cmd.ExecuteReader();
            repeaterNivoSlider.DataBind();
        }

    }
}