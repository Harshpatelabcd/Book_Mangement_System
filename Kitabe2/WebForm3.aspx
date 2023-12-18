<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="Kitabe2.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
 <script type="text/javascript">
      $(window).load(function () {
          $('#slider').nivoSlider();
      });
 </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
            <br />
            <div class="slider-wrapper theme-dark">
          <div id="slider" class="nivoSlider">
              <asp:repeater id="repeaterNivoSlider" runat="server">
                  <itemtemplate>
               <a href='<%#"Searchbook1.aspx?Id="+Eval("Id")%>'>
                          <img src='<%# Eval("Image_Url") %>' 
                               />
               </a>
                   </itemtemplate>
              </asp:repeater>
          </div>
      </div>
            <asp:ListBox ID="ListBox1" runat="server"></asp:ListBox>

        </div>
    </form>
</body>
</html>
