<%@ Page Language="C#" AutoEventWireup="true"  Title="Add New Topic" CodeBehind="addNewTopic.aspx.cs" Inherits="site.addNewTopic" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="body-container" 
        
        style="position: relative; margin: 0 auto; padding: 0% 3.2% 2%; top: -5px; left: 0px; height: 318px;">
    <table style=" position:relative; height: 235px; margin-top: 51px; margin-left:0px; top: 16px; left: -141px; width: 416px;">
        <tr>
            <td style="width: 197px">
                <asp:Label ID="Label1" runat="server"  Text="Topic_Title"></asp:Label>
                <asp:Label ID="Label3" runat="server" ForeColor="Red">*</asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtTitleName" runat="server"></asp:TextBox>
            </td>
         </tr>
        <tr>
            <td style="width: 197px">
                <asp:Label runat="server" Text="Author_Name"></asp:Label>
                <asp:Label ID="Label4" runat="server" ForeColor="Red">*</asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtTitleAuthor" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 197px">
                <asp:Label ID="Label2" runat="server" Text="Subject"></asp:Label>
                <asp:Label ID="Label5" runat="server" ForeColor="Red">*</asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtSubject" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="width: 197px">
                <asp:FileUpload ID="fileUpload" runat="server" Width="272px" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lblAlert" ForeColor="Red"></asp:Label>
            </td>
        </tr>
       <tr>
        <td style="width: 197px">
            
            <asp:Button Text="create" runat="server" onclick="create_Click" />
        </td>
       </tr>
    </table>
    
    </div>
    
</asp:Content>