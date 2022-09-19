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
        <<!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!-- MetisMenu CSS -->
        <link href="css/metisMenu.min.css" rel="stylesheet">
        <!-- Custom CSS -->
        <link href="css/startmin.css" rel="stylesheet">
        <!-- Custom Fonts -->
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div id="wrapper">

            <!-- Navigation -->
				<!--#include file=topmenu.inc-->
				<!--#include file=navbarback.inc-->
				<!--#include file=top_menu_sotto.inc-->
                <div class="row">
                    <div class="col-lg-12"> 
                            <!-- .panel-heading -->
                            <div class="panel-body">
                                <div class="panel-group" id="accordion">
                                    <div class="panel panel-default">
									
														<br><img src='images/wincody.png'><br>
<HR>
<b>GESTIONE UTENTI PROVENIENTI DA INTERNET<br>TRASFERIMENTO UTENTE DA INTERNET AD INTERNO</b> 
<HR>	
<% 

function apc(s)
	if isnull(s) then 
		apc=""
	else
		s=replace(s,"'","\'")
		apc=s
	end if
end function
on error goto 0

if request("trasf")="Trasferisci_utente_internet_ad_interno" then

		Set cn = Server.CreateObject("ADODB.Connection")
		cn.Open strConnect
		Set tb = Server.CreateObject("ADODB.Recordset")
		Set tbpro = Server.CreateObject("ADODB.Recordset")	
			
		tb.Open "select * from registrazioneint where id= " & Request("id"),cn
	    If not tb.EOF then		
		tbpro.Open "select * from registrazione where password1='" & apc(Request("password")) & "' or password2='" & apc(tb("password2")) & "'",cn
		if tbpro.EOF and Trim(Request("password"))<>"" then		
		cn.execute "insert into registrazione (" & _
		"Nome,Cognome,Indirizzo,Citta,Cap,Provincia,Email,Telefono,PI,Cf,Data,Ragione,Sede,Utente1," & _
		"Password1,Password2,Frequenza,Prezzo,Prezzoisp,Prezzocwr,PrezzoBuffetti,NomeAgente,TelefonoAgente," & _
		"Categoriacliente,Ricevereofferte,Spesedispedizione" & _
		") values (" & _
		"'" & apc(tb("Nome")) & "'," & _
		"'" & apc(tb("Cognome")) & "'," & _
		"'" & apc(tb("Indirizzo")) & "'," & _
		"'" & apc(tb("Citta")) & "'," & _
		"'" & apc(tb("Cap")) & "'," & _
		"'" & apc(tb("Provincia")) & "'," & _
		"'" & apc(tb("Email")) & "'," & _
		"'" & apc(tb("Telefono")) & "'," & _
		"'" & apc(tb("PI")) & "'," & _
		"'" & apc(tb("Cf")) & "'," & _
		"'" & apc(tb("Data")) & "'," & _
		"'" & apc(tb("Ragione")) & "'," & _
		"'" & apc(tb("Sede")) & "'," & _
		"'" & apc(tb("Utente1")) & "'," & _
		"'" & apc(Request("password")) & "'," & _
		"'" & apc(tb("password2")) & "'," & _
		"'" & apc(tb("Frequenza")) & "'," & _
		"'" & apc(tb("Prezzo")) & "'," & _
		"'" & apc(tb("Prezzoisp")) & "'," & _
		"'" & apc(tb("Prezzocwr")) & "'," & _
		"'" & apc(tb("PrezzoBuffetti")) & "'," & _
		"'" & apc(tb("NomeAgente")) & "'," & _
		"'" & apc(tb("TelefonoAgente")) & "'," & _
		"'" & apc(tb("Categoriacliente")) & "'," & _
		"'" & apc(tb("Ricevereofferte")) & "'," & _
		"'" & apc(tb("Spesedispedizione")) & "')" 

		'cambio
		'new password
		textn=apc(Request("password"))
		queryu="Select * From Registrazioneint where id= " & Request("id")
		Set Tbutu = Server.CreateObject("ADODB.Recordset")	
		Tbutu.Open Queryu,Connm
		'old password
		textv=Tbutu("password1")
        
		if textv<>"" and textn<>"" and not Tbutu.eof then
			StrSql="Update Registrazione Set Password1='" & textn & "' where password1='" & textv & "'"
			response.write(StrSql & "<br>")
			connm.EXECUTE(StrSql)
			StrSql="Update Profilo Set Password1='" & textn & "' where password1='" & textv & "'"
			response.write(StrSql & "<br>")
			connm.EXECUTE(StrSql)
			StrSql="Update Listino Set Password1='" & textn & "' where password1='" & textv & "'"
			response.write(StrSql & "<br>")
			connm.EXECUTE(StrSql)
			StrSql="Update Storico Set Password1='" & textn & "' where password1='" & textv & "'"
			response.write(StrSql & "<br>")
			connm.EXECUTE(StrSql)
			StrSql="Update Ordine Set Password1='" & textn & "' where password1='" & textv & "'"
			response.write(StrSql & "<br>")
			connm.EXECUTE(StrSql)
			response.write(StrSql & "<br>")
			response.write("SPOSTAMENTO ANDATO A BUON FINE")
		else
			response.write(" I campi non possono essere vuoti o errati <br>")
		end if
		'elimina file
		cn.execute "delete from registrazioneint where id= " & Request("id")
		else
		  errore="Rif.Wincody gia' presente verifica / Trasferimento non riuscito"		
		end if	
		tbpro.close	
	End if
	
	tb.Close
	cn.Close
