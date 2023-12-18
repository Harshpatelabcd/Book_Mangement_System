using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kitabe2
{
    public partial class Single_Dataentry : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\HARSH\source\repos\Kitabe2\Kitabe2\App_Data\Kitabe.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private bool isValid()
        {
            con.Open();
            bool exists = false;
            SqlCommand cmd = new SqlCommand("Select count(*) from [Book_Master2] where Book_id=@Book_id", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@Book_id", Edition_Number.Text);
            exists = (int)cmd.ExecuteScalar() > 0;
            if (exists)
            {
                Response.Write("<script> alert('Edition number is already exists...') </script>");
                return false;

            }
            con.Close();
            return true;

        }
        private bool isValid1()
        {
            con.Open();
            bool exists = false;
            SqlCommand cmd = new SqlCommand("Select count(*) from [Book_Master2] where Isbn=@Isbn", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@Isbn", Edition_Number.Text);
            exists = (int)cmd.ExecuteScalar() > 0;
            if (exists)
            {
                Response.Write("<script> alert('Edition number is already exists...') </script>");
                return false;

            }
            con.Close();
            return true;

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (isValid())
            {
                if (isValid1())
                {


                    HttpPostedFile postedFile = BookImage.PostedFile;

                    string filename = Path.GetFileName(postedFile.FileName);
                    string fileExtension = Path.GetExtension(filename);
                    int fileSize = postedFile.ContentLength;

                    if (fileExtension.ToLower() == ".jpg" ||
                         fileExtension.ToLower() == ".png")
                    {
                        Stream stream = postedFile.InputStream;

                        BinaryReader binaryReader = new BinaryReader(stream);
                        Byte[] bytes = binaryReader.ReadBytes((int)stream.Length);

                        using (SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\HARSH\source\repos\Kitabe2\Kitabe2\App_Data\Kitabe.mdf;Integrated Security=True"))
                        {
                            SqlCommand cmd = new SqlCommand("Book", con);
                            cmd.CommandType = CommandType.StoredProcedure;

                            SqlParameter paramisbn = new SqlParameter()
                            {
                                ParameterName = "@isbn",
                                Value = Isbn.Text
                            };
                            cmd.Parameters.Add(paramisbn);

                            SqlParameter parambtitle = new SqlParameter()
                            {
                                ParameterName = "@Origian_Title",
                                Value = Book_Title.Text
                            };
                            cmd.Parameters.Add(parambtitle);

                            SqlParameter parambauthor = new SqlParameter()
                            {
                                ParameterName = "@Author_name",
                                Value = Author.Text
                            };
                            cmd.Parameters.Add(parambauthor);

                            SqlParameter parambcate = new SqlParameter()
                            {
                                ParameterName = "@Book_Genre",
                                Value = DropDownList1.SelectedItem.ToString()
                            };
                            cmd.Parameters.Add(parambcate);

                            SqlParameter paramIndi = new SqlParameter()
                            {
                                ParameterName = "@Book_id",
                                Value = Edition_Number.Text
                            };
                            cmd.Parameters.Add(paramIndi);

                            SqlParameter parampname = new SqlParameter()
                            {
                                ParameterName = "@Original_Publicationyear",
                                Value = Publicationyear.Text
                            };
                            cmd.Parameters.Add(parampname);

                            SqlParameter avgrate = new SqlParameter()
                            {
                                ParameterName = "@average_rating",
                                Value = Avgrate.Text
                            };
                            cmd.Parameters.Add(avgrate);

                            SqlParameter ratecn = new SqlParameter()
                            {
                                ParameterName = "@Rating_Count",
                                Value = Ratecount.Text
                            };
                            cmd.Parameters.Add(ratecn);

                            SqlParameter Lang = new SqlParameter()
                            {
                                ParameterName = "@Language",
                                Value = DropDownList2.SelectedItem.ToString()

                            };
                            cmd.Parameters.Add(Lang);

                            SqlParameter paramcoverpage = new SqlParameter()
                            {
                                ParameterName = "@Image_Url",
                                Value = bytes
                            };
                            cmd.Parameters.Add(paramcoverpage);

                            con.Open();
                            cmd.ExecuteNonQuery();
                            Response.Write("<script>alert('Book has been added..');window.location='Bulk_Dataentry.aspx';</script>");
                            con.Close();
                        }
                    }
                }
            }
            else
            {
                Response.Write("<script>alert('Entry is invalid  try again..')</script>");
            }




        }
    }
}