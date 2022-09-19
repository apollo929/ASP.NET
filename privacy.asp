<!--#include file="connessionesql.inc"-->	
<!--#include file="parametriasp.inc"-->	
<!--#include file="parametriasplettura.inc" -->
<!DOCTYPE html>
<html>
<!--#include file="head.inc" -->
<body onLoad="Ricarica_carrello(0, 0, 0, 0);">
<!--#include file="top.inc" -->
<!--#include file="topmenu.inc" -->  
    
    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-center">
                        <h2>Privacy</h2>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End Page title area -->
    
    
    <div class="single-product-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
                <div class="col-md-4">
				<!--#include file="menusx.inc" -->		
					
                
                <div class="col-md-8">
                    <div class="product-content-right">
                        <div class="woocommerce">	

							
									<table width="95%"><tr><td class="tx14 nero" align="left">
								<a name="top"><h1>Tutela della privacy</h1></a>
								
									
								I dati relativi al titolare 
								della carta di credito inseriti successivamente alla 
								conferma d'ordine in modalita' <b>protetta e sicura</b> sono 
								inviati e trattati esclusivamente da <br><br>
								<strong> 
								<%=Session("ragionesocialetesto")%>
								<%=Session("titolofinepagina")%></strong><br><br>
								per le seguenti finalita': completamento e supporto 
								dell'accesso; esecuzione alla transazione che l'utente sta 
								compiendo; esecuzione degli obblighi di legge; esigenze di 
								tipo operativo e gestionale. 
								Informativa ai sensi della 
								legge 30 Giugno 2003 N.196 e sue successive modificazioni: 
								"Codice in materia di protezione dei dati personali".
								
								Con la compilazione del <b>
								modulo d'ordine</b>, acquisite le informazioni di cui 
								all'art.13 della legge 196/03, il cliente acconsente a 
								mettere a disposizione i suoi dati personali che saranno 
								utilizzati ai soli fini commerciali, fiscali, amministrativi 
								e informativi inerenti la nostra attivita'.<br>
								<br>
								Ai sensi della citata legge, <strong> 
								<%=Session("ragionesocialetesto")%>
								<%=Session("titolofinepagina")%></strong>, con 
								riferimento ai dati personali acquisiti o che verranno 
								acquisiti in relazione ai rapporti contrattuali intercorsi 
								col cliente o a quelli che potranno essere tenuti in futuro, 
								informa che: <br>&nbsp;
								
								<br>
								Ai sensi dell'art. 13 
								della legge 196/03 informiamo i clienti che la raccolta 
								e il trattamento dei dati personali ha l'esclusiva 
								finalita' di poter svolgere in modo adeguato la propria 
								attivita' economica; che i dati personali sono e saranno 
								trattati in modo lecito, secondo correttezza e nel 
								rispetto della citata legge, sia con sistemi 
								informatizzati che cartacei; 
								<br>la raccolta dei dati 
								personali ha natura obbligatoria, dovendosi dar corso 
								anche agli adempimenti di legge fiscale; 
								<br>i dati potranno essere 
								comunicati ad organizzazioni terze (banche, enti 
								assicurativi, corriere espresso) esclusivamente per lo 
								svolgimento del nostro rapporto e nell'ambito degli 
								incarichi a noi conferiti; 
								<br>ai sensi dell'art. 7 della legge 196/03 
								ricordiamo inoltre che in ogni momento sara' possibile avere 
								accesso ai propri dati personali, modificarli, cancellarli o 
								opporsi al loro utilizzo scrivendo con posta Raccomandata a: <br><br>
								<strong>
								<%=Session("ragionesocialetesto")%>
								<%=indirizzo%></strong>
								
								
									</td></tr></table>
								
								
                            </div>



                            </div>
                        </div>                        
                    </div>                    
                </div>
            </div>
        </div>
    </div>


<!--#include file="foot.inc"-->
  </body>
</html>
<!--#include file="sqlchiudi.inc"-->							
						