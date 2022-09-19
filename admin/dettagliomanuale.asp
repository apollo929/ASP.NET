<!--#include file="connessionesql.asp" -->
<%Server.Execute(linkuserid & "\parametriasp.asp")

'DBUTENTE INTERNO							    			    
queryu="Select * From Registrazione where Id=" & Cint(Request("Id"))
Set Tbutu = Server.CreateObject("ADODB.Recordset")	
Tbutu.Open Queryu,Connm,1,3

if Trim(REQUEST("AspGridSave1"))="Save" then
    Vid=Tbutu("id")
    Tbutu.Addnew
	Tbutu("utente1")=Request.Form("utente")
	Tbutu("password1")=Request.Form("password")
	Tbutu("Email")=Request.Form("Mail")
	Tbutu("telefono")=Request.Form("telefono")
	Tbutu("telefonoagente")=Request.Form("telefonoagente")
	Tbutu("Ragione")=Request.Form("Ragione")	
	Tbutu("PI")=Request.Form("PI")																							
	Tbutu("Nome")=Request.Form("Nome")
	Tbutu("Cognome")=Request.Form("Cognome")	
	Tbutu("Indirizzo")=Request.Form("Indirizzo")
	Tbutu("Sede")=Request.Form("Sede")
	Tbutu("Citta")=Request.Form("Citta")	
	Tbutu("Cap")=Request.Form("Cap")
	Tbutu("Provincia")=Request.Form("Provincia")
	Tbutu("Prezzo")=Request.Form("Prezzo")
	Tbutu("Prezzoisp")=Request.Form("Prezzoisp")
	Tbutu("Prezzobuffetti")=Request.Form("Prezzobuffetti")
	Tbutu("Frequenza")=Request.Form("Frequenza")
	'Tbutu("data")=Request.Form("data")
	Tbutu.Update
	Tbutu.MoveLast
	response.Redirect "dettagliomanuale.asp?id=" & Tbutu("Id")
	response.end
end if
if Trim(REQUEST("AspGridDelete1"))="Delete" then
 Tbutu.Delete
 response.Redirect "adutentipro.asp?"
end if 

if not Tbutu.eof then 	
    Vid=Tbutu("id")								
	Vutente=Tbutu("utente1")
	Vpassword=Tbutu("password1")
	Vmail=Tbutu("Email") & " "
	Vtelefono=Tbutu("telefono") & " "
	Vtelefonoagente=Tbutu("telefonoagente") & " "
	Vragione=Tbutu("Ragione") & " "	
	Vpartitaiva=Tbutu("PI")	& " "																							
	Vnome=Tbutu("Nome") & " "
	Vcognome=Tbutu("Cognome") & " "	
	Vindirizzo=Tbutu("Indirizzo")& " "
	VSede=Tbutu("Sede")& " "
	Vcitta=Tbutu("Citta") & " "	
	Vcap=Tbutu("Cap") & " "
	Vprovincia=Tbutu("Provincia") & " "
	Vprezzo=Tbutu("Prezzo")
	Vprezzoisp=Tbutu("Prezzoisp")
	Vprezzobuffetti=Tbutu("Prezzobuffetti")
	Vfrequenza=Tbutu("Frequenza")
	Vdata=Tbutu("data")
end if
%>
<HTML><HEAD>
<title>SITO WEB E-COMMERCE BACK OFFICE</title>
<LINK rel="stylesheet" href="STYLE.CSS">
</HEAD>
<body  bgcolor=white>
<FORM ACTION="dettagliomanuale.asp?Id=<%=Vid%>" METHOD="POST"  ID=Form1>
<TABLE BORDER="1" CELLPADDING="0" CELLSPACING="0" WIDTH="400">
<TR><TD bgcolor=Moccasin>
<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="3" WIDTH="100%">
	<TR>
		<TD width=200><B >N° Utente:</B></TD>
		<TD ><b><%=Vid%></b></TD>
	</TR>
	<TR>
		<TD ><B >NOME:</B></TD>
		<TD ><INPUT TYPE="NOME" NAME="NOME" VALUE="<%=VNOME%>" ></TD>
	</TR>

	<TR>
		<TD ><B >COGNOME:</B></TD>
		<TD ><INPUT TYPE="COGNOME" NAME="COGNOME" VALUE="<%=VCOGNOME%>" ></TD>
	</TR>

	<TR>
		<TD ><B >INDIRIZZO:</B></TD>
		<TD ><INPUT TYPE="INDIRIZZO" NAME="INDIRIZZO" VALUE="<%=VINDIRIZZO%>" ></TD>
	</TR>

	<TR>
		<TD ><B >CITTA':</B></TD>
		<TD ><TEXTAREA NAME="CITTA" ROWS="1" COLS="60"  ><%=VCITTA%></TEXTAREA>
