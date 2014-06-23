<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="allTopicsOfSubject.aspx.cs" Inherits="site.allTopicsOfSubject" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div>
    <table>
        <tr>
            <td>
                <asp:GridView runat="server" ID="gritviewAllTopicSub" AutoGenerateColumns="false" >
                <Columns>
                    <asp:TemplateField>
                         <ItemTemplate>
                            <asp:HyperLink ID="hlTopicSub" runat="server" Text='<%# Eval("subject") %>' NavigateUrl='<%# Eval("title", "~/TopicContent.aspx?title={0}")%>'></asp:HyperLink>
                         </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
</div>
</asp:Content>
