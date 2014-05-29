<%@ Page Title="" Language="C#"  AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="site.Login"  MasterPageFile="~/Site.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    
   

   
    <div id="body-container" 
        style="position: relative; margin: 0 auto; padding: 0% 3.2% 2%; top: 0px; left: 0px; height: 295px;">
        <div id="login-box">
            
                    <table style="height: 226px; margin-top: 71px">
                        <tr>
                            <td valign="middle">
                                <div id="login-box-name" style="margin-top: 20px;">
                                    <asp:Label ID="lblUserName" Style="margin-top: 20px;" runat="server" 
                                        Text="User Name"></asp:Label>
                                </div>
                            </td>
                            <td>
                                <div style="margin-top: 20px;">
                                    <asp:TextBox ID="txtUserName" runat="server" size="30" class="form-login" AutoCompleteType="Disabled"
                                        MaxLength="10"></asp:TextBox>

                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td valign="middle">
                                <div style="margin-top: 20px;margin-right:10px;">
                                    <asp:Label ID="PasswordLabel" runat="server" >Password</asp:Label>
                                </div>
                            </td>
                            <td>
                                <div style="margin-top: 20px;">
                                    <asp:TextBox ID="txtPassword" runat="server" class="form-login" TextMode="Password"
                                        size="30" MaxLength="10"></asp:TextBox>
                                    
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td align="left" valign="middle">
                                <div>
                                    <br />
                                    <asp:CheckBox ID="RememberMe" runat="server" Text="Remember Me  " />
                                    <br />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            
                            <td align="left" valign="middle" colspan="2">
                                <div style="padding-bottom: 26px;">
                                    <asp:Button ID="btnSignIn" runat="server" CssClass="button"
                                        Text="Sign In"  OnClick="btnSignIn_Click" Width="125px"
                                        Height="30px" style="margin-left: 13px" />
                                        <asp:Button ID="btnSignUp" runat="server"  CssClass="button" 
                                        Text="Sign Up"  OnClick="btnSignUp_Click" Width="131px"
                                        Height="30px" />
                                </div>
                           
                         
                                
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div class="literal-control">
                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                </div>
                            </td>
                        </tr>
                    </table>
                
        </div>
    </div>
</asp:Content>

