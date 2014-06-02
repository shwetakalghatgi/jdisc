<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="topicListOfSub.aspx.cs" Inherits="site.topicListOfSub" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="body-container" 
        
        style="position: relative; margin: 0 auto; padding: 0% 2% 2%; top: 0px; left: 0px; height: 295px; width: 793px;">
<table style=" position:relative; width: 689px; margin-left:0px; top: 0px; left: -58px;">  
     
  <tr style="margin-left:0px; margin-top:0px;"   align="left">
  <td>
  <asp:Label runat="server" ID="lblTitle"></asp:Label>
    <asp:GridView runat="server" ID="listTopicOfSub" AutoGenerateColumns="false">
        
        <Columns>
            
            <asp:TemplateField HeaderText="Title">
                <ItemTemplate>
                    <asp:HyperLink runat="server" ID="hlTOpicList" Text='<%# Eval("title") %>' NavigateUrl='<%# Eval("title", "~/topicContent.aspx?title={0}")%>'></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    </td>
    </tr>
    </table>
 </div>  
</asp:Content>

