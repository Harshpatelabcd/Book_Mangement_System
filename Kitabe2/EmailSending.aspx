<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmailSending.aspx.cs" Inherits="Kitabe2.Login" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">  

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <meta charset="utf-8"/>
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <script src="bootstrap/jquery.min.js"></script>
      <link href="bootstrap/bootstrap.css" rel="stylesheet" />
      <link href="bootstrap/mdb.min.css" rel="stylesheet" />
      <script src="bootstrap/popper.min.js"></script>
      <script src="bootstrap/bootstrap.min.js"></script>
      <script src="bootstrap/mdb.min.js"></script>
      <title>Send OTP</title>

</head>
<body class="min-vh-100 bg-info" style="background:url('Image/Back.jpg');">
      <div class="min-vh-100 d-flex justify-content-center align-items-center" style="height:auto">
         <div class="my-auto col-md-4">
            <div class="card p-0">
               <div class="card-header text-center p-0 bg-white">
                  <img src="Image/read.jpg"  class="w-50"/>
                  <h3>Send OTP</h3>
               </div>
               <form id="form1" runat="server">
                  <div class="card-body text-center" >
                     <div>
                        <!-- Button to Open the Modal -->
                        Name:
                        <asp:TextBox type="text" ID="TextBox1" runat="server"></asp:TextBox>
                        <br/> <br/>
                        Email: 
                        <asp:TextBox type="text" ID="txtEmail" runat="server"></asp:TextBox>
                        <br/> <br/>
                         
                        <asp:Button ID="Button3" runat="server" Text="Send OTP" OnClick="Button1_Click1"  CssClass="btn btn-success"/>
                      
                        <a class="nav-link" href="VerifyOTP.aspx"  onclick="Button_Click1">OTP <span class="sr-only">(current)</span></a>
                        <!--    <asp:Button ID="btnShow" runat="server" Text="Verify OTP"  onclick="Button1_Click1" CssClass="btn btn-primary" />--->
                        <asp:Label ID="lblMessage" runat="server"></asp:Label>
                     </div>
                  </div>
               </form>
            </div>
         </div>
      </div>
   </body>
</html>
