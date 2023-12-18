<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Single_Dataentry.aspx.cs" Inherits="Kitabe2.Single_Dataentry" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    
    <meta charset="utf-8" />
	<link rel="icon" type="image/png" href="assets/img/favicon.ico"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>Admin</title>

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
        .btn12{
            padding-left:200px;
        }
        hr{
            color:black;
            border:1px black solid;
        }
    </style>
    <script>

        function check_Alpha(letters) {

                var regex1 = /^(?=(?:\D*\d){10}(?:(?:\D*\d){3})?$)[\d-]+$/;
                if (regex1.test(letters.Isbn.value) == false) {
                    alert("ISBN number is invalid....");
                    letters.isbn.focus();
                    return false;
                }

            var regex = /^[a-zA-Z ]+$/;
            if (regex.test(letters.Author.value) == false) {
                alert("Author name must be in alphabets only");
                letters.bauthor.focus();
                return false;
            }
            
            var regex = /^[a-zA-Z]+$/;
            if (regex.test(letters.Book_Title.value) == false) {
                alert("Language must be in alphabets only");
                letters.bauthor.focus();
                return false;
            }
            var regex5 = /^[0-9]{4}+$/;
            if (regex3.test(letters.Publicationyear.value) == false) {
                alert("Publication Year must be in 4 numbers..:");
                letters.Price.focus();
                return false;
            }

            return true;

        }
        function Imagevalidate() {
            var array = ['jpg', 'png', 'jpeg'];
            var xyz1 = document.getElementById("BookImage");

            var Extension = xyz1.value.substring(xyz1.value.lastIndexOf('.') + 1).toLowerCase();
            if (array.indexOf(Extension) <= -1) {
                alert("Please Upload only png, jpg, jpeg extension flle");
                return false;
            }
            return true;
        }

    </script>
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

    <!--

        Tip 1: you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple"
        Tip 2: you can also add an image using data-image tag

    -->

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
                <li>
                    <a href="Book_Management.aspx">
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

                <li class="active">
                    <a href="#">
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
                    &nbsp;</div>
            </div>
        </nav>
      
        <form id="form1" runat="server" onsubmit="return !! (Imagevalidate() & check_Alpha(this));">            
            <div class="content">
            <div class="container-fluid">
            <div class="row">                      
            <div class="card">

            <div class="header">
                          <p class="category"><h4>Single Entry</h4></p>
            </div>
            <div class="content">
                
                <table>
                    <tr>    
                 <td>    
            <h5>Edition Number:-</h5>    
                </td>    
                <td>    
                    <asp:TextBox ID="Edition_Number"  runat="server" Height="23px" Width="200px" required></asp:TextBox>
    <br />
                        
                </td> 
                       
                        </tr>
                    
              <tr>
                <td>
                    <br />
                    <h5>Book Title:-</h5> 
                </td>
                  <td>
                    <asp:TextBox ID="Book_Title" runat="server" Height="23px" Width="328px" required></asp:TextBox>
          <br />            
                </td>
                    </tr>
                    <tr>
                   
                <td>
                    <br />
                 <h5> Author Name:-</h5> 
                </td>
                <td>
                    <asp:TextBox ID="Author" runat="server" Height="23px" Width="280px" required></asp:TextBox>    
                
                </td>
                    </tr>
                <tr>
                <td>
                    <br />
                <h5>ISBN number:-</h5>
                </td>
                <td>
                    <asp:TextBox ID="Isbn" runat="server" Height="23px" Width="246px" required></asp:TextBox>    
                        
                </td>
                    </tr>
                    <tr>
                <td>
                    <br />
            <h5>Language:-</h5>
                </td>
                <td>
          <asp:DropDownList class="input-field1" ID="DropDownList2" runat="server" Width="174px" Height="23px">
          <asp:ListItem>--select category--</asp:ListItem>
          <asp:ListItem>Eng-Us</asp:ListItem>
          <asp:ListItem>Eng</asp:ListItem>
          <asp:ListItem>Hindi</asp:ListItem>
          <asp:ListItem>French</asp:ListItem>
          <asp:ListItem>Spanish</asp:ListItem>
          <asp:ListItem>German</asp:ListItem>
          <asp:ListItem>Japanese</asp:ListItem>
          <asp:ListItem>Arabic</asp:ListItem>
          <asp:ListItem>Korean</asp:ListItem>
          
          </asp:DropDownList>
                </td>
                        </tr>
                    <tr>
                <td>
                    <br />
            <h5>Publication Year:-</h5>
                </td>
            <td>
                   <asp:TextBox ID="Publicationyear" runat="server" Height="23px" Width="99px" required></asp:TextBox>    
            </td>
                        </tr>
                    <tr>
            <td>
                <br />
             <h5>Book Image:-</h5>    
           </td>
            <td>
                <asp:FileUpload ID="BookImage" Height="23px"  runat="server" />
            </td>
                        </tr>
                    <tr>
            <td>
                <br />
             <h5>Book Genre:-</h5>
            </td>
            <td>
          <asp:DropDownList class="input-field1" ID="DropDownList1" runat="server" Width="174px" Height="23px">
          <asp:ListItem>--select category--</asp:ListItem>
          <asp:ListItem>biography</asp:ListItem>
          <asp:ListItem>novel</asp:ListItem>
          <asp:ListItem>science</asp:ListItem>
          <asp:ListItem>fantasy</asp:ListItem>
          <asp:ListItem>fiction</asp:ListItem>
          <asp:ListItem>advanture</asp:ListItem>
          <asp:ListItem>kids</asp:ListItem>
          <asp:ListItem>anthology</asp:ListItem>
          <asp:ListItem>classic</asp:ListItem>
          <asp:ListItem>fantasy</asp:ListItem>
          <asp:ListItem>classics</asp:ListItem>
          <asp:ListItem>crime</asp:ListItem>
          <asp:ListItem>drama</asp:ListItem>
          <asp:ListItem>fable</asp:ListItem>
          <asp:ListItem>fairy Tale</asp:ListItem>
          <asp:ListItem>historical Fiction</asp:ListItem>
          <asp:ListItem>horror</asp:ListItem>
          <asp:ListItem>humor</asp:ListItem>
          <asp:ListItem>mystery</asp:ListItem>
          <asp:ListItem>romance</asp:ListItem>
          <asp:ListItem>satire</asp:ListItem>
          <asp:ListItem>short Story</asp:ListItem>
          <asp:ListItem>suspense</asp:ListItem>
          <asp:ListItem>science</asp:ListItem>
          <asp:ListItem>essay</asp:ListItem>
          <asp:ListItem>nonfiction</asp:ListItem>
          <asp:ListItem>reference Books</asp:ListItem>
          <asp:ListItem>self-help Book</asp:ListItem>
          <asp:ListItem>encyclopedia</asp:ListItem>
          <asp:ListItem>speech</asp:ListItem>
          <asp:ListItem>poetry</asp:ListItem>
          <asp:ListItem>religious</asp:ListItem>
          <asp:ListItem>health</asp:ListItem>
          <asp:ListItem>technology</asp:ListItem>
          <asp:ListItem>indian history</asp:ListItem>
          <asp:ListItem>economics</asp:ListItem>
          
      </asp:DropDownList>    
            </td>
                        </tr>
                    <tr>
            <td>
                <br />
                <h5>Average Rating:-</h5>
            </td>
            <td>
                <asp:TextBox ID="Avgrate" runat="server" value="0.0" ReadOnly Height="23px" Width="84px"></asp:TextBox>    
            </td>
                        </tr>
                    <tr>
            <td>
                <br />
               <h5> Rating Count:-</h5>
            </td>
            <td>
                <asp:TextBox ID="Ratecount" runat="server" value="0" ReadOnly Height="23px" Width="81px"></asp:TextBox>    

            </td>
                        </tr>
                    <tr><td>
               <span class="btn12">
                        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   <asp:Button ID="Button2" type="submit" runat="server" class="btn btn-primary" Text="Submit" OnClick="Button2_Click"  />
                        <br />
                        </span>
            </td></tr>

                </table>            
              </div>
              </div>
              </div>
            <br />

                </div>

            </div>        
        </form>
</div>
        
        <footer class="footer">
            <div class="container-fluid">
            </div>
        </footer>

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
