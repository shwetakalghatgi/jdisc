<%@ Page Title="List of Subjects " Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SubjectsPage.aspx.cs" Inherits="site.SubjectsPage" %>

    <asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
        <div id="body-container" 
        
            style="position: relative; margin: 0 auto; padding: 0% 2% 2%; top: 0px; left: 0px; height: 295px; width: 793px;">
            <table style=" position:relative; width: 689px; margin-left:0px; top: 0px; left: -58px;">  
                <tr style="margin-left:0px; margin-top:0px;"   align="left">
                    <td>
                        <asp:Label runat="server" ID="lblSubList"></asp:Label>
                            <asp:GridView runat="server" ID="gridviewSub" AutoGenerateColumns="false">
                                <Columns>
                                    <asp:TemplateField HeaderText="Subjects">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="hlSubjects" runat="server" Text='<%# Eval("subject") %>'  NavigateUrl='<%# Eval("subject", "~/TopicList.aspx?subject={0}")%>'></asp:HyperLink>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                     </td>
                </tr>
             </table>
      </div>
   </asp:Content>
