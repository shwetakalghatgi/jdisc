﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="site.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
     
       <title></title> 
        
     <script src="Scripts/jquery-1.js"  type="text/javascript"></script>
    
    <script src="Scripts/colpick.js" type="text/javascript"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="stylesheet" media="screen" type="text/css" href="Styles/colpick.css" />
    
 
   
    <script>

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

            $('#btnSignUp').click(function () {
                //var num = 77;
                var image = document.getElementById("imageView").toDataURL("image/png");
               // alert(image);
                image = image.replace('data:image/png;base64,', '');
                alert("inn");
                $.ajax({
                    type: 'POST',
                    url: '/WebForm1.aspx/btnSignUp_Click',
                    data: '{ "imageData" : "' + image + '" }',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (msg) {
                        alert("Success :: " + msg);
                    }
                });

            }); //Imagesave
        });

            

           
        


       
       
</script>
 <style>
			#container { position: relative; }
			#imageView { border: 1px solid #000; }
		</style>
</head>
<body>
    <form id="form2" runat="server">
        <%--<asp:Button id="btnSignUp" runat="server" />--%>
        <div id="container">
			<canvas id="imageView" width="400" height="300">
				<p>Unfortunately, your browser is currently unsupported by our web application. We are sorry for the inconvenience. Please use one of the supported browsers listed below, or draw the image you want using an offline tool.</p>
				<p>Supported browsers: <a href="http://www.opera.com">Opera</a>, <a href="http://www.mozilla.com">Firefox</a>, <a href="http://www.apple.com/safari">Safari</a>, and <a href="http://www.konqueror.org">Konqueror</a>.</p>
			</canvas>
		</div>
    <div id="colorPicker">
    </div>
        <input type="button" id="btnSignUp" value="Send To Server" />
    </form>
</body>
</html>
