<!-- #include file = "cuteeditor_files/include_CuteEditor.asp" --> 
<!-- #include file = "connessionesql.inc" -->
<%txt_id=Request("id")%>	
<html>	
    <head>
		<title></title>
		<link rel="stylesheet" href="/admin/style.css"  type="text/css" />
		<meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta charset="utf-8">
		
	</head>
	<body>
	<br>
	 <!-- #include virtual="/admin/_menu.inc" -->
	   <%if Request("action")<>"nuova" then%>
		<form name="theForm" action="addettaglio.asp?action=modifica&id=<%=txt_id%>" method="post" ID="Form2">
		<%else%>
		 <form name="theForm" action="addettaglio.asp?action=save&id=<%=txt_id%>" method="post" ID="Form2">
		<%end if%>
		<h1>AGGIUNTA NOTIZIE</h1>
		<hr>
		<div class="infobox">
		<a href="adlista.asp">LISTA TUTTE LE NOTIZIE</a></div>
		<br>
		<%  'on error resume next
					
			dim content
			LCID = 1040
			Session.LCID = LCID
			
			
			if request("action")="save" then
				titolo		=	Request.Form("titolo")
				sottotitolo		=	Request.Form("sottotitolo")
				notizia	=	Request.Form("Editor1")     	
            
				'sql="select titolo,sottotitolo,notizia from news"
				'set rs=server.createobject("adodb.recordset")
				'rs.open sql,connm,3,3
				insertsql="insert into news (titolo,sottotitolo,notizia) values ('" & ucase(tosql(titolo)) & "','" & ucase(tosql(sottotitolo)) & "','" & tosql(notizia) & "')"
				'response.write(insertsql)
				connm.execute(insertsql)
				'response.end
				'rs.addnew
				'rs("titolo")	=	tosql(ucase(titolo))
				'rs("sottotitolo")	=	tosql(ucase(sottotitolo))
				'rs("notizia")	=	tosql(notizia)
				'rs.update
				
				response.write "<font size=5 color=darkred>aggiunto notizia</font>"
				response.write "<br>"
				'rs.close
				'set rs = nothing
				MySQL="select * from news order by id DESC limit 1"
				set rs=connm.execute(MySQL)
				if not rs.eof then
				  txt_id=rs("id")
				end if
				rs.close
				set rs = nothing
			else
			    if request("action")="modifica" then
							titolo		=	Request.Form("titolo")
							sottotitolo		=	Request.Form("sottotitolo")
							notizia	=	Request.Form("Editor1")     
							txt_id=Request("id")							
						    sql="update news set titolo='" & ucase(tosql(titolo)) & "',sottotitolo='" & ucase(tosql(sottotitolo)) & "',notizia='" & tosql(notizia) & "' where id=" & Request("id") & " limit 1"
						    'response.write(sql)
							'response.end
							connm.execute(sql)
				else
						on error resume next
						MySQL="select * from news where id=" & Request("id") & " order by id DESC"
						set rs2=connm.execute(MySQL)
						if not rs2.eof then
						    txt_id=rs2("id")
							dataora	 = rs2("dataora")
							titolo	 = rs2("titolo")
							sottotitolo	 = rs2("sottotitolo")
							notizia  = rs2("notizia")
							rs2.close
							set rs2=nothing
						end if
				end if	
			end if	
			%>
			
			TITOLO : <input name="titolo" type="text" maxlength="254" size="40" id="titolo" value="<%= titolo %>"class="NormalTextBox" style="width:600px;"> <br><br>
			SOTTOTITOLO : <input name="sottotitolo" type="text" maxlength="254" size="40" id="sottotitolo" value="<%= sottotitolo %>"class="NormalTextBox" style="width:600px;"> <br><br>
						
			<%						
						
			
			Dim editor
			Set editor = New CuteEditor
			editor.ID = "Editor1"
			editor.Text = notizia
			editor.Height = 550
			editor.EditorBodyStyle = "font:normal 12px arial;"
			editor.EditorWysiwygModeCss = "asp.css"
			editor.Draw()
			
			
				' Request.Form(ID) access from other page
		
			%>	
			<br>
			<div class="infobox">
			<input  type="submit" value="AGGIORNA"></form>
			<button onclick="window.open('../adanteprima.asp?id=<%=txt_id%>', '_blank')">&nbsp;ANTEPRIMA&nbsp;</button>
			<form name="theForm2" action="addettaglio.asp?action=nuova" method="post" ID="Form2">
			<input type="submit" value="NOTIZIA NUOVA">
		    </form>
			<form name="theForm3" action="adelimina.asp?id=<%=txt_id%>" method="post" ID="Form3">
			<input type="submit" value="ELIMINA">
			</form>
		
		
		</div>
			
		
	</body>
</html>
