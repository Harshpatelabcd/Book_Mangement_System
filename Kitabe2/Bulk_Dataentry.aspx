<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bulk_Dataentry.aspx.cs" Inherits="Kitabe2.Bulk_Dataentry" %>

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

    <script>
        function validate() {
            var array = ['csv'];
            var xyz = document.getElementById("FileUpload1");

            var Extension = xyz.value.substring(xyz.value.lastIndexOf('.') + 1).toLowerCase();
            if (array.indexOf(Extension) <= -1) {
                alert("Please Upload .csv extension flle");
                return false;
            }
            return true;
        }
    </script>
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
                
                
                <li class="active">
                    <a href="#">
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
                    &nbsp;</div>
            </div>
        </nav>
      
        <form id="form1" runat="server" onsubmit="return validate(this);">            
            <div class="content">
            <div class="container-fluid">
            <div class="row">                      
            <div class="card">

            <div class="header">
                           <p class="category">Book Data Entry</p>
            </div>
            <div class="content">
            <table>    
            <tr>    
            <td>    
            Select CSV File:-    

                </td>    
                <td>    
                    <asp:FileUpload ID="FileUpload1" runat="server" Width="327px" />    
                </td>    
                <td>    
                </td>    
                <td>    
                    <asp:Button ID="Button1" type="Submit" runat="server" Text="Upload" OnClick="Button1_Click"   />    
                </td>    
            </tr>    
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
