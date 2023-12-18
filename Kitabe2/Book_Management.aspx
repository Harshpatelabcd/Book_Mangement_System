<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Book_Management.aspx.cs" Inherits="Kitabe2.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Admin</title>
    	<meta charset="utf-8" />
	<link rel="icon" type="image/png" href="assets/img/favicon.ico"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS     -->
    <link href="assets1/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="assets1/css/animate.min.css" rel="stylesheet"/>

    <!--  Light Bootstrap Table core CSS    -->
    <link href="assets1/css/light-bootstrap-dashboard.css?v=1.4.0" rel="stylesheet"/>


    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="assets1/css/demo.css" rel="stylesheet" />


    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet"/>
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'/>
    <link href="assets1/css/pe-icon-7-stroke.css" rel="stylesheet" />
<style>
    GridView1{
        height:800px;
        width:800px;
        
    }
    .csspager
 {      
     padding:5px 0px;
    
 }
</style>
    <script>
      function AlertIt() {
          var answer = confirm("Please click OK to Logout.")
          if (answer)
              window.location = "https://localhost:44390/Login1.aspx";
      }
    </script>



</head>
    

<body>

    <div class="wrapper">
    <div class="sidebar" data-color="purple" data-image="assets/img/sidebar-5.jpg">

    <!--   you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple" -->


    	<div class="sidebar-wrapper">
             <div class="logo">
                <a class="simple-text">
                    ADMINISTRATOR
                </a>
            </div>

            <ul class="nav">
                <li >
                    <a href="Admin_Dashboard.aspx">
                        <i class="pe-7s-graph"></i>
                        <p>Dashboard</p>
                    </a>
                </li>
                <li>
                    <a href="Admin_Profile.aspx">
                        <i class="pe-7s-user"></i>
                        <p>My Profile</p>
                    </a>
                </li>

                <li class="active">
                    <a href="#">
                        <i class="pe-7s-note2"></i>
                        <p>Book Management</p>
                    </a>
                </li>
                
               
                <li>
                    <a href="Bulk_Dataentry.aspx">
                        <i class="pe-7s-note"></i>                        
                        <p>Bookentry</p>
                    </a>
                </li>

                <li>
                    <a href="Single_Dataentry.aspx">
                        <i class="pe-7s-note"></i>                        
                        <p>Single Book Entry</p>
                    </a>
                </li>

                <li>
                    <a href="javascript:AlertIt();">
                        <i class="pe-7s-back-2"></i>
                        <p>Log Out</p>
                    </a>
                </li>
                   
            </ul>
    	</div>
    </div>

    <div class="main-panel">
		<nav class="navbar navbar-default navbar-fixed">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example-2">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">Book Management</a>
                </div>
                <div class="collapse navbar-collapse">
                
                </div>
            </div>
        </nav>
        
        <div class="lodo">
     <form id="form1" runat="server">

         <div class="content">
            <div class="container-fluid">
                <div class="row">
                            <div class="header">
                                <p class="category"> </p>
                            </div>
                            <div class="content table-responsive table-full-width">
                                    <asp:GridView ID="GridView1" class="table table-hover table-striped" runat="server" CellPadding="8" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" AllowCustomPaging="False" PageSize="10" AllowPaging="True">
       <PagerSettings Mode="NextPrevious" PreviousPageText="Previous&nbsp;&nbsp;&nbsp;"
            NextPageText="Next" LastPageText="Last" />
                 <PagerStyle CssClass="csspager" BackColor="#CC99FF" ForeColor="#003399" HorizontalAlign="Center"/>                                
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="Sr. No" SortExpression="Id" />
                                <asp:BoundField DataField="Origian_Title" HeaderText="Book Title" SortExpression="Origian_Title" />
                                <asp:BoundField DataField="Isbn" HeaderText="Isbn No" SortExpression="Isbn" />
                                <asp:BoundField DataField="Author_name" HeaderText="Authors" SortExpression="Author_name" />
                                <asp:BoundField DataField="Language" HeaderText="Language" SortExpression="Language" />
                                <asp:BoundField DataField="Book_Genre" HeaderText="Genre" SortExpression="Book_Genre" />                          
                                <asp:BoundField DataField="Original_Publicationyear" HeaderText="Publication Year" SortExpression="Original_Publicationyear" />
                                <asp:CommandField EditText="Update" ShowDeleteButton="False" ShowEditButton="True" />
                            </Columns>
                        </asp:GridView>
                        
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\HARSH\source\repos\Kitabe2\Kitabe2\App_Data\Kitabe.mdf;Integrated Security=True" 
                            SelectCommand="SELECT * FROM [Book_Master2]"
                            DeleteCommand="DELETE FROM [Book_Master2] WHERE [Id] = @Id" 
                            UpdateCommand="UPDATE [Book_Master2] SET [Origian_Title] = @Origian_Title, [Author_name] = @Author_name, [Language] = @Language, [Original_Publicationyear] = @Original_Publicationyear, [Book_Genre] = @Book_Genre WHERE [Id] = @Id">
                            <DeleteParameters>
                                <asp:Parameter Name="Id" Type="Int32" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="Origian_Title" Type="String" />
                                <asp:Parameter Name="Author_name" Type="String" />
                                <asp:Parameter Name="Book_Genre" Type="String" />
                                <asp:Parameter Name="Original_Publicationyear" Type="String" />
                                <asp:Parameter Name="Language" Type="String" />
                                <asp:Parameter Name="Id" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                                   
                                           
                            </div>
                        </div>
                  
                </div>
             </div>

     </form>
            </div>
                   

        <footer class="footer">
        </footer>


    </div>
</div>



</body>

    <!--   Core JS Files   -->
    <script src="assets1/js/jquery.3.2.1.min.js" type="text/javascript"></script>
	<script src="assets1/js/bootstrap.min.js" type="text/javascript"></script>

	<!--  Charts Plugin -->
	<script src="assets1/js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="assets1/js/bootstrap-notify.js"></script>

    <!--  Google Maps Plugin    -->
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>

    <!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
	<script src="assets1/js/light-bootstrap-dashboard.js?v=1.4.0"></script>

	<!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
	<script src="assets1/js/demo.js"></script>

</html>
