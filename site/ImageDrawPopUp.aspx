<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImageDrawPopUp.aspx.cs" Inherits="site.WebForm1" EnableViewStateMac="false" EnableViewState="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
     
       <title></title> 
        
     <script src="Scripts/jquery-1.js"  type="text/javascript"></script>
    
    <script src="Scripts/colpick.js" type="text/javascript"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="stylesheet" media="screen" type="text/css" href="Styles/colpick.css" />
    
 
   
    <script type="text/javascript">

        $(document).ready(function () {

            var canvas, context, tool;



            // $("#colorPicker").colpick(); //ColorPicker({flat : true});
            function init() {
                // Find the canvas element.
                canvas = document.getElementById('imageView');
                if (!canvas) {
                    alert('Error: I cannot find the canvas element!');
                    return;
                }

                if (!canvas.getContext) {
                    alert('Error: no canvas.getContext!');
                    return;
                }

                // Get the 2D canvas context.
                context = canvas.getContext('2d');
                if (!context) {
                    alert('Error: failed to getContext!');
                    return;
                }


                // Pencil tool instance.
                tool = new tool_pencil();
                $('#colorPicker').colpick({
                    flat: true,
                    layout: 'hex',
                    submit: 0,
                    onChange: function (hsb, hex, rgb, el) {
                        context.strokeStyle = '#' + hex;

                        // $(el).colpickHide();
                    }

                });


                // Attach the mousedown, mousemove and mouseup event listeners.
                canvas.addEventListener('mousedown', ev_canvas, false);
                canvas.addEventListener('mousemove', ev_canvas, false);
                canvas.addEventListener('mouseup', ev_canvas, false);
            }
            ;
            // This painting tool works like a drawing pencil which tracks the mouse 
            // movements.
            function tool_pencil() {
                var tool = this;
                this.started = false;

                // This is called when you start holding down the mouse button.

                this.mousedown = function (ev) {
                    context.beginPath();
                    context.moveTo(ev._x, ev._y);
                    tool.started = true;
                };

                // This function is called every time you move the mouse.
                this.mousemove = function (ev) {
                    if (tool.started) {
                        context.lineTo(ev._x, ev._y);
                        context.stroke();
                    }
                };

                // This is called when you release the mouse button.
                this.mouseup = function (ev) {
                    if (tool.started) {
                        tool.mousemove(ev);
                        tool.started = false;
                    }
                };
            }

            // The general-purpose event handler. 
            function ev_canvas(ev) {
                if (ev.layerX || ev.layerX == 0) { // Firefox
                    ev._x = ev.layerX;
                    ev._y = ev.layerY;
                } else if (ev.offsetX || ev.offsetX == 0) { // Opera
                    ev._x = ev.offsetX;
                    ev._y = ev.offsetY;
                }

                // Call the event handler of the tool.
                var func = tool[ev.type];
                if (func) {
                    func(ev);
                }
            }

            init();

            //Image Save

            //            $('#btnSignUp').click(function () {
            //                var canvas = document.getElementById("imageView");
            //                var ctx = canvas.getContext("2d");
            //                
            ////                baseimage = new Image();
            ////                baseimage.src = 'what.jpg';
            ////                baseimage.onload = function () {
            ////                    ctx.drawImage(baseimage, 1, 1);
            ////                    
            ////                }

            //              var image = canvas.toDataURL("image/png");
            //               // alert(image);

            //              document.getElementById('canvasImg').src = image;
            //                
            //             //   $("#myCanvas").show();


            //                                //var num = 77;
            ////                               var image = document.getElementById("imageView").toDataURL("image/png");
            ////                             //   alert(image);
            ////                                //image = image.replace('data:image/png;base64,', '');
            ////                              //  alert(image);
            ////                                $.ajax({
            ////                                    type: 'POST',
            ////                                    url: '/topicContent.aspx/btnSignUp_Click',
            ////                                    data: '{ "imageData" : "' + image + '" }',
            ////                                    contentType: 'application/json; charset=utf-8',
            ////                                    dataType: 'json',
            ////                                    success: function (msg) {
            ////                                        alert("Success :: " + msg);
            ////                                    }
            ////                                });

            //            }); //Imagesave

            $("#btnSignUp").click(function () {

                var canvas = document.getElementById("imageView");
                var image;

                image = canvas.toDataURL("image/png");

                var add_image = "<image style='border: 1px solid #000;' src='" + image + "'>";
                
                //  alwindow.opener.$("#txtComm").val());
                window.opener.$("#divPreview").append('<p>' + add_image + '</p>');
                window.close();
            });
        });



//        function test() {
//           
//            var canvas = document.getElementById("imageView");
//            var image;
//            image = canvas.toDataURL("image/png");
//           
//            window.opener.document.getElementById("canvasImg").src = image;
//             window.close();
//         }

           
        


       
       
</script>
 <style>
			#container { position: relative; }
			#imageView { border: 1px solid #000; }
		</style>
</head>
<body>
    <form id="form2" runat="server" action="TopicContent.aspx">
        <%--<asp:Button id="btnSignUp" runat="server" />--%>
        <div id="container">
			<canvas id="imageView">
		    </canvas>
           <%-- <asp:Image runat="server" id="canvasImg" /> --%>
            
		</div>
    <div id="colorPicker">
    </div>
    
        <input type="button" id="btnSignUp" value="Send To Server"   />
        <asp:Button runat="server" />
        
        
    </form>
</body>
</html>
