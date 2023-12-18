<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search_History.aspx.cs" Inherits="Kitabe2.Search_History" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
  <meta content="width=device-width, initial-scale=1.0" name="viewport"/>

  <title>Home page</title>
  <meta content="" name="description"/>
  <meta content="" name="keywords"/>

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon"/>
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon"/>

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet"/>

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
  <link href="assets/vendor/icofont/icofont.min.css" rel="stylesheet"/>
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet"/>
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet"/>
  <link href="assets/vendor/venobox/venobox.css" rel="stylesheet"/>
  <link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet"/>
  <link href="assets/vendor/aos/aos.css" rel="stylesheet"/>

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet"/>

  <!-- =======================================================
  * Template Name: Bethany - v2.2.1
  * Template URL: https://bootstrapmade.com/bethany-free-onepage-bootstrap-theme/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script type="text/javascript" src="NivoSlider/jquery.nivo.slider.js"></script>
  <script type="text/javascript">
      $(window).load(function () {
          $('#slider').nivoSlider();
      });
  </script>
    <script>
        function AlertIt() {
            var answer = confirm("Please click OK to Logout.")
            if (answer)
                window.location = "https://localhost:44390/Login1.aspx";
        }
    </script>
    <style>
     .d1{
            height:700px;
            width:1000px;
            padding-left:20px;
                        
        }
          .blankstar {  
         background-image: url(Image/blank_star1.png);  
         width: 40px;  
         height: 40px;  
}  
        .waitingstar {  
         background-image: url(Image/half_star1.png);  
         width: 40px;  
         height: 40px;  
}  
        .shiningstar {  
        background-image: url(Image/shining_star1.png);  
        width: 40px;  
        height: 40px;  
}  
        .blankstar1 {  
         background-image: url(Image/blank_star.png);  
         width: 30px;  
         height: 30px;  
}  
        .waitingstar1 {  
         background-image: url(Image/half_star.png);  
         width: 30px;  
         height: 30px;  
}
        .shiningstar1 {
            background-image: url(Image/shining_star.png);
            width: 30px;
            height: 30px;
        }
    </style>

</head>
<body>
    <!-- ======= Header ======= -->
  <header id="header" class="fixed-top d-flex align-items-center">
    <div class="container">
      <div class="header-container d-flex align-items-center">
        <div class="logo mr-auto">
          <h1 class="text-light"><a href="index.html"><span>Kitabe</span></a></h1>
          <!-- Uncomment below if you prefer to use an image logo -->
          <!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
        </div>            
          <nav class="nav-menu d-none d-lg-block">
          <ul>
            <li><a href="Homepage1.aspx">Home</a></li>
            <li><a href="Searchbook.aspx">Search Book</a></li>
            <li class="active"><a href="#">View Search History</a></li>
            <li><a href="View_Recommendation.aspx">Recommandations</a></li>
            <li><a href="Homepage1.aspx">Top rated Books</a></li>
            <li class="get-started"><a href="javascript:AlertIt();">Log Out</a></li>
          </ul>
        </nav><!-- .nav-menu -->
        </div><!-- End Header Container -->
    </div>
  </header><!-- End Header -->
    <section>
    <div>
    </div>
  </section><!-- End Hero -->


  
<main id="main">
    
    <!-- ======= About Section ======= -->    
      <form id="form1" runat="server">
                <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">  
    </asp:ScriptManager> 

    <!-- ======= Portfolio Section ======= -->
    <section id="portfolio" class="portfolio">
         <div class="container">

         <div class="section-title" data-aos="fade-left">
          <h2>Welcome <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label></h2>
          <p>Your Previously Rated Books...</p>
        </div>
       <br />
       <br />
       <br />
      
        
         <div class="content table-responsive table-full-width">
            <br />
            <br />
             <div class="d1">
            <asp:DataList ID="DataList1" runat="server"  BorderColor="Black" BorderStyle="Solid" RepeatColumns="3" RepeatDirection="Horizontal" >
                            <ItemTemplate>
                                <table class="table table-borderless">
                                       <tr>
                                       <td>
                                            <asp:Image ID="Image1" runat="server" height="350px" Width="250px" ImageUrl='<%# Eval("Image_Url") %>' />
                                       </td>                                    
                                       <td>
                                       </tr>
                                        <tr>
                                        <td>
                                            <span><strong class="s1"> </strong></span>
                                                                                       
                                            <asp:LinkButton ID="lnkname" runat="server" Text='<%#Eval("Origian_Title") %>' PostBackUrl='<%#"~/Searchbook1.aspx?Id="+Eval("Id")%>'>
                                            </asp:LinkButton>
                                        </td>
                                            </tr>
                                    <tr>
                                        <td>
                                           <span><strong class="s1">By </strong></span>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Author_name") %>'></asp:Label>    
                                            <br />                                            
                                            <span><strong class="s1">Your Rating: </strong></span>
                                            <ajaxToolkit:Rating ID="Rating2" runat="server" AutoPostBack="true" StarCssClass="blankstar1"  
                                            WaitingStarCssClass="Halfstar1" FilledStarCssClass="shiningstar1" 
                                            EmptyStarCssClass="blankstar1" CurrentRating='<%# Eval("Rating") %>'>  
                                            </ajaxToolkit:Rating>
                                       </td>
                                     </tr>   
                                     
                                </table>
                                <br />
                                <br />
                            </ItemTemplate>
                        </asp:DataList>
                 </div>
                </div>
        </div>
    </section><!-- End Portfolio Section -->
          
<!-- End #main -->
              
</form>
  </main><!-- End #main -->
    

  <!-- ======= Footer ======= -->
 <footer id="footer">

    <div class="container d-md-flex py-4">

      <div class="mr-md-auto text-center text-md-left">
        <div class="copyright">
          &copy; Copyright <strong><span>Bethany</span></strong>. All Rights Reserved
        </div>
        <div class="credits">
          <!-- All the links in the footer should remain intact. -->
          <!-- You can delete the links only if you purchased the pro version. -->
          <!-- Licensing information: https://bootstrapmade.com/license/ -->
          <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/bethany-free-onepage-bootstrap-theme/ -->
          Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
        </div>
      </div>
      <div class="social-links text-center text-md-right pt-3 pt-md-0">
        <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
        <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
        <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
        <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
        <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
      </div>
    </div>
  </footer><!-- End Footer -->


  <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/jquery/jquery.min.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/jquery.easing/jquery.easing.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
  <script src="assets/vendor/waypoints/jquery.waypoints.min.js"></script>
  <script src="assets/vendor/counterup/counterup.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/venobox/venobox.min.js"></script>
  <script src="assets/vendor/owl.carousel/owl.carousel.min.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>
    
</body>
</html>
