<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login1.aspx.cs" Inherits="Kitabe2.Login1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <script src="bootstrap/jquery.min.js"></script>
    <link href="bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="bootstrap/mdb.min.css" rel="stylesheet" />
    <script src="bootstrap/popper.min.js"></script>
    <script src="bootstrap/bootstrap.min.js"></script>
    <script src="bootstrap/mdb.min.js"></script>
	<title>Login Page</title>

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous"/>
        
	<!--Custom styles-->
	<link rel="stylesheet" type="text/css" href="styles.css"/>

    <script src="js/jquery.validate.min.js"></script> <!---//Script found online--->
    <script src="http://code.jquery.com/jquery-1.10.2.min.js"> </script>
        <script>
            $(document).ready(function () {

                var user = $("#Username");
                var pass = $("#Password");

                $("#btnLogin").click(function (e) {
                    var u = user.val();
                    var p = pass.val();
                    if (u == "" || p == "") {
                        alert("Username and Passsword is required!");
                    } else {
                        $("#formsubmit").submit();
                    }
                });
            }); // end document.ready
        </script>
</head>
<body class="min-vh-100 bg-info" style="background:url('Image/Back.jpg');">
<div class="min-vh-100 d-flex justify-content-center align-items-center" style="height:auto">
    
        <div class="my-auto col-md-4">
            <div class="card p-0">
                <div class="card-header text-center p-0 bg-white">
                    <img src="Image/read.jpg"  class="w-50"/>
                    <h3>Login</h3>

                </div>
                <div class="card-body">
                    <form id="loginForm" runat="server">
                        <div class="col-auto">
                            <label class="sr-only" for="inlineFormInputGroup" id="usercheck">Username</label>
                            <div class="input-group mb-2">
                            <div class="input-group-prepend">
                                <div class="input-group-text"><span class="fa fa-user"></span></div>
                            </div>
                                 
                                <asp:TextBox ID="Username" runat="server" cssClass="form-control" placeholder="Username" ></asp:TextBox>
                            </div>
                        </div>
                         <div class="col-auto">
                            <label class="sr-only" id="passwordcheck" for="inlineFormInputGroup">Password</label>
                            <div class="input-group mb-2">
                            <div class="input-group-prepend">
                                <div class="input-group-text"><span class="fa fa-key"></span></div>
                            </div>
                                <asp:TextBox ID="Password" runat="server" Type="Password" cssClass="form-control" placeholder="Password"></asp:TextBox>
                            </div>
                        </div>
                         <div class="card-footer text-center bg-white">
                     <asp:Button type="submit" ID="btnsubmit" runat="server"  CssClass="btn btn-primary" Text="Login" onclick="Login_Click"></asp:Button><br/>
                    
                    
                    <div class="nav-item active">
                        <a class="nav-link" href="Registration.aspx">Sign Up <span class="sr-only">(current)</span></a>
                    </div>
                </div>
                    </form>
                </div>
               
                 
            </div>
        </div>

    
</div>
 
</body>
</html>