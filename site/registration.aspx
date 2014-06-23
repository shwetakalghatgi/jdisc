<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="site.registration" %>

    <asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
        <div id="body-container" 
        
            style="position: relative; margin: 0 auto; padding: 0% 3.2% 2%; top: 34px; left: 0px; height: 304px;">
      
            <div>
                <table style="height: 173px; margin-top: 42px">
                    <tr>
                        <td>
                         <asp:Label runat="server" Text="Name">
                         </asp:Label>
                         <asp:Label ID="Label2" runat="server" ForeColor="Red">*</asp:Label>
                         </td>
                         <td>
                         <asp:TextBox runat="server" ID="txtName"></asp:TextBox>
                         </td>
                     </tr>
                     <tr>
                        <td>
                            <asp:Label runat="server" Text="Password">
                            </asp:Label>
                            <asp:Label ID="Label1" runat="server" ForeColor="Red">*</asp:Label>

                        </td>
                        <td>
                            <asp:TextBox  runat="server" ID="txtPassword"></asp:TextBox>
                        </td>
                     </tr>
                     <tr>
                        <td>
                            <asp:Label runat="server" Text="Email ID"></asp:Label>
                            <asp:Label ID="Label3" runat="server" ForeColor="Red">*</asp:Label>
                             
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtEmail"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="regexValidator" runat="server"
                                 ControlToValidate="txtEmail"
                                 ErrorMessage="Not a valid EmailId"
                                  ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"> 
                                
                            </asp:RegularExpressionValidator>
                        </td>
                     </tr>
                     <tr>
                        <td>
                            <asp:Label runat="server" ID="lblAlert" ForeColor="Red"></asp:Label>
                        </td>
                     </tr>
                     <tr>
                        <td>
                            <asp:Button runat="server" ID="btnReg" Text="Register" onclick="btnReg_Click"  />
                        </td>
                        <td>
                            <asp:Button runat="server" ID="btnReset" Text="Reset" 
                                onclick="btnReset_Click" />
                        </td>
                     </tr>
                </table>
            </div>
       </div>
    </asp:Content>

