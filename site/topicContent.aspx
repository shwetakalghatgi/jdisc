<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TopicContent.aspx.cs"  EnableViewState="true" Title="Topic Content" Inherits="site.test" MasterPageFile="~/Site.Master" %>

    <asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
        <script src="Scripts/jquery-1.js"  type="text/javascript"></script>
        <script type="text/x-mathjax-config">
          MathJax.Hub.Config({tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]}});
        </script>
        <script type="text/javascript"
          src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
        </script>
        <script type="text/javascript">
             $(document).ready(function () {
                 var popUpObj;

                 $("#btnDrawImage").click(function () {
                     popUpObj = window.open("WebForm1.aspx", "Popup", "toolbar=no,scrollbars=no,location=no,statusbar=no,menubar=no,resizable=0,width=300,height=300,left = 490,top = 262");
                     popUpObj.focus();
                     return false;
                 });

                 $("#txtComm").change(function () {
                     //   alert("in");
                     $("#divPreview").append('<p>' + $("#txtComm").val() + '</p>');
                     // $("#pText").text($("#txtComm").val()); //($("#txtComm").text);
                 });

                 $("#divPreview").click(function () {
                     alert("in");
                 });
                 $("#txtEqn").change(function () {
                     $("#divPreview").append('<p><image src=http://latex.codecogs.com/gif.latex\?' + $("#txtEqn").val() + '></p>');
                 });

                 $("#saveDiv").click(function () {

                     var title = $("#txtTitle").val();
                     var img = $("#divPreview").html();
                     $.ajax({
                         type: 'POST',
                         url: '/TopicContent.aspx/btnSignUp_Click',
                         data: "{ 'imageData' : '" + img + "','title' : '" + title + "'}",
                         contentType: 'application/json; charset=utf-8',
                         dataType: 'json',
                         success: function (msg) {
                             alert("Success :: " + msg);
                         }
                     });
                     
                 });

             });

    
        //    function test1()
        //    {
        //        
        //         var c = document.getElementById('divPreview');
        //         var t = c.getContext('2d');
        //         var divImage = document.getElementById("divPreview").toDataURL("image/png");
        //         alert(divImage);
        //     }
         </script>

         <div id="body-container" 
          style="position: relative; margin: 0 auto; padding: 0% 2% 2%; top: 0px; left: 0px; height: 395px; overflow:scroll; width: 793px;">
            <table style=" position:relative; width: 689px; margin-left:0px; top: 0px; left: -58px;">
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Title"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="txtTitle"  ClientIDMode="Static"></asp:TextBox>
                    
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
                <tr>
                    <td>
                        <asp:Label runat="server" Text="Comments:"></asp:Label>
                    </td>
                </tr>
                <tr>
                   
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:TextBox runat="server" ID="txtComm" TextMode="MultiLine" Rows="2" Columns="60" ClientIDMode="Static"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblEqn" runat="server" Text="Equation">
                        </asp:Label>
                    </td>   
                    <td>
                        <asp:TextBox ID="txtEqn" runat="server" ClientIDMode="Static"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button runat="server" Text="Submit"   
                            onclick="saveComments" />
               
                        <asp:Button runat="server" Text="Draw" ID="btnDrawImage" EnableViewState="true"  ClientIDMode="Static" />
                    <%--<input type="button" id="btnDrawImage" />--%>
                        <asp:Button runat="server" Text="Equation" ID="btnEqn" onclick="btnEqn_Click" />
                    </td>
               
                </tr>
                <tr>
                    <td>
                        <asp:GridView ID="gridView2" runat="server" AutoGenerateColumns="false">
                            <Columns>
                                    <asp:TemplateField HeaderText="Previous Comments">
                                        <ItemTemplate>
                                        <asp:Label runat="server" ID="lblComments" Text='<%# Eval("titleComm") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </td>
               </tr>
               <tr>
                    <td colspan="2">
                        <input type="button" value="Edit" />
                        <div  id="divPreview">
                        </div>
                        <p>Previous Comments</p>
                        <div  id="divId" runat="server">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="button" id="saveDiv"  value="Save Image"/>
                    </td>
                </tr>
             </table>
          </div>
   </asp:Content>