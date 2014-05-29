<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="topicContent.aspx.cs"  Title="Topic Content" Inherits="site.test" MasterPageFile="~/Site.Master" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">


    <div>
     <table>
              
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Title"></asp:Label>
                </td>
                <td>
                    <asp:TextBox runat="server" ID="txtTitle" Text='<%# Eval("title") %>' ></asp:TextBox>
                </td>
             </tr>
             <tr>
                <td>
                    <asp:Label ID="Label2"  runat="server" Text="Author"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtAuthor" runat="server" Text='<%# Eval("author") %>' ></asp:TextBox>
                </td>
             </tr>
             <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Abstract"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtAbstract" runat="server" Text='<%# Eval("data") %>' ></asp:TextBox>
                </td>
             </tr>
             <tr><td><asp:Label runat="server" Text="Comments:"></asp:Label></td></tr>
             <tr><td>
              <asp:Panel ID="Panel1" runat="server" Height="30px"></asp:Panel>
             </td></tr>
        
         
             <tr>
                <td>
                    <asp:TextBox runat="server" ID="txtComm" TextMode="MultiLine" Rows="2"></asp:TextBox>
                  
                </td>
                <td>
                    <asp:Button runat="server" Text="Draw" ID="brnDraw" onclick="brnDraw_Click" />
                </td>
                <td>
                    <asp:Button runat="server" Text="Equation" ID="btnEqn" onclick="btnEqn_Click" />
                </td>
              </tr>
             <tr>
                <td>
                    <asp:Button runat="server" Text="Submit"   
                     onclick="saveComments" />
                </td>
               
             </tr>
             <tr><td>
             <asp:GridView ID="gridView2" runat="server" AutoGenerateColumns="false">
             <Columns><asp:TemplateField HeaderText="Previous Comments"><ItemTemplate>
                    <asp:Label runat="server" ID="lblComments" Text='<%# Eval("titleComm") %>'></asp:Label>
             </ItemTemplate></asp:TemplateField></Columns>
             </asp:GridView></td></tr>
        </table>
    </div>
    

</asp:Content>