</TD>
	</TR>
	<TR>
		<TD ><B >CAP :</B></TD>
		<TD ><INPUT TYPE="TEXT " NAME="CAP" VALUE="<%=VCAP%>" ></TD>
	</TR>
	<TR>
		<TD ><B >PROVINCIA</B></TD>
		<TD ><INPUT TYPE="TEXT" NAME="PROVINCIA" VALUE="<%=VPROVINCIA%>" ></TD>
	</TR>
	<TR>
		<TD ><B >E-MAIL</B></TD>
		<TD ><TEXTAREA NAME="MAIL" ROWS="1" COLS="60" ID=TEXTAREA3>
<%=Vmail%></TEXTAREA>
</TD>
	</TR>
		<TR>
		<TD ><B >TELEFONO</B></TD>
		<TD ><INPUT TYPE="TEXT" NAME="TELEFONO" VALUE="<%=VTELEFONO%>" ></TD>
	</TR>
	<TR>
		<TD ><B >PARTITA IVA</B></TD>
		<TD ><INPUT TYPE="TEXT" NAME="PARTITAIVA" VALUE="<%=VPARTITAIVA%>" ></TD>
	</TR>
	<TR>
		<TD ><B >DATA </B></TD>
		<TD ><INPUT TYPE="TEXT" NAME="DATA" VALUE="<%=VDATA%>" ID=DATA></TD>
	</TR>
	<TR>
		<TD ><B >RAGIONE SOCIALE</B></TD>
		<TD ><TEXTAREA NAME="RAGIONE" ROWS="1" COLS="60" ID=TEXTAREA4>
<%=Vragione%></TEXTAREA>
</TD>
	</TR>
	<TR>
		<TD ><B >SEDE</B></TD>
		<TD ><TEXTAREA NAME="SEDE" ROWS="1" COLS="60" ID=TEXTAREA5>
