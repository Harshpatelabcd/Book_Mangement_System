using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kitabe2
{
    public partial class View_Recommendation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Label5.Text = Session["Username"].ToString();
                recent();
                random();
                author();
                pop_genre();
                random_gen();
                
            }
        }
        //-------------------recently rated book--------------------------
        public void recent()
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\HARSH\source\repos\Kitabe2\Kitabe2\App_Data\Kitabe.mdf;Integrated Security=True");
            con.Open();
            Label5.Text = Session["Username"].ToString();
            SqlCommand cmd1 = new SqlCommand();
            cmd1 = new SqlCommand("SELECT R_Id FROM Registration where Username='" + Label5.Text + "'", con);
            int RId = Convert.ToInt32(cmd1.ExecuteScalar());

            SqlCommand cmd2 = new SqlCommand("SELECT TOP(1) Id FROM TblRating1 where R_Id='"+ RId +"' AND Rating='5' ORDER BY Id DESC", con);
            int BId = Convert.ToInt32(cmd2.ExecuteScalar());

            SqlCommand cmd3 = new SqlCommand("SELECT Book_Genre FROM Book_Master2 WHERE Book_id='"+ BId +"'", con);
            string Bname = cmd3.ExecuteScalar().ToString();

            SqlCommand cmd5 = new SqlCommand("SELECT Origian_Title FROM Book_Master2 WHERE Book_id='" + BId + "'", con);
            Title.Text = cmd5.ExecuteScalar().ToString();

            //cmd1 = new SqlCommand("SELECT Book_Genre FROM Book_Master2 where Id='" + Book_id + "'", con);
            SqlCommand cmd4 = new SqlCommand("SELECT TOP(10) Image_Url,Id FROM Book_Master2 WHERE Book_Genre Like '%" + Bname + "%'", con);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            //===== Execute Query and bind data to Datalist.
            Recent.DataSource = cmd4.ExecuteReader();
            Recent.DataBind();
            con.Close();


        }


        //----------------5 rated other book--------------------------
        public void random()
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\HARSH\source\repos\Kitabe2\Kitabe2\App_Data\Kitabe.mdf;Integrated Security=True");
            con.Open();
            Label5.Text = Session["Username"].ToString();
            SqlCommand cmd1 = new SqlCommand();
            cmd1 = new SqlCommand("SELECT R_Id FROM Registration where Username='" + Label5.Text + "'", con);
            int RId = Convert.ToInt32(cmd1.ExecuteScalar());

            SqlCommand cmd2 = new SqlCommand("SELECT TOP(1) Id FROM TblRating1 where R_Id='" + RId + "' AND Rating='5' ORDER BY NEWID()", con);
            int BId = Convert.ToInt32(cmd2.ExecuteScalar());

            SqlCommand cmd3 = new SqlCommand("SELECT Book_Genre FROM Book_Master2 WHERE Book_id='" + BId + "'", con);
            string Bname = cmd3.ExecuteScalar().ToString();

            SqlCommand cmd5 = new SqlCommand("SELECT Origian_Title FROM Book_Master2 WHERE Book_id='" + BId + "'", con);
            Title1.Text = cmd5.ExecuteScalar().ToString();

            //cmd1 = new SqlCommand("SELECT Book_Genre FROM Book_Master2 where Id='" + Book_id + "'", con);
            SqlCommand cmd4 = new SqlCommand("SELECT TOP(10) Image_Url,Id FROM Book_Master2 WHERE Book_Genre Like '%" + Bname + "%'", con);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            //===== Execute Query and bind data to Datalist.
            random_book.DataSource = cmd4.ExecuteReader();
            random_book.DataBind();
            con.Close();

        }

        //--------------------recently rated book author---------------------
        public void author()
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\HARSH\source\repos\Kitabe2\Kitabe2\App_Data\Kitabe.mdf;Integrated Security=True");
            con.Open();
            Label5.Text = Session["Username"].ToString();
            SqlCommand cmd1 = new SqlCommand();
            cmd1 = new SqlCommand("SELECT R_Id FROM Registration where Username='" + Label5.Text + "'", con);
            int RId = Convert.ToInt32(cmd1.ExecuteScalar());

            SqlCommand cmd2 = new SqlCommand("SELECT TOP(1) Id FROM TblRating1 where R_Id='" + RId + "' AND Rating='5' ORDER BY NEWID()", con);
            int BId = Convert.ToInt32(cmd2.ExecuteScalar());

            SqlCommand cmd3 = new SqlCommand("SELECT Author_name FROM Book_Master2 WHERE Book_id='" + BId + "'", con);
            string Bname = cmd3.ExecuteScalar().ToString();
            //cmd1 = new SqlCommand("SELECT Book_Genre FROM Book_Master2 where Id='" + Book_id + "'", con);
            Author.Text = cmd3.ExecuteScalar().ToString();

            SqlCommand cmd4 = new SqlCommand("SELECT TOP(10) Image_Url,Id FROM Book_Master2 WHERE Author_name Like '%" + Bname + "%'", con);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            //===== Execute Query and bind data to Datalist.
            Author1.DataSource = cmd4.ExecuteReader();
            Author1.DataBind();
            con.Close();

        }
        //----------------year 2000-2021---------------------
        public void pop_genre()
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\HARSH\source\repos\Kitabe2\Kitabe2\App_Data\Kitabe.mdf;Integrated Security=True");
            con.Open();
            Label5.Text = Session["Username"].ToString();
            SqlCommand cmd1 = new SqlCommand();
            cmd1 = new SqlCommand("SELECT R_Id FROM Registration where Username='" + Label5.Text + "'", con);
            int RId = Convert.ToInt32(cmd1.ExecuteScalar());

            SqlCommand cmd3 = new SqlCommand("SELECT TOP(1) Book_Genre,Count(Book_Genre) AS Bg FROM Book_Master2 GROUP BY Book_Genre ORDER BY Bg DESC", con);
            string Bgen = cmd3.ExecuteScalar().ToString();

            SqlCommand cmd4 = new SqlCommand("SELECT TOP(10) Image_Url,Id FROM Book_Master2 WHERE Book_Genre='"+ Bgen +"'", con);
            
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            //===== Execute Query and bind data to Datalist.
            pgenre.DataSource = cmd4.ExecuteReader();
            pgenre.DataBind();
            con.Close();
            
        }

        public void random_gen()
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\HARSH\source\repos\Kitabe2\Kitabe2\App_Data\Kitabe.mdf;Integrated Security=True");
            con.Open();
            Label5.Text = Session["Username"].ToString();
            SqlCommand cmd1 = new SqlCommand();
            cmd1 = new SqlCommand("SELECT R_Id FROM Registration where Username='" + Label5.Text + "'", con);
            int RId = Convert.ToInt32(cmd1.ExecuteScalar());

            SqlCommand cmd3 = new SqlCommand("SELECT TOP(1) Book_Genre FROM Book_Master2 ORDER BY NEWID()", con);
            string Bgen = cmd3.ExecuteScalar().ToString();

            SqlCommand cmd5 = new SqlCommand("SELECT TOP(1) Book_Genre FROM Book_Master2 ORDER BY NEWID()", con);
            
            string genre_title = cmd5.ExecuteScalar().ToString();
            Genre1.Text = cmd5.ExecuteScalar().ToString(); 

            SqlCommand cmd4 = new SqlCommand("SELECT TOP(10) Image_Url,Id FROM Book_Master2 WHERE Book_Genre='" + Bgen + "'", con);

            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            //===== Execute Query and bind data to Datalist.
            rangen.DataSource = cmd4.ExecuteReader();
            rangen.DataBind();
            con.Close();

        }

        

    }
}