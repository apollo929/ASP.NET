<!--#include file=connessionesql.inc-->
<%
function SendEmail(byval strfrom,byval strto, byval strsubject, byval strbody)
	dim myMail
	Set myMail=CreateObject("CDO.Message")
	t1=lcase(request.ServerVariables("HTTP_HOST"))
	t2=lcase(request.ServerVariables("HTTP_REFERER"))
	t2=replace(t2,"http://","")
	if len(t1)>0 and len(t2)>0 then
		t2=left(t2,len(t1))
	else
		response.End()
	end if
	if t1<>t2 then response.end()
	myMail.Subject=strsubject
	myMail.From=strfrom
	myMail.HTMLBody=strbody
	myMail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
	myMail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserver") ="127.0.0.1"
	myMail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25
	myMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpusessl") = False 
	myMail.Configuration.Fields.Update
	myMail.To=strto
	myMail.Send
	set myMail=nothing
end function


if session("Ragione")="" then response.redirect("../login.asp")
if session("loginid")="" then response.Redirect("../login.asp")
intid=request("idprev")
if trim(intid)="" then response.Redirect("../login.asp")

' province
Set Tbprov = Server.CreateObject("ADODB.Recordset")
Sqlp="select * from province order by provincia"
Tbprov.Open Sqlp,conn
riaddebito="FALSE"


