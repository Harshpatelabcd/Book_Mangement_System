<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Dashboard2.aspx.cs" Inherits="Kitabe2.Admin_Dashboard2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
	<link rel="icon" type="image/png" href="assets/img/favicon.ico"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>Light Bootstrap Dashboard by Creative Tim</title>

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
                <li class="active">
                    <a href="#">
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
                   
            </ul>	</div>
    </div>

    <div class="main-panel">
  
         <form id="form1" runat="server">
             
          <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                          <b><h5>Top 10 active readers...</h5></b>
             <p>Following are list of user's who have given rating on most books. </p>
             <ajaxToolkit:LineChart ID="LineChart1" runat="server" ChartHeight="400" ChartWidth ="900"
    ChartType="Basic" ChartTitleColor="#0E426C" Visible="True"
    CategoryAxisLineColor="#D08AD9" ValueAxisLineColor="#D08AD9" BaseLineColor="#A156AB" Width="959px"></ajaxToolkit:LineChart>
        <br />
             <asp:Button ID="Button1" runat="server" Text="Next Page" OnClick="Button1_Click" />
            
         </form>  

        <footer class="footer">
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

