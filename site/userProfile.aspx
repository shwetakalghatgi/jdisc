<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userProfile.aspx.cs"  MasterPageFile="~/Site.Master" Inherits="site.userProfile" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div id="body-container" 
        
        style="position: relative; margin: 0 auto; padding: 0% 2% 2%; top: 0px; left: 0px; height: 295px; width: 793px;">
<table style=" position:relative; width: 689px; margin-left:0px; top: 0px; left: -58px;">
              
           <tr>
                 <td>
                    <asp:Label runat="server" Text="User_Name"></asp:Label>
                 </td>
                 <td>
                    <asp:TextBox runat="server" ID="txtUserName" ></asp:TextBox>
                 </td>
           </tr>
           <tr>
                <td>
                    <asp:Label runat="server" ID="Qualification"></asp:Label>
                </td>
                <td>
                    <asp:TextBox runat="server" ID="txtQuali"></asp:TextBox>
                </td>
           </tr>
           <tr>
                <td>
                   <asp:FileUpload ID="fuImportImage" runat="server" />
                   <%--<asp:RegularExpressionValidator ID="regexValidator" runat="server" ControlToValidate="fuImportImage"  ValidationExpression="(\.\*\.([Jj][Pp][Gg])\|\.\*\.([Pp][Nn][Gg])\|\.\*\.([Gg][Ii][Ff])\|\*\.([Jj][Pp][Ee][Gg])\$)"></asp:RegularExpressionValidator>
                   --%>
              </td>
           </tr>
           <tr>
                  <td>
                    <asp:Button runat="server" ID="btnSubmit" Text="Submit" 
                          onclick="btnSubmit_Click" />
                  </td>
           </tr>

        </table>
    </div>
    


</asp:Content>