if trim(request("cm"))="rid" then
            'controllo presenza preventivi
			Set tbcontrollo=Server.CreateObject("ADODB.Recordset")					
			Sqlcontrollo="Select * from preventiviacquistati where idpreventivo='" & intid & "' and idazienda='" & session("loginid") & "'"
			'response.write(Sqlcontrollo)
			'response.end
			tbcontrollo.open Sqlcontrollo,conn
            if not tbcontrollo.eof then
					'estrapolo dati dal preventivo
					Set Tbscheda=Server.CreateObject("ADODB.Recordset")
					sql="Select * From preventivi where Id= '"& intid &"' and categorie like '%finto%' limit 1"
					'response.write(sql)
					'response.end
					Tbscheda.open sql,conn
					if not Tbscheda.eof then
						'elimino preventivo acquistato'
						Sqldelacq="delete from preventiviacquistati where idpreventivo='" & intid & "' and idazienda='" & session("loginid") & "'"
						'response.write(Sqldelacq)
						'response.end
						conn.Execute(Sqldelacq) 
						'aggiorno il campo crediti in lista
						session("crediti")=session("crediti")+20
						Sqlriad="update lista set preventivicrediti=" & session("crediti") & ",abilitatocrediti=1 where id='" & session("loginid") & "' limit 1"
						conn.Execute(Sqlriad) 
						'response.write(Sqlriad)
						riaddebito="TRUE"
						'cerco azienda su database
						Set tblista=Server.CreateObject("ADODB.Recordset")
						SQLaccedi="Select * From lista where id=" & session("loginid") & " LIMIT 1 union Select * From lista1 where id=" & session("loginid") & " LIMIT 1"
						tblista.open SQLaccedi,conn
						if not tblista.eof then	
							'inizializzo le variabili session
							session("nome")=""
							session("cognome")=""
							session("ragione")=tblista("ragione1")
							session("loginid")=tblista("Id")
							session("sesmail")=tblista("mail")
							session("sesprovincia")=tblista("provincia")
							session("sesragione")=tblista("ragione1")
							session("telefono")=tblista("cellulare")
							session("crediti")=Tblista("preventivicrediti")
							session("abilitatocrediti")=Tblista("abilitatocrediti")
						end if
						tblista.close
						Tbscheda.close
						'response.end
					else
							'response.write(Sqlcontrollo)
							'response.end
							'estrapolo dati dal preventivo
							Set Tbscheda=Server.CreateObject("ADODB.Recordset")
							sql="Select * From preventivi where Id= '"& intid & "' limit 1"
							'response.write(sql)
							'response.end
							Tbscheda.open sql,conn
							riaddebito="FALSE"
							HTML = ""
							HTML = HTML & "<html>" 
							HTML = HTML & "<head><style>.nero10 {color: #000000;text-decoration:none;}.BODY{FONT-FAMILY: arial;FONT-SIZE: 10pt;MARGIN-TOP: 1px}</style>" 
							HTML = HTML & "</head>" 
							HTML = HTML & "<body class=nero10><img src='http://www.jeniuscommunications.it/img/logo_new.jpg'><br><br>"
							HTML = HTML & "<strong><font color=Orange size=3 FACE=arial>RICHIESTA RIADDEBITO</font></strong><br>"
							HTML = HTML & "" 	
							HTML = HTML & "<br>"								
							HTML = HTML & "<b>ID AZIENDA:</b> " & session("loginid") & "<br>"
							HTML = HTML & "<b>Id preventivo:</b> " & Tbscheda("id") & "<br>"
							HTML = HTML & "<b>Categorie:</b> " & Tbscheda("categoriamaster") & "<br>"
							HTML = HTML & "<b>Referente:</b> " & Tbscheda("cognomenome") & "<br>"
							'HTML = HTML & "Indirizzo: " & Tbscheda("indirizzo") & "<br>"
							HTML = HTML & "<b>Citta': </b>" & Tbscheda("citta") & " - " & Tbscheda("provincia") & "</strong><br>"
							HTML = HTML & "<font color=red>Telefono: " & Tbscheda("telefono") & "</font><br>"
							HTML = HTML & "Mail: " & Tbscheda("mail") & "<br>"
							HTML = HTML & "<b>Dettagli: </b>" & Tbscheda("dettagli") & "<br><br>"
							HTML = HTML & "<br></body>" 
							HTML = HTML & "</html>" 
							Rt=SendEmail("documenti@costruttori.it","documenti@costruttori.it","COSTRUTTORI.IT RIADDEBITO ID",HTML)	
							Tbscheda.close		
					end if	
					
					
			else
							'response.write(Sqlcontrollo)
							'response.end
							'estrapolo dati dal preventivo
							Set Tbscheda=Server.CreateObject("ADODB.Recordset")
							sql="Select * From preventivi where Id= '"& intid & "' limit 1"
							'response.write(sql)
							'response.end
							Tbscheda.open sql,conn
							riaddebito="FALSE"
							HTML = ""
							HTML = HTML & "<html>" 
							HTML = HTML & "<head><style>.nero10 {color: #000000;text-decoration:none;}.BODY{FONT-FAMILY: arial;FONT-SIZE: 10pt;MARGIN-TOP: 1px}</style>" 
							HTML = HTML & "</head>" 
							HTML = HTML & "<body class=nero10><img src='http://www.jeniuscommunications.it/img/logo_new.jpg'><br><br>"
							HTML = HTML & "<strong><font color=Orange size=3 FACE=arial>RICHIESTA RIADDEBITO</font></strong><br>"
							HTML = HTML & "" 	
							HTML = HTML & "<br>"								
							HTML = HTML & "<b>ID AZIENDA:</b> " & session("loginid") & "<br>"
							HTML = HTML & "<b>Id preventivo:</b> " & Tbscheda("id") & "<br>"
							HTML = HTML & "<b>Categorie:</b> " & Tbscheda("categoriamaster") & "<br>"
							HTML = HTML & "<b>Referente:</b> " & Tbscheda("cognomenome") & "<br>"
							'HTML = HTML & "Indirizzo: " & Tbscheda("indirizzo") & "<br>"
							HTML = HTML & "<b>Citta': </b>" & Tbscheda("citta") & " - " & Tbscheda("provincia") & "</strong><br>"
							HTML = HTML & "<font color=red>Telefono: " & Tbscheda("telefono") & "</font><br>"
							HTML = HTML & "Mail: " & Tbscheda("mail") & "<br>"
							HTML = HTML & "<b>Dettagli: </b>" & Tbscheda("dettagli") & "<br><br>"
							HTML = HTML & "<br></body>" 
							HTML = HTML & "</html>" 
							Rt=SendEmail("documenti@costruttori.it","documenti@costruttori.it","COSTRUTTORI.IT RIADDEBITO ID",HTML)	
							Tbscheda.close	
			end if			
			tbcontrollo.close
			
end if


%>
<!DOCTYPE html>
<html lang="en">
    <head>
	<!--#include file=metatag.inc-->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Backoffice Costruttori</title>

        <<!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="css/metisMenu.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/startmin.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>

        <div id="wrapper">

            <!-- Navigation -->
				<!--#include file=topmenu.inc-->
				<!-- /.navbar-top-links -->
				<!--#include file=navbarback.inc-->
				<!--#include file=top_menu_sotto.inc-->
				<!--#include file="province.asp"-->
                <div class="row">
                    <div class="col-lg-12"> 
                            <!-- .panel-heading -->
                            <div class="panel-body">
                                <div class="panel-group" id="accordion">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">Contatti</a>
                                            </h4>
                                        </div>
                                        <div id="collapseOne" class="panel-collapse collapse in">
                                            <div class="panel-body">							
              
			  
												<%if riaddebito<>"TRUE" then%>
											  <div class="panel-body">	
												RIADDEBITO DA VERIFICARE 24H .	
												</div>	
												<%else%>
												<div class="panel-body">	
												RIADDEBITO ANDATO A BUON FINE .	
												</div>										
												<%end if%>
											
			  
		
                                            </div>
                                        </div>
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