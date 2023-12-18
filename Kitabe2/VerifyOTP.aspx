<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VerifyOTP.aspx.cs" Inherits="Kitabe2.VerifyOTP" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
   <head runat="server">
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <script src="bootstrap/jquery.min.js"></script>
      <link href="bootstrap/bootstrap.css" rel="stylesheet" />
      <link href="bootstrap/mdb.min.css" rel="stylesheet" />
      <script src="bootstrap/popper.min.js"></script>
      <script src="bootstrap/bootstrap.min.js"></script>
      <script src="bootstrap/mdb.min.js"></script>
      <title>Verify OTP</title>
      <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
      <!--Custom styles-->
     
</head>
 <body class="min-vh-100 bg-info" style="background:url('Image/Back.jpg');">
      <div class="min-vh-100 d-flex justify-content-center align-items-center" style="height:auto">
         <div class="my-auto col-md-4">
            <div class="card p-0">
               <div class="card-header text-center p-0 bg-white">
                  <img src="Image/read.jpg"  class="w-50"/>
                  <h3>Verify OTP</h3>
               </div>
                <form id="form1" runat="server">
        <div class="card-body text-center">
            <div>
            OTP:
        <asp:TextBox ID="txtOTP" runat="server" Width="241px"></asp:TextBox><br/> <br/>
             
        
            
                <asp:Button ID="Button3" runat="server" Text="Verify OTP" OnClick="Button1_Click" CssClass="btn btn-success" />
                             <br />
            <asp:Label ID="lblMessage" runat="server" style="color: #FF0000" Text=""></asp:Label>
        </div>
            </div>
    </form>
                </div>
                </div>
          </div>
</body>
</html>

