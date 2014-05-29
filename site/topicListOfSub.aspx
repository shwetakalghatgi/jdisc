<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="topicListOfSub.aspx.cs" Inherits="site.topicListOfSub" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView runat="server" ID="listTopicOfSub" AutoGenerateColumns="false">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:HyperLink runat="server" ID="hlTOpicList" Text='<%# Eval("title") %>' NavigateUrl='<%# Eval("title", "~/topicContent.aspx?title={0}")%>'></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    
</asp:Content>

