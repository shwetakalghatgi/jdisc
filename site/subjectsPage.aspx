<%@ Page Title="List of Subjects " Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="subjectsPage.aspx.cs" Inherits="site.subjectsPage" %>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div>

        <table>
            <tr>
                <td>
                    <asp:Label runat="server" ID="lblSubList"></asp:Label>
                    <asp:GridView runat="server" ID="gridviewSub" AutoGenerateColumns="false">
                        <Columns>
                            <asp:TemplateField HeaderText="Subjects">
                                <ItemTemplate>
                                    <asp:HyperLink ID="hlSubjects" runat="server" Text='<%# Eval("subject") %>'  NavigateUrl='<%# Eval("subject", "~/topicList.aspx?subject={0}")%>'></asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
