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
    public partial class Bulk_Dataentry : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\HARSH\source\repos\Kitabe2\Kitabe2\App_Data\Kitabe.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            //Creating object of datatable  
            DataTable tblcsv = new DataTable();
            //creating columns  

            tblcsv.Columns.Add("Book_id");
            tblcsv.Columns.Add("Author_name");
            tblcsv.Columns.Add("Origian_Title");
            tblcsv.Columns.Add("Image_Url");
            tblcsv.Columns.Add("average_rating");
            tblcsv.Columns.Add("Rating_Count");
            tblcsv.Columns.Add("Book_Genre");
            tblcsv.Columns.Add("Original_Publicationyear");
            tblcsv.Columns.Add("Language");
            tblcsv.Columns.Add("Isbn");

            //getting full file path of Uploaded file  
            string CSVFilePath = Server.MapPath("~/Files/") + Path.GetFileName(FileUpload1.PostedFile.FileName);
            //string CSVFilePath = Path.GetFullPath(FileUpload1.PostedFile.FileName);
            //Reading All text  

            string fileExtension = Path.GetExtension(CSVFilePath);
            if (fileExtension.ToLower() == ".csv")
            {
                string ReadCSV = File.ReadAllText(CSVFilePath);
                //spliting row after new line  
                foreach (string csvRow in ReadCSV.Split('\n'))
                {
                    if (!string.IsNullOrEmpty(csvRow))
                    {
                        //Adding each row into datatable  
                        tblcsv.Rows.Add();
                        int count = 0;
                        foreach (string FileRec in csvRow.Split(','))
                        {
                            tblcsv.Rows[tblcsv.Rows.Count - 1][count] = FileRec;
                            count++;
                        }
                    }
                }
                //Calling insert Functions  
                InsertCSVRecords(tblcsv);
            }
            else
            {
                Response.Write("<script>alert('Invalid entry try again..')</script>");
            }
        }

        private void InsertCSVRecords(DataTable csvdt)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\HARSH\source\repos\Kitabe2\Kitabe2\App_Data\Kitabe.mdf;Integrated Security=True");

            //creating object of SqlBulkCopy    
            SqlBulkCopy objbulk = new SqlBulkCopy(con);
            //assigning Destination table name    
            objbulk.DestinationTableName = "Book_Master2";
            //Mapping Table column    
            objbulk.ColumnMappings.Add("Book_id", "Book_id");
            objbulk.ColumnMappings.Add("Author_name", "Author_name");
            objbulk.ColumnMappings.Add("Origian_Title", "Origian_Title");
            objbulk.ColumnMappings.Add("Image_Url", "Image_Url");
            objbulk.ColumnMappings.Add("average_rating", "average_rating");
            objbulk.ColumnMappings.Add("Rating_Count", "Rating_Count");
            objbulk.ColumnMappings.Add("Book_Genre", "Book_Genre");
            objbulk.ColumnMappings.Add("Original_Publicationyear", "Original_Publicationyear");
            objbulk.ColumnMappings.Add("Language", "Language");
            objbulk.ColumnMappings.Add("Isbn", "Isbn");
            //inserting Datatable Records to DataBase    
            con.Open();
            objbulk.WriteToServer(csvdt);
            Response.Write("<script>alert('Book data entry done successfully..')</script>");
            con.Close();
        }

        
    }
}