<%=vsede%></TEXTAREA>
</TD>
	</TR>
	<TR>
		<TD ><B >UTENTE</B></TD>
		<TD ><INPUT TYPE="TEXT" NAME="UTENTE" VALUE="<%=VUTENTE%>" ></TD>
	</TR>
		<TR>
		<TD ><B >PASSWORD</B></TD>
		<TD ><INPUT TYPE="TEXT" NAME="PASSWORD" VALUE="<%=VPASSWORD%>" ></TD>
	</TR>
			<TR>
		<TD ><B >FREQUENZA</B></TD>
		<TD ><INPUT TYPE="TEXT" NAME="FREQUENZA" VALUE="<%=VFREQUENZA%>" ></TD>
	</TR>
	<TR>
	<TD ><B >PREZZO SPICERS</B></TD>
	<TD ><SELECT NAME="Prezzo" ID=Select1>
	<OPTION SELECTED VALUE="<%=VPrezzo%>"><%=VPrezzo%></OPTION>
	<OPTION VALUE="PREZZO1">PREZZO1</OPTION>
	<OPTION VALUE="PREZZO2">PREZZO2</OPTION>
	<OPTION VALUE="PREZZO3">PREZZO3</OPTION>
	<OPTION VALUE="PREZZO4">PREZZO4</OPTION>
	<OPTION VALUE="PREZZO5">PREZZO5</OPTION>
	</SELECT></TD>
	</TR>
	<TR>
	<TD ><B >PREZZO IS PRODUCTS</B></TD>
	<TD ><SELECT NAME="PrezzoISP" ID=Select2>
	<OPTION SELECTED VALUE="<%=VPrezzoISP%>"><%=VPrezzoISP%></OPTION>
	<OPTION VALUE="PREZZO1">PREZZO1</OPTION>
	<OPTION VALUE="PREZZO2">PREZZO2</OPTION>
	<OPTION VALUE="PREZZO3">PREZZO3</OPTION>
	<OPTION VALUE="PREZZO4">PREZZO4</OPTION>
	<OPTION VALUE="PREZZO5">PREZZO5</OPTION>
	</SELECT></TD>
	</TR>
	<!--TR>
	<TD ><B >PREZZO CWR</B></TD>
	<TD ><SELECT NAME="PrezzoCWR">
	<OPTION SELECTED VALUE="<%=VPrezzoCWR%>"><%=VPrezzoCWR%></OPTION>
	<OPTION VALUE="PREZZO1">PREZZO1</OPTION>
	<OPTION VALUE="PREZZO2">PREZZO2</OPTION>
	<OPTION VALUE="PREZZO3">PREZZO3</OPTION>
	<OPTION VALUE="PREZZO4">PREZZO4</OPTION>
	<OPTION VALUE="PREZZO5">PREZZO5</OPTION>
	</SELECT></TD>
	</TR-->
	<TR>
	<TD ><B >PREZZO BUFFETTI</B></TD>
	<TD ><SELECT NAME="PrezzoBUFFETTI" ID=Select3>
	<OPTION SELECTED VALUE="<%=VPrezzoBUFFETTI%>"><%=VPrezzoBUFFETTI%></OPTION>
	<OPTION VALUE="PREZZO1">PREZZO1</OPTION>
	<OPTION VALUE="PREZZO2">PREZZO2</OPTION>
	<OPTION VALUE="PREZZO3">PREZZO3</OPTION>
	<OPTION VALUE="PREZZO4">PREZZO4</OPTION>
	<OPTION VALUE="PREZZO5">PREZZO5</OPTION>
	</SELECT></TD>
	</TR>
	<TR>
	<TD ><B >NOME AGENTE</B></TD>
	<TD ><SELECT NAME="NOMEAGENTE" ID=Select4>
	<OPTION VALUE="0" SELECTED>Pcservice</OPTION>
	</SELECT></TD>
	</TR>
	<TR>
		<TD ><B >TELEFONO AGENTE</B></TD>
		<TD ><INPUT TYPE="TELEFONOAGENTE" NAME="TELEFONOAGENTE" VALUE="<%=VTELEFONOAGENTE%>" ></TD>
	</TR>
	<TR>
	<TD ><B >CATEGORIA CLIENTE</B></TD>
	<TD ><SELECT NAME="FIELD23" ID=Select5>
	<OPTION VALUE="0">1) GENERICO</OPTION>
	<OPTION VALUE="1">2) ASSOCIAZIONI</OPTION>
	<OPTION VALUE="2">3) COMMERCIO</OPTION>
	<OPTION VALUE="3">4) EDILIZIA/IMMOBILIARI</OPTION>
	<OPTION VALUE="4">5) INDUSTRIA/ARTIGIANATO</OPTION>
	<OPTION VALUE="5">6) MEDICINA</OPTION>
	<OPTION VALUE="6">7) PUBBLICA AMMINISTRAZIONE</OPTION>
	<OPTION VALUE="7">8) SERVIZI</OPTION>
	<OPTION VALUE="8">9) STUDI/PROFESSIONISTI</OPTION>
	<OPTION VALUE="9">10) TURISMO/TEMPO LIBERO</OPTION>
	</SELECT></TD>
	</TR>
	<TR><TD COLSPAN=2><HR></TD></TR>
	<TR>
		<TD ><B >RICEVERE EMAIL VIA INTERNET</B></TD>
		<TD ><INPUT TYPE="CHECKBOX" NAME="FIELD24" CHECKED ID=CHECKBOX1>
</TD>
	</TR>
	<TR><TD COLSPAN=2><HR></TD></TR>
	<TR>
		<TD ><B >DISABILITO LE SPESE DI SPEDIZIONE</B></TD>
		<TD ><INPUT TYPE="CHECKBOX" NAME="FIELD25" CHECKED ID=CHECKBOX2>
</TD>
	</TR>
	<!--TR>
		<TD ><B >RIFERIMENTO CODICE WINCODY</B></TD>
		<TD ><INPUT TYPE="TEXT" NAME="FIELD26" VALUE="NULL"></TD>
	</TR-->
	<TR><TD COLSPAN=2><HR></TD></TR>
		<TR>
		<TD ><B >OPERAZIONI</B></TD>
		<TD ALIGN=LEFT><INPUT TYPE="SUBMIT" VALUE="Save" NAME="AspGridSave1" ID=SUBMIT1><INPUT TYPE="SUBMIT" VALUE="Delete" NAME="AspGridDelete1" ID=SUBMIT2></TD></TR>
	</TR>
	</TABLE>
	
</TD></TR>
</TABLE>
</FORM>
</body></HTML>