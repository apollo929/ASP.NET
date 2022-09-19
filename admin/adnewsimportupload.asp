<div id="loading" class="well" style="max-width:44em;">
<table border="0" style="width:350px;height:400px;background-color:white;font-size:12px;" align="center" >
<tr><td colspan="2" align="center" height="35px"><img src="images/loading6.gif" border="0"></td></tr>
</table>
</div>
<!--#include file=connessionesql.inc-->
<!DOCTYPE html>
<html lang="en">
<head>
<TITLE>Jenius</TITLE>
<meta name="keywords" content="KIRON S.p.A">
<meta name="description" content="KIRON S.p.A">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Backoffice Jenius</title>
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- MetisMenu CSS -->
<link href="css/metisMenu.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="css/startmin.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
<!-- jQuery -->
<script src="js/jquery.min.js"></script>
<!-- jQuery Popup Overlay -->
<script src="jquery.popupoverlay.js"></script>
<!-- Set defaults -->
<script language="javascript">
function openpopup(divName) {
// Initialize the plugin
$('#basic').popup({
autoopen: true, /* per non far aprire al caricamento impostare su false */
// transition: 'all 0.3s',
scrolllock: true
});
}
$(document).ready(function () {
  $('#loading').popup({
    autoopen: true, /* per non far aprire al caricamento impostare su false */
    //transition: 'all 0.3s',
    scrolllock: true
  });
});
</script>
</head>
<body>
<%

'upload
idir = "C:\inetpub\vhosts\ideaufficio.shop\httpdocs\admin\import\"

'Istanza Upload
dim objUpload
set objUpload = server.CreateObject("Dundas.Upload.2")

'upload
objUpload.UseUniqueNames=true
on error resume next
objUpload.Save idir

If Err.Number <> 0 Then
 response.redirect ""
Else
		i=0
		SET FSO = Server.CreateObject("Scripting.FileSystemObject")
		For Each objUploadedFile in objUpload.Files
			'update file
			updnomefile=cstr(objUpload.GetFileName(objUpload.Files(i).Path))
		Next  
		SET FSO = NOTHING
end if


'response.write (idir & updnomefile)

fileXLS  = (idir & updnomefile)

if instr(updnomefile,"xls")>0 then 

		'Response.Write "Reading file: " & fileXLS & "<br>"
		Set connexcel = Server.CreateObject("ADODB.Connection")
		str      = "DRIVER={Microsoft Excel Driver (*.xls)};DBQ=" & trim(fileXLS) & ";DriverID=790"
		'Response.Write str & "<br>"

		connexcel.Open str

		Set rs   = Server.CreateObject("ADODB.Recordset")
		strSQL   = "SELECT * FROM [Foglio1$]"
		rs.Open strSQL, connexcel
		rs.movefirst
		'Response.Write(rs(0))

		Do While Not rs.EOF     
		   'Response.Write("insert into newsletter_mail (mail) value ('" & cstr(rs(0)) & "')" )
		   
		   connm.execute "insert into newsletter_mail (mail) value ('" & cstr(rs(0)) & "')" 
		   rs.movenext		   
		Loop

		rs.close
		set rs = Nothing
		connexcel.close
		set connexcel = Nothing
		'response.end
end if
%>



<meta http-equiv="refresh" content="2;URL=adnewsimport.asp">
</body>
</html>
