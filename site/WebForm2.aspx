<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="site.WebForm2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<!DOCTYPE html>
<html>
<head>
<title>MathJax TeX Test Page</title>
<script type="text/x-mathjax-config">
  MathJax.Hub.Config({tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]}});
</script>
<script type="text/javascript"
  src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
</script>
<script>
    function insert(a, b, c) {
     //   alert(a);

        document.getElementById("txt").value = a.toString();
      //  img1.src = "http://latex.codecogs.com/gif.latex?" + document.getElementById("txt").value;
    }
</script>
</head>
<body>
<div style="width: 30%; float: left; text-align: center" >

<img  src="Images/greeklower.gif" width="68" height="136" border="0" title="Greeklower" alt="Greeklower Panel" usemap="#greeklower_map">
    <map name="greeklower_map" id="greeklower_map">
    <area shape="rect" alt="" coords="0,0,14,14" title="\alpha" onclick="insert('\pm')">
    <area shape="rect" alt="" coords="0,17,14,31" title="\epsilon" onclick="insert('\epsilon')">
    <area shape="rect" alt="" coords="0,34,14,48" title="\theta" onclick="insert('\theta')">
    <area shape="rect" alt="" coords="0,51,14,65" title="\lambda" onclick="insert('\lambda')">
    <area shape="rect" alt="" coords="0,68,14,82" title="\pi" onclick="insert('\pi')">
    <area shape="rect" alt="" coords="0,85,14,99" title="\sigma">
    <area shape="rect" alt="" coords="0,102,14,116" title="\phi">
    <area shape="rect" alt="" coords="0,119,14,133" title="\omega">
    <area shape="rect" alt="" coords="17,0,31,14" title="\beta">
    <area shape="rect" alt="" coords="17,17,31,31" title="\varepsilon">
    <area shape="rect" alt="" coords="17,34,31,48" title="\vartheta">
    <area shape="rect" alt="" coords="17,51,31,65" title="\mu">
    <area shape="rect" alt="" coords="17,68,31,82" title="\varpi">
    <area shape="rect" alt="" coords="17,85,31,99" title="\varsigma">
    <area shape="rect" alt="" coords="17,102,31,116" title="\varphi">
    <area shape="rect" alt="" coords="34,0,48,14" title="\gamma">
    <area shape="rect" alt="" coords="34,17,48,31" title="\zeta">
    <area shape="rect" alt="" coords="34,34,48,48" title="\iota">
    <area shape="rect" alt="" coords="34,51,48,65" title="\nu">
    <area shape="rect" alt="" coords="34,68,48,82" title="\rho">
    <area shape="rect" alt="" coords="34,85,48,99" title="\tau">
    <area shape="rect" alt="" coords="34,102,48,116" title="\chi">
    <area shape="rect" alt="" coords="51,0,65,14" title="\delta">
    <area shape="rect" alt="" coords="51,17,65,31" title="\eta">
    <area shape="rect" alt="" coords="51,34,65,48" title="\kappa">
    <area shape="rect" alt="" coords="51,51,65,65" title="\xi">
    <area shape="rect" alt="" coords="51,68,65,82" title="\varrho">
    <area shape="rect" alt="" coords="51,85,65,99" title="\upsilon">
    <area shape="rect" alt="" coords="51,102,65,116" title="\psi"></map>

<img  src="Images/operators.gif" width="168" height="140" border="0" title="Operators" alt="Operators Panel" usemap="#operators_map">

