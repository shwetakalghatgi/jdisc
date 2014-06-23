<%@ Page Title="Topic List" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" 
    CodeBehind="TopicList.aspx.cs" Inherits="site._Default" %>
  

    <asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
        <div id="body-container" 
        
            style="position: relative; margin: 0 auto; padding: 0% 2% 2%; top: 0px; left: 0px; height: 295px; width: 793px;">
            <table style=" position:relative; width: 689px; margin-left:0px; top: 0px; left: -58px;">  
                <tr align="left">
                    <td  style="margin-left:0px;" align="left">
                        <asp:Button ID="Button1" runat="server" Text="New Topic"  onclick="Button1_Click" />
     
                        <asp:Button runat="server" ID="btnSub" Text="All Subjects" onclick="btnSub_Click" />
                    </td>
                </tr>
 
               <tr style="margin-left:0px; margin-top:0px;"   align="left">
                   <td>
                        <asp:Label ID="Label1" Text="Topic list" runat="server"></asp:Label>
                        <asp:GridView  runat="server" ID = "gridView1"   AutoGenerateColumns="false"  
                                OnRowDeleting="deleteTopic"  style="margin-top: 0px">
                            <Columns>
                                <asp:TemplateField HeaderText="Title">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="hl" runat="server" Text='<%# Eval("title") %>'  NavigateUrl='<%# Eval("title", "~/TopicContent.aspx?topicTitle={0}")%>'></asp:HyperLink>
                                                                                    
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Subject">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="hlSub"  runat="server" Text='<%# Eval("subject") %>'   NavigateUrl='<%# Eval("subject", "~/TopicListOfSub.aspx?subject={0}")%>'></asp:HyperLink>
                                                                                    
                                        </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField> 
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" Text="Delete"  CommandName="Delete" ID="btnDel" ></asp:LinkButton>
                                        </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
            </table>
       </div>
    </asp:Content>