end if	


   session.lcid=1040
   Response.Buffer = True

	
	Set Grid = Server.CreateObject("Persits.Grid")
	
	
	'Connessione
	Grid.Connect strConnect, "", ""
	
	'SQL
	Grid.SQL = "select id,Ragione,Utente1,Password1,Prezzo,Prezzoisp,Prezzocwr,Citta,Nome,Cognome,Email from registrazioneint where id=" & cint(Request("id"))	
  	Grid.MaxRows=1
  	
	'Hide identity column
	Grid.Cols("id").ReadOnly = True
				
	'SIZE
	Grid.Cols("CITTA").AttachTextarea 1,60
	Grid.Cols("EMAIL").AttachTextarea 1,60
	Grid.Cols("RAGIONE").AttachTextarea 1,60
	Grid.Cols("utente1").Caption="Utente"	
	Grid.Cols("password1").Caption="Psw"
	' Set Colors
	Grid.ColRange(1,28).Header.BGColor = "#B0B0FF"
	Grid.ColRange(1,28).Header.Font.Face = "Verdana"
	Grid.ColRange(1,28).Cell.Font.Face = "Verdana"
	Grid.ColRange(1,28).Cell.Font.Size=2
	Grid.ColRange(7,28).InputSize=9
	
	
	' Specify location of button images
	Grid.ImagePath = "images/"
	
	' Make grid read-only
	if request("trasf")="Trasferisci_utente_internet_ad_interno" then	
	 'Grid.UseImageButtons = True
	 'Grid.ShowLeftSideButtons
	 'Grid.DeleteButtonOnClick = "Sei sicuro di cancellare l'utente?"	
	else
	 Grid.UseImageButtons = False
	 Grid.ReadOnly = True	 
	end if
	Grid.Display
	Grid.Disconnect

	Set Grid = Nothing
	
	
	if request("trasf")="Trasferisci_utente_internet_ad_interno" and errore="" then%>  
	    <strong>Utente Trasferito>>>></strong>&nbsp;&nbsp;<%=nomeutente%>&nbsp;&nbsp;<strong>Ragione Sociale>>>></strong>&nbsp;&nbsp;<%=ragione%><br>
	    ATTENZIONE &gt;&gt;&gt;&gt; Cancellazione Utente Effettuata!
	<%else
	    response.Write(errore)
	%>	<FORM ACTION="trasfint.asp?trasf=invia" id=form1 name=form1>
		Sostituire Rif.Wincody(creato in automatico) con l'effettivo riferimento  Wincody :<BR>
		Riferimento Wincody Effettivo : <INPUT TYPE="text" NAME="password" ID=password>
		<INPUT type="hidden" ID=Hidden2 name="id" value='<%=request("id")%>'>
		<INPUT TYPE="submit" NAME="trasf" VALUE="Trasferisci_utente_internet_ad_interno" ID=SUBMIT1>
		</FORM> 	    
	<%end if%>	
                                    </div>							
                                </div>
                            </div>
                            <!-- .panel-body -->
                        					
                        <!-- /.panel -->
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                
                <!-- /.row -->
            </div>
            <!-- /#page-wrapper -->

        </div>
        <!-- /#wrapper -->

        <!-- jQuery -->
        <script src="js/jquery.min.js"></script>
        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>
        <!-- Metis Menu Plugin JavaScript -->
        <script src="js/metisMenu.min.js"></script>
        <!-- Custom Theme JavaScript -->
        <script src="js/startmin.js"></script>
    </body>
</html>
<!--#include file=closesql.inc-->