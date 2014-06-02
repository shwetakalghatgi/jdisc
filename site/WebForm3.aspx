<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="WebForm3.aspx.cs" Inherits="site._Default" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
<style type="text/css">
.btngoogle
{
    background-image:url(images/google+login+button.png);
    border:1px solid white;
    cursor:pointer;
    }
</style>
<script type="text/javascript">
    function showimage() {
        var i = document.getElementById("imggoogle");
        i.src = "images/google+logout+button.png";
        i.style.border = "1px solid white";
    }

</script>


    <div id="loginform">
        
        <div id="NotLoggedIn" runat="server">
            <table>
                <tr>
                    <td>
                        <asp:Button ID="btnLoginToGoogle" runat="server"  OnCommand="OpenLogin_Click" 
                            ToolTip="Google_Login" CssClass="btngoogle"
                            CommandArgument="https://www.google.com/accounts/o8/id" Height="34px" 
                            Width="143px" />
                    </td>
                </tr>
            </table>
            
            <asp:Label runat="server" ID="lblAlertMsg" />
        </div>
    </div>
   
    <asp:Label ID="lblname" runat="server"></asp:Label>
    <asp:Label ID="lblemail" runat="server"></asp:Label>
    <asp:Label ID="lblbirthdate" runat="server"></asp:Label>
    <asp:Label ID="lblphone" runat="server"></asp:Label>
    <asp:Label ID="lblgender" runat="server"></asp:Label>
    <a id="btngmaillogout" runat="server" onserverclick="btngmaillogout_click">   
        <img src="http://accounts.google.com/logout" id="imggoogle" title="Google_LogOut" onerror="javascript:return showimage();" /> 
    </a>
   
</asp:Content>
