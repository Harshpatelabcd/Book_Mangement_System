<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Searchbook1.aspx.cs" Inherits="Kitabe2.Searchbook1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <meta charset="utf-8"/>
  <meta content="width=device-width, initial-scale=1.0" name="viewport"/>

  <title>Book Recommendation</title>
  <meta content="" name="description"/>
  <meta content="" name="keywords"/>

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon"/>
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon"/>

    
    <link href="Bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Bootstrap/css/star-rating.css" rel="stylesheet" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="Bootstrap/js/star-rating.js"></script>
    

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
    <style>
        #Label9{
            font-size:2px;
            color:dimgrey;
            font-style:italic;
        }
        .d1{
            height:700px;
            width:1050px;
            padding-left:100px;
                        
        }
        .image{
            font-family: "Times New Roman", Times, serif;
            font-size: 30px;
            font-weight:bold;
            color:lightseagreen;
        }
        .s1{
            padding-left:10px;
            color:black;
            font-size:20px;
            font-style:italic;
            font-family: "Times New Roman", Times, serif;
        }
        .sub-heading{
            font-weight:bold;
            color:Highlight;
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
  <script type="text/javascript" src="NivoSlider/jquery.nivo.slider.js"></script>
  <script type="text/javascript">
      $(window).load(function () {
          $('#slider').nivoSlider();
          $('#slider1').nivoSlider();
      });
      
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
            <li><a href="Homepage1.aspx">Home</a></li>
            <li class="active">Book Details</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->
      
    <!-- ======= Portfolio Details Section ======= -->
    <section id="portfolio-details" class="portfolio-details">
      <div class="container">

      <div class="portfolio-details-container" data-aos="fade-up" data-aos-delay="100">

    <form id="form1" runat="server" method="POST">
            <div class="content table-responsive table-full-width">          
            
            <br />
            <br />
 
                <div class="d1">
            <asp:DataList ID="DataList1" runat="server" DataKeyField="Book_id" BorderStyle="Solid" DataSourceID="SqlDataSource1" RepeatColumns="1" RepeatDirection="Horizontal"  BorderColor="Black" >
                            <ItemTemplate>
                                <table class="table table-borderless">
                                       <tr>
                                       <td>
                                            <asp:Image ID="Image1" runat="server" Width="250px" Height="400px" ImageUrl='<%# Eval("Image_Url") %>' />
                                           <br /> 
                                           <br />
                                       </td>                                    
                                       <td>
                                           
                                            <span><strong class="s1"></strong></span>
                                            <asp:Label ID="Label3" class="image" runat="server" Text='<%# Eval("Origian_Title") %>'></asp:Label>    
                                            <br />
                                           <br />
                                            <span><strong class="s1">ISBN number:</strong></span>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Isbn") %>'></asp:Label>                                      
                                            <br />
                                           <br />
                                            <span><strong class="s1">Authors:</strong></span>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Author_name") %>'></asp:Label>    
                                            <br />
                                           <br />
                                            <span><strong class="s1">Genre of book:</strong></span>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("Book_Genre") %>'></asp:Label>    
                                            <br />
                                           <br />
                                          
                                           <span><strong class="s1">Publication Year:</strong></span>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("Original_Publicationyear") %>'></asp:Label>    
                                            <br />
                                           <br />
                                           <span><strong class="s1">Language:</strong></span>
                                            <asp:Label ID="Label7" runat="server" Text='<%# Eval("Language") %>'></asp:Label>    
                                            <br />
                                           <br />
                                           <span><strong class="s1">Average Rating:</strong></span>
                                            <asp:Label ID="Label8" runat="server" Text='<%# Eval("average_rating") %>'></asp:Label>    
                                          
                                       </td>
                                       </tr>   
                                </table>
                      
                                
                            </ItemTemplate>   
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\HARSH\source\repos\Kitabe2\Kitabe2\App_Data\Kitabe.mdf;Integrated Security=True"  SelectCommand="SELECT [Id],[Book_id],[Image_Url],[Isbn],[Origian_Title],[Author_name],[Book_Genre],[Original_Publicationyear],[Language],[average_rating] FROM [Book_Master2] WHERE (Id = @Id)">
               <SelectParameters>
               <asp:QueryStringParameter Name="Id" QueryStringField="Id" Type="Decimal"/>
               </SelectParameters>
               </asp:SqlDataSource>
     

     
    <section id="portfolio1" class="portfolio">
      <div class="container">

        <div class="section-title" data-aos="fade-left">
          <h2>Similar Genre</h2>
          
            
        </div>
          <br />
            <br />
            
          <div class="slider-wrapper theme-dark">
          <div id="slider1" class="nivoSlider">
              <asp:repeater id="repeaterNivoSlider2" runat="server">
                  <itemtemplate>
               <a href='<%#"Searchbook1.aspx?Id="+Eval("Id")%>'>
                          <img src='<%# Eval("Image_Url") %>' 
                               height="100" width="90" />
               </a>
                   </itemtemplate>
              </asp:repeater>
          </div>
      </div>
        </div>
    </section><!-- End Portfolio Section -->
    


                    <p class="sub-heading"><asp:Image ID="Image2" runat="server" Height="35" Width="35" ImageUrl="~/Image/comment.png" />
                    Write your Review</p>
                   <hr color="blue" style="border-style: solid" />

                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:Image ID="Image1" runat="server" Height="40" Width="40" ImageUrl="~/Image/user45.jpg" />
                <b><asp:Label ID="Label5" runat="server"></asp:Label>
                    </b><br /><br />
                    <b>Rating:-</b>
               <ajaxToolkit:Rating ID="Rating1" runat="server" AutoPostBack="true" StarCssClass="blankstar"  
                WaitingStarCssClass="Halfstar" FilledStarCssClass="shiningstar" OnClick="Rating1_Changed" 
                EmptyStarCssClass="blankstar">  
                       </ajaxToolkit:Rating>   
                    <br />
                    <br />
                    <br />
                    <b>Comment:-<br /></b>
                    <asp:TextBox ID="txtComment" runat="server" Height="93px" placeholder="Write your opinion about book..." TextMode="MultiLine" Width="550px" ValidationGroup="AB"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Button ID="btn_Submit" runat="server" Text="Post" OnClick="btn_Submit_Click" CssClass="buttonSubmit" ValidationGroup="AB" />
                    <asp:HiddenField ID="hfSelectedRecord" runat="server" />
                    <hr />
                    <br />
                    
                    <p class="sub-heading"><asp:Image ID="Image3" runat="server" Height="35" Width="35" ImageUrl="~/Image/comment.png" />Community Reviews</p>
                                 <hr color="blue" style="border-style: solid" />
      
                    <!-- EXISTING REVIEWS AND RATINGS --->

                <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                <itemtemplate>
                    <div class="commentbox">
                        <b>
                            <%--old code--%>

                       <%-- <asp:Label ID="Label1" runat="server" Text='<%#Eval("Name") %>'>'></asp:Label></b> <br /><br />  (<asp:Label ID="Label2" runat="server" Text='<%#Eval("Email") %>'>'></asp:Label>):<br /><br />
                        <asp:Label ID="Label3" runat="server" Text='<%#Eval("Comment") %>'></asp:Label><br /><br />
                        <asp:Label ID="Label5" runat="server" Text="Rating : "></asp:Label>
                         <asp:Label ID="Label4" runat="server" Text='<%#Eval("Marks") %>'></asp:Label><br />--%>
                    
                        <asp:Image ID="Image1" runat="server" Height="40" Width="40" ImageUrl="~/Image/user45.jpg" />
                        <asp:Label ID="Label2" runat="server" Text='<%#Eval("Reader_Username") %>'></asp:Label> 
                        </b>
                       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    <asp:Label ID="Label9" runat="server"  Text='<%#Eval("Review_postdate") %>' Font-Size="Smaller"></asp:Label> 

                        

                            <ajaxToolkit:Rating ID="Rating2" runat="server" AutoPostBack="true" StarCssClass="blankstar1"  
                   WaitingStarCssClass="Halfstar1" FilledStarCssClass="shiningstar1" OnClick="Rating1_Changed" 
                EmptyStarCssClass="blankstar1" CurrentRating='<%# Eval("Rating") %>'>  
                       </ajaxToolkit:Rating>
                           
                        <asp:Label ID="Label6" runat="server" Text='<%#Eval("Review_Desc") %>'></asp:Label><br /><br />
                        <hr color="black" style="border-style: groove" />
</itemTemplate>
            </asp:Repeater>
            <div style="overflow: hidden;">
                <asp:Repeater ID="rptPaging" runat="server" OnItemCommand="rptPaging_ItemCommand">
                    <Itemtemplate>
                        <asp:LinkButton ID="btnPage"
                            Style="padding: 8px; margin: 2px; background: #007acc; border: solid 1px blue; font: 8px;"
                            CommandName="Page" CommandArgument="<%# Container.DataItem %>"
                            runat="server" ForeColor="White" Font-Bold="True" CausesValidation="false"><%# Container.DataItem %>
                        </asp:LinkButton>
                    </Itemtemplate>
                </asp:Repeater>
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
