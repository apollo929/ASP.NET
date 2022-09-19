<!--#include file=connessionesql.inc-->
<!DOCTYPE html>
<html lang="en">
<head>
<TITLE>JENIUS COMMUNICATIONS - MARCO GENOVESE</TITLE>
<meta name="keywords" content="JENIUS">
<meta name="description" content="JENIUS">
<link rel="stylesheet" type="text/css" href="style.css">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Backoffice JENIUS</title>
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- MetisMenu CSS -->
<link href="css/metisMenu.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="css/startmin.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link   rel="stylesheet" href="css/yBox.min.css">
<script src="css/yBox.min.js"></script>	
</head>
				<body style="background:#ffffff;" >
				

				

			 
				<form name="newad" id="newad" method="post" enctype="multipart/form-data" action="https://img.schede.eu/cataloghi/upload-buffetti.php">
				<input type="hidden" name="codice" value="<%=request("codice")%>" >
				<input type="hidden" name="url" value="<%=linkuserid%>/admin/adgestionefotobuffettiupload.asp?chiudi=si&codice=<%=request("codice")%>" >
				<table width="80%" align="center" >	
				<tr><td colspan="2" HEIGHT="50PX;" align="left"><hr></td></tr>				
				<tr><td colspan="2" align="left">MODIFICA LA FOTO ATTUALE </td></tr>
				<tr><td colspan="2" HEIGHT="50PX;" align="left"><hr></td></tr>
				<tr>
				<td>FOTO ATTUALE: </td>
				<td><img src="../foto.asp?cat=catalogobuffetti2016_big&img=<%=request("codice")%>.jpg" border="0" width="200px" ></td>
				</tr>
				<tr><td colspan="2" HEIGHT="50PX;" align="left"><hr></td></tr>
				<tr>
				<td>SELEZIONA LA NUOVA FOTO DA INSERIRE : </td>
				<td><input type="file" name="image" value=" "></td>
				</tr>
				<tr><td colspan="2" HEIGHT="50PX;" align="left"><hr><br></td></tr>
				<tr><td>
				<input name="Submit" type="submit" style="background:#ff0000;color:white;height:35px;" value=" SELEZIONA FOTO NUOVA  ">
				</td></tr>
				</table>		
				</form>
				</body>
</html>

<!-- jQuery -->
<script src="js/jquery.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>
<!-- Metis Menu Plugin JavaScript -->
<script src="js/metisMenu.min.js"></script>
<!-- Custom Theme JavaScript -->
<script src="js/startmin.js"></script>

<script>
window.onload = function(){
let myYbox;
if(document.querySelector('.yBox')){
myYbox = new yBox();
myYbox.init();
}
myYbox.onYboxOpen = function(){
document.body.classList.add('yBoxIsOpen');
}
myYbox.onYboxClose = function(){
document.body.classList.remove('yBoxIsOpen');
}
myYbox.onNextItemClick = function(){
console.log('next item clicked');
};
myYbox.onPrevItemClick = function(){
console.log('prev item clicked');
}
};
</script>

<%if request("chiudi")="si" then %>
<script>	
// gestore dell'evento
window.onload = function() {							
jQuery(window.parent.document.getElementsByClassName("closeYbox")[0]).click();
window.parent.location.reload();
//window.parent.document.formuu.submit();														
return true;
}
</script>	
<%end if%>
	
<!--#include file=closesql.inc-->