<map name="operators_map" id="operators_map">
    <area shape="rect" alt="" title="superscript" coords="0,0,25,25" onclick="insert('^{}',2,0)">
    <area shape="rect" alt="" title="subscript" coords="0,28,25,53" onclick="insert('_{}',2,0)">
    <area shape="rect" alt="" coords="0,56,25,81" onclick="insert('_{}^{}',2,0)" title="x_a^b">
    <area shape="rect" alt="" coords="0,84,25,109" onclick="insert('{_{}}^{}',1)" title="{x_a}^b">
    <area shape="rect" alt="" title="_{a}^{b}\textrm{C}" coords="0,112,25,137" onclick="insert('_{}^{}\\textrm{}',2,14)">
    <area shape="rect" alt="" title="fraction" coords="28,0,53,25" onclick="insert('\\frac{}{}',6)">
    <area shape="rect" alt="" title="tiny fraction" coords="28,28,53,53" onclick="insert('\\tfrac{}{}',7)">
    <area shape="rect" alt="" coords="28,56,53,81" onclick="insert('\\frac{\\partial }{\\partial x}',15)" title="\frac{\partial }{\partial x}">
    <area shape="rect" alt="" coords="28,84,53,109" onclick="insert('\\frac{\\partial^2 }{\\partial x^2}',17)" title="\frac{\partial^2 }{\partial x^2}">
    <area shape="rect" alt="" coords="28,112,53,137" onclick="insert('\\frac{\\mathrm{d} }{\\mathrm{d} x}',17)" title="\frac{\mathrm{d} }{\mathrm{d} x}">
    <area shape="rect" alt="" coords="56,0,81,25" title="\int"><area shape="rect" alt="" title="\int_{}^{}" coords="56,28,81,53" onclick="insert('\\int_{}^{}',6,1000)">
    <area shape="rect" alt="" coords="56,56,81,81" onclick="insert('\\oint')" title="\oint">
    <area shape="rect" alt="" title="\oint_{}^{}" coords="56,84,81,109" onclick="insert('\\oint_{}^{}',7,1000)">
    <area shape="rect" alt="" title="\iint_{}^{}" coords="56,112,81,137" onclick="insert('\\iint_{}^{}',7,1000)">
    <area shape="rect" alt="" coords="84,0,109,25" title="\bigcap">
    <area shape="rect" alt="" title="\bigcap_{}^{}" coords="84,28,109,53" onclick="insert('\\bigcap_{}^{}',9,1000)">
    <area shape="rect" alt="" coords="84,56,109,81" onclick="insert('\\bigcup')" title="\bigcup">
    <area shape="rect" alt="" title="\bigcup_{}^{}" coords="84,84,109,109" onclick="insert('\\bigcup_{}^{}',9,1000)">
    <area shape="rect" alt="" title="\lim_{x \to 0}" coords="84,112,109,137" onclick="insert('\\lim_{}')">
    <area shape="rect" alt="" coords="112,0,137,25" title="\sum">
    <area shape="rect" alt="" title="\sum_{}^{}" coords="112,28,137,53" onclick="insert('\\sum_{}^{}',6)">
    <area shape="rect" alt="" title="\sqrt{}" coords="112,56,137,81" onclick="insert('\\sqrt{}',6,6)">
    <area shape="rect" alt="" title="\sqrt[]{}" coords="112,84,137,109" onclick="insert('\\sqrt[]{}',6,8)">
    <area shape="rect" alt="" coords="140,0,165,25" title="\prod">
    <area shape="rect" alt="" title="\prod_{}^{}" coords="140,28,165,53" onclick="insert('\\prod_{}^{}',7,1000)">
    <area shape="rect" alt="" coords="140,56,165,81" title="\coprod">
    <area shape="rect" alt="" title="\coprod_{}^{}" coords="140,84,165,109" onclick="insert('\\coprod_{}^{}',9,1000)">
