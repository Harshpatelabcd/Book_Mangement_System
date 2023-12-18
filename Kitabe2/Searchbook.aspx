<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Searchbook.aspx.cs" Inherits="Kitabe2.Searchbook" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
        
  <meta charset="utf-8"/>
  <meta content="width=device-width, initial-scale=1.0" name="viewport"/>

  <title>Book Recommendation</title>
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
    <link href="Bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Bootstrap/css/star-rating.css" rel="stylesheet" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="Bootstrap/js/star-rating.js"></script>

    

    <style>
        .image{
            font-size:25px;
            font-weight:bold;
            color:black;
        }
        .s1{
            color:lightseagreen;
            font-size:15px;
            font-style:italic;
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
            <li ><a href="Homepage1.aspx">Home</a></li>
            <li class="active"><a href="#">Search Book</a></li>
            <li><a href="Search_History.aspx">View Search History</a></li>
            <li><a href="View_Recommendation.aspx">Recommandations</a></li>
            <li><a href="Homepage1.aspx">Top rated Books</a></li>
            <li class="get-started"><a href="javascript:AlertIt();">Log Out</a></li>
          </ul>
        </nav><!-- .nav-menu -->
      </div><!-- End Header Container -->
    </div>
  </header><!-- End Header -->

  <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>Book Details</h2>
          <ol>
            <li><a href="index.html">Home</a></li>
            <li>Book Details</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= Portfolio Details Section ======= -->
    <section id="portfolio-details" class="portfolio-details">
      <div class="container">

      <div class="portfolio-details-container" data-aos="fade-up" data-aos-delay="100">

        <form id="form1" runat="server">
    
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">  
    </asp:ScriptManager> 
        <div>
             &nbsp; &nbsp;<asp:TextBox ID="TextBox1" class="input-field1" runat ="server" OnTextChanged="Search" AutoPostBack="true" Width="350px" placeholder="enter book title"></asp:TextBox>
             <ajaxToolkit:AutoCompleteExtender ServiceMethod="GetCompletionList" MinimumPrefixLength="1"  
                    CompletionInterval="10" EnableCaching="false" CompletionSetCount="1" TargetControlID="TextBox1"  
                    ID="AutoCompleteExtender1" runat="server" FirstRowSelected="false">  
                </ajaxToolkit:AutoCompleteExtender>
                        &nbsp&nbsp&nbsp&nbsp;<asp:Button type="reset" ID="Button2" runat="server" CssClass="btn btn-info"  Text="Search" OnClick="Button1_Click" />
           
          
          
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           
          
          
 &nbsp; &nbsp;<asp:DropDownList class="input-field1" ID="DropDownList1" runat="server" Width="350px">
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
     &nbsp&nbsp&nbsp&nbsp;<asp:Button type="reset" ID="Button1" runat="server" CssClass="btn btn-info"  Text="Search" OnClick="Button1_Click" />

<hr />          
            <div class="content table-responsive table-full-width">
            <br />
            <br />

            <asp:DataList ID="DataList1" runat="server" DataKeyField="Book_id" BorderColor="Black" BorderStyle="Solid" RepeatColumns="3" RepeatDirection="Horizontal" >
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
                                           <span><strong class="s1">Language:</strong></span>
                                            <asp:Label ID="Label8" runat="server" Text='<%# Eval("Language") %>'></asp:Label>    
                                            <br />
                                       </td>
                                       </tr>   
                                     
                                </table>
                                <br />
                                <br />
                            </ItemTemplate>
                        </asp:DataList>
                </div>
        </div>
                
    </form>        
         
      </div>
          </div>
    </section><!-- End Portfolio Details Section -->

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
