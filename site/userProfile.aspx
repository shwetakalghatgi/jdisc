<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userProfile.aspx.cs"  MasterPageFile="~/Site.Master" Inherits="site.userProfile" %>

    <asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
        <script src="Scripts/jquery-1.js"  type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#btnUpload").click(function () {
                    $("#im1").click();

                      });
               
                        $(":file").change(function () {
                            if (this.files && this.files[0]) {
                                var reader = new FileReader();
                                reader.onload = imageIsLoaded;
                                reader.readAsDataURL(this.files[0]);
                            }
                        });
                

                function imageIsLoaded(e) {
                    $('#myImg').attr('src', e.target.result);
                };
            });

        </script>
        <div id="body-container" 
        
            style="position: relative; margin: 0 auto; padding: 0% 2% 2%; top: 0px; left: 0px; height: 295px; width: 793px;">
            <table style=" position:relative; width: 528px; margin-left:0px; top: 0px; left: -98px;">
              
               <tr>
                     <td style="width: 138px">
                        <asp:Label runat="server" Text="User_Name"></asp:Label>
                     </td>
                     <td style="width: 181px">
                        <asp:TextBox runat="server" ID="txtUserName" ></asp:TextBox>
                     </td>
                     <td rowspan="3" style="width: 98px">
                        <table>
                            <tr>
                                <td align="left">
                                
                                
                                    <%--<asp:Button ID="btnUpload" runat="server" Text="Upload Image"   ClientIDMode="Static"/>--%>
                                    <asp:Image ID="myImg" runat="server" ClientIDMode="Static" Height="60" Width="60" />
                             
                                
                                   <%-- <img id="myImg" src="#" alt="your image" />--%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                       <input type="button" id="btnUpload" value="Upload Image" />
                                       <input type='file'  id="im1"  style="visibility:hidden;" />
                                </td>
                            </tr>
                       
                        </table>
                     </td>
               </tr>
               <tr>
                    <td style="width: 138px">
                        <asp:Label runat="server" Text="Skills"></asp:Label>
                    </td>
                    <td style="width: 181px">
                        <asp:TextBox runat="server" ID="txtSkill"></asp:TextBox>
                    </td>
               
               </tr>
                <%--<asp:RegularExpressionValidator ID="regexValidator" runat="server" ControlToValidate="fuImportImage"  ValidationExpression="(\.\*\.([Jj][Pp][Gg])\|\.\*\.([Pp][Nn][Gg])\|\.\*\.([Gg][Ii][Ff])\|\*\.([Jj][Pp][Ee][Gg])\$)"></asp:RegularExpressionValidator>
                       --%>
          
               <tr>
                      <td style="width: 138px">
                        <asp:Button runat="server" ID="btnSubmit" Text="Submit" 
                              onclick="btnSubmit_Click" />
                      </td>
               </tr>
               <tr>
                    <td> 
                        <input type="file" id="FileUploadControl"      style="visibility:hidden;" />
                        
                    </td>
                </tr>
            </table>
        </div>
    
    </asp:Content>
