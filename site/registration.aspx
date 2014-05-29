<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="site.registration" %>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div id="body-container" 
        
        style="position: relative; margin: 0 auto; padding: 0% 3.2% 2%; top: 34px; left: 0px; height: 304px;">
        <div style="margin-left: 0px">
        <p style="margin-left: 0px"> Note:You can use the credentials of Your E-Mail account for sign up.To do this,just<br />
         click on "Send Email" button which will send an E-Mail to Your account.<br />
         On clicking the  link sent in Your Mail ,You will get registered and You will be redirected to Login Page.<br />
         If You do not wish to do this You can register by filling the details below </p>
         <asp:Button runat="server" ID="btnSendEmail" onclick="btnSendEmail_Click"  Text="Send EMail" />
        </div>
        <div>
        <table style="height: 173px; margin-top: 42px">
            <tr>
                <td>
                 <asp:Label runat="server" Text="Name">
                 </asp:Label>
                 </td>
                 <td>
                 <asp:TextBox runat="server" ID="txtName"></asp:TextBox>
                 </td>
             </tr>
             <tr>
                <td>
                    <asp:Label runat="server" Text="Password">
                    </asp:Label>
                </td>
                <td>
                    <asp:TextBox  runat="server" ID="txtPassword"></asp:TextBox>
                </td>
             </tr>
             <tr>
                <td>
                    <asp:Label runat="server" Text="Email ID"></asp:Label>
                </td>
                <td>
                    <asp:TextBox runat="server" ID="txtEmail"></asp:TextBox>
                </td>
             </tr>
             <tr>
                <td>
                    <asp:Button runat="server" ID="btnReg" Text="Register" onclick="btnReg_Click" />
                </td>
                <td>
                    <asp:Button runat="server" ID="btnReset" Text="Reset" />
                </td>
             </tr>
        </table>
        </div>
   </div>
</asp:Content>

