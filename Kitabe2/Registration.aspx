<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Kitabe2.Registration" %>

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
      <title>Registration</title>
      <!--Made with love by Mutiullah Samim -->
      <!--Fontawesome CDN-->
      <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous"/>
      <!--Custom styles-->
      <link rel="stylesheet" type="text/css" href="styles.css"/>
      <script src="layout/scripts/jquery.min.js"></script>
      <script>
          function check_Alpha(letters) {
              var regex = /^[a-zA-Z]+$/;
              if (regex.test(letters.first_name.value) == false) {
                  alert("First name must be in alphabets only");
                  letters.fname.focus();
                  return false;
              }
              if (regex.test(letters.last_name.value) == false) {
                  alert("Last name must be in alphabets only");
                  letters.lname.focus();
                  return false;
              }
              var regex1 = /^[0-9]{10}$/;
              if (regex1.test(letters.contact.value) == false) {
                  alert("This is not a valid phone number");
                  letters.phone.focus();
                  return false;
              }
              var regex2 = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,15}$/;
              if (regex2.test(letters.password.value) == false) {
                  alert("Please make sure to use Minimum eight to fifteen characters, at least one letter, one number and one special character:");
                  letters.pass.focus();
                  return false;
              }
              password1 = letters.password.value;
              password2 = letters.Cpassword.value;
              if (password1 != password2) {
                  alert("Password did not match: Please try again...")
                  letters.pass.focus();
                  return false;
              }

              return true;
          }


      </script>
   </head>
   <body class="min-vh-100 bg-info" style="background:url('Image/Back.jpg');">
      <form runat="server" onsubmit="return check_Alpha(this)">
         <div class="min-vh-100  d-flex justify-content-center align-items-center" style="height:auto">
         <div class="my-auto col-md-6">
            <div class="card p-0 col-*">
               <div class="card-header text-center p-0 bg-white border  border-info ">
                  <img src="Image/read.jpg" width="200" class="border border-"/><br />
                  <h3>Registration</h3>
               </div>
               <div class="card-body">
                  <!---------Firstname------------>
                  <div class="row">
                     <div class="col-xs-6 col-sm-6 col-md-6">
                        <div>First name:</div>
                        <label class="sr-only" for="inlineFormInputGroup" id="usercheck0">Username</label>
                        <div class="input-group mb-2">
                           <div class="input-group-prepend">
                              <div class="input-group-text"><span class="fa fa-user-circle"></span></div>
                           </div>
                           <asp:TextBox ID="first_name" runat="server" CssClass="form-control input-sm" placeholder="First Name" required></asp:TextBox>
                           <small class="text-danger p-2" ></small>
                        </div>
                     </div>
                     <!-----------Lastname----------->
                     <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group">
                           <div>Last Name: </div>
                           <label class="sr-only" for="inlineFormInputGroup" id="usercheck1">Username</label>
                           <div class="input-group mb-2">
                              <div class="input-group-prepend">
                                 <div class="input-group-text"><span class="fa fa-user-circle"></span></div>
                              </div>
                              <asp:TextBox ID="last_name" runat="server" CssClass="form-control input-sm" placeholder="Last Name" required></asp:TextBox>
                              <small class="text-danger p-2" ></small>
                           </div>
                           <%--</div>--%>
                        </div>
                    </div>
                        <!---------Roll No--------->
                        <div class="col-xs-6 col-sm-6 col-md-6">
                           <div class="form-group">
                              <div>Username:</div>
                              <label class="sr-only" for="inlineFormInputGroup" id="usercheck8"></label>
                              <div class="input-group mb-2">
                                 <div class="input-group-prepend">
                                    <div class="input-group-text"><span class="fa fa-user"></span></div>
                                 </div>
                                 <asp:TextBox ID="rollno" runat="server" CssClass="form-control input-sm" placeholder="Username" required></asp:TextBox>
                                 <small class="text-danger p-2" ></small>
                              </div>
                           </div>
                        </div>
                        <!------Gender------->
                        <div class="col-xs-6 col-sm-6 col-md-6">
                           <div class="form-group">
                              <div>Gender:</div>
                              <!---<select id="Gender" class="form-control">--->
                              <asp:DropDownList ID="gender" runat="server" CssClass="form-control">
                                 <asp:ListItem Value="">Please select</asp:ListItem>
                                 <asp:ListItem>Male</asp:ListItem>
                                 <asp:ListItem>Female</asp:ListItem>
                              </asp:DropDownList>
                              <!--<option selected>select</option>
                                 <option> Male</option>
                                 <option> Female</option>
                                 <option> Other</option>
                                 
                                 </select>---->
                           </div>
                        </div>
                        <!------------Contact----------->
                        <div class="col-xs-6 col-sm-6 col-md-6">
                           <div class="form-group">
                              <div>Contact:</div>
                              <label class="sr-only" for="inlineFormInputGroup" id="usercheck3"></label>
                              <div class="input-group mb-2">
                                 <div class="input-group-prepend">
                                    <div class="input-group-text"><span class="fa fa-mobile"></span></div>
                                 </div>
                                 <asp:TextBox ID="contact" runat="server" CssClass="form-control input-sm" placeholder="Contact" required></asp:TextBox>
                                 <small class="text-danger p-2" ></small>
                              </div>
                           </div>
                        </div>
                        <!----------Email-------->
                        <div class="col-xs-6 col-sm-6 col-md-6">
                           <div>Email:</div>
                           <label class="sr-only" for="inlineFormInputGroup" id="usercheck7">Username</label>
                           <div class="input-group mb-2">
                              <div class="input-group-prepend">
                                 <div class="input-group-text"><span class="fa fa-envelope"></span></div>
                              </div>
                              <asp:TextBox ID="email" runat="server" CssClass="form-control input-sm" placeholder="Email" TextMode="Email" required></asp:TextBox>
                              <small class="text-danger p-2" ></small>
                              <div class="form-group">
                              </div>
                           </div>
                        </div>
                        <!----------Password------------->
                        <div class="col-xs-6 col-sm-6 col-md-6">
                           <div class="form-group">
                              <div>Password:</div>
                              <label class="sr-only" for="inlineFormInputGroup" id="usercheck5"></label>
                              <div class="input-group mb-2">
                                 <div class="input-group-prepend">
                                    <div class="input-group-text"><span class="fa fa-unlock-alt"></span></div>
                                 </div>
                                 <asp:TextBox ID="password" runat="server" CssClass="form-control input-sm" placeholder="Password" TextMode="Password" required></asp:TextBox>
                                 <small class="text-danger p-2" ></small>
                              </div>
                           </div>
                        </div>
                        <!--------Comform Password---------->
                        <div class="col-xs-6 col-sm-6 col-md-6">
                           <div class="form-group">
                              <div> Confirm Password:</div>
                              <label class="sr-only" for="inlineFormInputGroup" id="usercheck6"></label>
                              <div class="input-group mb-2">
                                 <div class="input-group-prepend">
                                    <div class="input-group-text"><span class="fa fa-unlock"></span></div>
                                 </div>
                                 <asp:TextBox ID="Cpassword" runat="server" CssClass="form-control input-sm" placeholder="Confirm Password" TextMode="Password" required></asp:TextBox>
                                 <small class="text-danger p-2" ></small>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <!----------Password Compare------------->
               <%--  --%>         
               <div class="card-footer text-center bg-white">
                  <asp:Button ID="Button1" runat="server" Text="Sign Up" class="btn btn-primary" type="submit" OnClick="Button1_Click"/>
                  <br/>
                  <a><small>Reset?</small></a>
               </div>
            
         </div>
          </div>
      </form>
   </body>
</html>

