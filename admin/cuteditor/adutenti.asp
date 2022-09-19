<!--#include file ="connessionesql.asp"-->
<%
'controllo session
if session("amm")<>"true" then
	response.Redirect("../riservata.asp")
end if
%>
<html>
<head>
<title>3DPrestige</title>
<meta name="robots" content="index,follow" >
<meta name="Keywords" content="3DPrestige " >
<meta name="Description" content="3DPrestige.it" >
<meta name="Author" content="www.jeniuscommunications.it" >
<script type="text/javascript" src="swfobject.js"></script>
<link rel="stylesheet" href="stylefonevuoto.css" >
</head>
<body bgcolor="#CCCCCC">
<table width="900px" height="100%" align="left">
	<tr>
		<td colspan="2" height="30px"><img src="images/testapiccolo.jpg"></td>
	</tr>
	<tr>
		<!--#include file ="menu.asp"-->
	    
		<td align="center" width="650px">
<%


		' Create instance 2 of AspGrid for the Employees table
	Set Grid = Server.CreateObject("Persits.Grid")

	' Connect
	Grid.Connect Conn.ConnectionString, "", ""

	' Specify SQL statement with default sorting
	Grid.SQL = "select * from amministrazione"
	
	' Hide identity column
	Grid("id").Hidden = True

 'Enable control buttons at both sides of grid
	Grid.ShowLeftSideButtons

	' Set max number of rows per page
	Grid.MaxRows = 10

	' Specify location of button images
	Grid.ImagePath = "images/"

	' Set colors
	Grid.ColRange(2, 4).Header.BGColor = "#F0E080"
	Grid.ColRange(2, 4).Cell.BGColor = "#EEEEEE"
	Grid.Cols(1).Cell.BGColor = "#ffffff"
	Grid.Cols(5).Cell.BGColor = "#ffffff"
	Grid.ColRange(2, 4).Cell.AltBGColor = "#C0C0C0"

	' Set fonts
	Grid.ColRange(1, 5).Cell.Font = "calibri"
	Grid.ColRange(1, 5).Cell.Font.Size = 2
	Grid.ColRange(1, 5).Cell.Font.Bold = True

	' Set table parameters
	Grid.Table.Width = 300
	Grid.Table.CellSpacing = 0
	Grid.Table.CellPadding = 1
	Grid.Cols(2).Header.Width = 220
	Grid.Cols(3).Header.Width = 80

	' Set table caption
	Grid.Table.Caption = "Amministrazione"
	Grid.Table.Caption.Font = "calibri"
	Grid.Table.Caption.Font.Size = 3
	Grid.Table.Caption.Font.Bold = True


	' Set sorting
	Grid.ColRange(2, 3).CanSort = True

	Grid.Display
	Grid.Disconnect

	Set Grid = Nothing
%>
		</td>
	</tr>
</table>


</body>
</html>