</map>
</div>
<div>
    <img   src="Images/binary.gif" width="68" height="238" border="0" title="Binary" alt="Binary Panel" usemap="#binary_map">
    <map name="binary_map" id="binary_map">
    <area shape="rect" alt="" coords="0,0,14,14" title="\pm"  onclick="insert('\pm')">
    <area shape="rect" alt="" coords="0,17,14,31" title="\mp" onclick="insert('\mp')">
    <area shape="rect" alt="" coords="0,34,14,48" title="\times" onclick="insert('\times')">
    <area shape="rect" alt="" coords="0,51,14,65" title="\ast" onclick="insert('\ast')">
    <area shape="rect" alt="" coords="0,68,14,82" title="\div" onclick="insert('\div')">
    <area shape="rect" alt="" coords="0,85,14,99" title="\setminus" onclick="insert('\msetminusp')">
    <area shape="rect" alt="" coords="0,102,14,116" title="\dotplus" onclick="insert('\dotplus')">
    <area shape="rect" alt="" coords="0,119,14,133" title="\amalg">
    <area shape="rect" alt="" coords="0,136,14,150" title="\dagger">
    <area shape="rect" alt="" coords="0,153,14,167" title="\ddagger">
    <area shape="rect" alt="" coords="0,170,14,184" title="\wr">
    <area shape="rect" alt="" coords="0,187,14,201" title="\diamond">
    <area shape="rect" alt="" coords="0,204,14,218" title="\circledcirc">
    <area shape="rect" alt="" coords="0,221,14,235" title="\circledast">
    <area shape="rect" alt="" coords="17,0,31,14" title="\cap">
    <area shape="rect" alt="" coords="17,17,31,31" title="\Cap">
    <area shape="rect" alt="" coords="17,34,31,48" title="\sqcap">
    <area shape="rect" alt="" coords="17,51,31,65" title="\wedge">
    <area shape="rect" alt="" coords="17,68,31,82" title="\barwedge">
    <area shape="rect" alt="" coords="17,85,31,99" title="\triangleleft">
    <area shape="rect" alt="" coords="17,102,31,116" title="\lozenge">
    <area shape="rect" alt="" coords="17,119,31,133" title="\circ">
    <area shape="rect" alt="" coords="17,136,31,150" title="\square">
    <area shape="rect" alt="" coords="17,153,31,167" title="\triangle">
    <area shape="rect" alt="" coords="17,170,31,184" title="\triangledown">
    <area shape="rect" alt="" coords="17,187,31,201" title="\ominus">
    <area shape="rect" alt="" coords="17,204,31,218" title="\oslash">
    <area shape="rect" alt="" coords="17,221,31,235" title="\circleddash">
    <area shape="rect" alt="" coords="34,0,48,14" title="\cup">
    <area shape="rect" alt="" coords="34,17,48,31" title="\Cup">
    <area shape="rect" alt="" coords="34,34,48,48" title="\sqcup">
    <area shape="rect" alt="" coords="34,51,48,65" title="\vee">
    <area shape="rect" alt="" coords="34,68,48,82" title="\veebar">
    <area shape="rect" alt="" coords="34,85,48,99" title="\triangleright">
    <area shape="rect" alt="" coords="34,102,48,116" title="\blacklozenge">
    <area shape="rect" alt="" coords="34,119,48,133" title="\bullet">
    <area shape="rect" alt="" coords="34,136,48,150" title="\blacksquare">
    <area shape="rect" alt="" coords="34,153,48,167" title="\blacktriangle">
    <area shape="rect" alt="" coords="34,170,48,184" title="\blacktriangledown">
    <area shape="rect" alt="" coords="34,187,48,201" title="\oplus">
    <area shape="rect" alt="" coords="34,204,48,218" title="\otimes">
    <area shape="rect" alt="" coords="34,221,48,235" title="\odot">
    <area shape="rect" alt="" coords="51,0,65,14" title="\cdot">
    <area shape="rect" alt="" coords="51,17,65,31" title="\uplus">
    <area shape="rect" alt="" coords="51,34,65,48" title="\bigsqcup">
    <area shape="rect" alt="" coords="51,51,65,65" title="\bigtriangleup">
    <area shape="rect" alt="" coords="51,68,65,82" title="\bigtriangledown">
    <area shape="rect" alt="" coords="51,85,65,99" title="\star">
    <area shape="rect" alt="" coords="51,102,65,116" title="\bigstar">
    <area shape="rect" alt="" coords="51,119,65,133" title="\bigcirc">
    <area shape="rect" alt="" coords="51,136,65,150" title="\bigoplus">
    <area shape="rect" alt="" coords="51,153,65,167" title="\bigotimes">
    <area shape="rect" alt="" coords="51,170,65,184" title="\bigodot">
    </map>
</div>
<div>
    

</div>
<div>
<input  type="text" id="txt" />
<input type="button" id="btn" onclick="eqn()"  />
<img src="http://latex.codecogs.com/gif.latex?"  id="img1" />
</div>
<div>
<script type="text/javascript">
    

   // var abc ="23" ;
//    var actorWin = new Object();  
//     

// var newWin=window.open('','Win','width=300,height=200,top=100,left=600');

    //  newWin.
    function eqn() {
        alert(txt.value);
        img1.src = "http://latex.codecogs.com/gif.latex?" + txt.value;
     //  document.write("abc");
       // window.w
       //document.write("<script> document.write('abcf');<\/script>");
//       document.write("<script type='text\/x-mathjax-config'> MathJax.Hub.Config({tex2jax: {inlineMath: [['$','$'], ['\\\\(','\\\\)']]}});\
//       <\/script><script type='text\/javascript' src='http:\/\/cdn.mathjax.org\/mathjax\/latest\/MathJax.js\?config=TeX-AMS-MML_HTMLorMML'>\
//       <\/script><script type='math/tex'> abc <\/script>");
//       alert("<script type='text\/x-mathjax-config'> MathJax.Hub.Config({tex2jax: {inlineMath: [['$','$'], ['\\\\(','\\\\)']]}});\
//       <\/script><script type='text\/javascript' src='http:\/\/cdn.mathjax.org\/mathjax\/latest\/MathJax.js\?config=TeX-AMS-MML_HTMLorMML'>\
//       <\/script><script type='math\/tex'> abc <\/script>");
   }
   
</script>
</div>
</body>
</html>
