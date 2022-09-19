<!--#include file="connessionesql.inc"-->	
<!--#include file="parametriasp.inc"-->	
<!--#include file="parametriasplettura.inc" -->
<!DOCTYPE html>
<html lang="en">
<!--#include file="head.inc" -->
<body onLoad="Ricarica_carrello(0, 0, 0, 0);">
<!--#include file="top.inc" -->
<!--#include file="topmenu.inc" -->  
   
    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-center">
                        <h2>LOGIN AL SITO AVVENUTA CON SUCCESSO!</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
    <%if mobile<>"ok" then %> 
    <div class="single-product-area">
	<%else%>
	<div class="single-product-area2">
	<%end if%>
        <div class="zigzag-bottom"></div>
        <div class="container">
                <div class="col-md-4">
				<!--#include file="menusx.inc" -->
								<div align=center>
																		
																		
																		
								<%if Trim(Session("Chisono"))<>"" and trim(request("blocco"))="" then %>		
										<!-- --------------POPUP-------------- -->
										<!-- --------------POPUP-------------- -->
										<script>
										$(document).ready(function () {
										  $('#basic').popup({
											autoopen: true, /* per non far aprire al caricamento impostare su false */
											transition: 'all 0.3s',
											scrolllock: true
										  });
										});
										</script>
										<script>
										$(document).ready(function () {
										  $('#active_bg').popup({
											backgroundactive:true
										  });
										});
										</script>
										<!-- --------------POPUP-------------- -->
										<!-- --------------POPUP-------------- -->
										<div id="basic" class="well" style="background:#ffffff;width:480px;height:590px;border-radius: 10px 10px 10px 10px;top:0;"> 
											<center>																														<form>
												<table style = "border: solid, black, 2px ">
													<tr> 
														<td><label> nome&nbsp;:&nbsp; </label></td>
														<td><input type="text" placeholder = "nome"></td>
													</tr>
													<tr><td height="5px"></td></tr>	
													<tr> 
														<td> <label> cognome&nbsp;:&nbsp;</label></td>
														<td> <input type="text" placeholder = "cognome"></td>
													</tr>	
													<tr><td height="5px"></td></tr>														
													<tr height="45px"> 
															<td><label > marca moto&nbsp;:&nbsp; </label></td>
															<td valign="top">
																<div class="select-editable">	
																	<select style="color:#0072B5;margin:0px 0 0 0px; font-size:14px;width:320px;height:40px;" id="moto" onchange="this.nextElementSibling.value=this.value">
																	
																			<option            </option>              
																			<option  value="3PLUSCOCO"      data-gtm-label="3PLUSCOCO">  3PLUSCOCO    </option>            
																			<option  value="A&amp;M"      data-gtm-label="A&amp;M">  A&amp;M    </option>            
																			<option  value="ACCESS"      data-gtm-label="ACCESS">  ACCESS    </option>            
																			<option  value="ADIVA"      data-gtm-label="ADIVA">  ADIVA    </option>            
																			<option  value="ADLER"      data-gtm-label="ADLER">  ADLER    </option>            
																			<option  value="ADLY"      data-gtm-label="ADLY">  ADLY    </option>            
																			<option  value="AEON"      data-gtm-label="AEON">  AEON    </option>            
																			<option  value="AERMACCHI"      data-gtm-label="AERMACCHI">  AERMACCHI    </option>            
																			<option  value="AIE"      data-gtm-label="AIE">  AIE    </option>            
																			<option  value="AJP"      data-gtm-label="AJP">  AJP    </option>            
																			<option  value="AJS"      data-gtm-label="AJS">  AJS    </option>            
																			<option  value="Alpino"      data-gtm-label="Alpino">  Alpino    </option>            
																			<option  value="AME"      data-gtm-label="AME">  AME    </option>            
																			<option  value="AMERICAN  IRONHORSE"    data-gtm-label="AMERICAN  IRONHORSE">  AMERICAN  IRONHORSE    </option>        
																			<option  value="AMI"      data-gtm-label="AMI">  AMI    </option>            
																			<option  value="ANSSEMS"      data-gtm-label="ANSSEMS">  ANSSEMS    </option>            
																			<option  value="APRILIA"      data-gtm-label="APRILIA">  APRILIA    </option>            
																			<option  value="ARCH"      data-gtm-label="ARCH">  ARCH    </option>            
																			<option  value="ARCTIC  CAT"    data-gtm-label="ARCTIC  CAT">  ARCTIC  CAT    </option>        
																			<option  value="ARDIE"      data-gtm-label="ARDIE">  ARDIE    </option>            
																			<option  value="ARIEL"      data-gtm-label="ARIEL">  ARIEL    </option>            
																			<option  value="ARIIC"      data-gtm-label="ARIIC">  ARIIC    </option>            
																			<option  value="ARMEC"      data-gtm-label="ARMEC">  ARMEC    </option>            
																			<option  value="ASA"      data-gtm-label="ASA">  ASA    </option>            
																			<option  value="ASKOLL"      data-gtm-label="ASKOLL">  ASKOLL    </option>            
																			<option  value="ASPES"      data-gtm-label="ASPES">  ASPES    </option>            
																			<option  value="BAOTIAN"      data-gtm-label="BAOTIAN">  BAOTIAN    </option>            
																			<option  value="BAROSSA"      data-gtm-label="BAROSSA">  BAROSSA    </option>            
																			<option  value="BASHAN"      data-gtm-label="BASHAN">  BASHAN    </option>            
																			<option  value="BEELINE"      data-gtm-label="BEELINE">  BEELINE    </option>            
																			<option  value="BELA  B."    data-gtm-label="BELA  B.">  BELA  B.    </option>        
																			<option  value="BENELLI"      data-gtm-label="BENELLI">  BENELLI    </option>            
																			<option  value="BERINGER"      data-gtm-label="BERINGER">  BERINGER    </option>            
																			<option  value="BETA"      data-gtm-label="BETA">  BETA    </option>            
																			<option  value="BFG"      data-gtm-label="BFG">  BFG    </option>            
																			<option  value="BHR"      data-gtm-label="BHR">  BHR    </option>            
																			<option  value="BIANCHI"      data-gtm-label="BIANCHI">  BIANCHI    </option>            
																			<option  value="BIG  BEAR"    data-gtm-label="BIG  BEAR">  BIG  BEAR    </option>        
																			<option  value="BIG  DOG"    data-gtm-label="BIG  DOG">  BIG  DOG    </option>        
																			<option  value="BIKEBOARD"      data-gtm-label="BIKEBOARD">  BIKEBOARD    </option>            
																			<option  value="BIMOTA"      data-gtm-label="BIMOTA">  BIMOTA    </option>            
																			<option  value="BIRO"      data-gtm-label="BIRO">  BIRO    </option>            
																			<option  value="BLATA"      data-gtm-label="BLATA">  BLATA    </option>            
																			<option  value="BMW"      data-gtm-label="BMW">  BMW    </option>            
																			<option  value="BÃ–CKMANN"      data-gtm-label="BÃ–CKMANN">  BÃ–CKMANN    </option>            
																			<option  value="BOMBARDIER"      data-gtm-label="BOMBARDIER">  BOMBARDIER    </option>            
																			<option  value="BOOM-TRIKES"      data-gtm-label="BOOM-TRIKES">  BOOM-TRIKES    </option>            
																			<option  value="BORILE"      data-gtm-label="BORILE">  BORILE    </option>            
																			<option  value="BOROSSI  JOYNER"    data-gtm-label="BOROSSI  JOYNER">  BOROSSI  JOYNER    </option>        
																			<option  value="BOSS  HOSS"    data-gtm-label="BOSS  HOSS">  BOSS  HOSS    </option>        
																			<option  value="BRAMMO"      data-gtm-label="BRAMMO">  BRAMMO    </option>            
																			<option  value="BRIXTON"      data-gtm-label="BRIXTON">  BRIXTON    </option>            
																			<option  value="BROOK"      data-gtm-label="BROOK">  BROOK    </option>            
																			<option  value="BROUGH  SUPERIOR"    data-gtm-label="BROUGH  SUPERIOR">  BROUGH  SUPERIOR    </option>        
																			<option  value="BSA"      data-gtm-label="BSA">  BSA    </option>            
																			<option  value="BSU"      data-gtm-label="BSU">  BSU    </option>            
																			<option  value="BUELL"      data-gtm-label="BUELL">  BUELL    </option>            
																			<option  value="BULLIT"      data-gtm-label="BULLIT">  BULLIT    </option>            
																			<option  value="BULTACO"      data-gtm-label="BULTACO">  BULTACO    </option>            
																			<option  value="BYE  BIKE"    data-gtm-label="BYE  BIKE">  BYE  BIKE    </option>        
																			<option  value="CAGIVA"      data-gtm-label="CAGIVA">  CAGIVA    </option>            
																			<option  value="CAKE"      data-gtm-label="CAKE">  CAKE    </option>            
																			<option  value="CAN-AM"      data-gtm-label="CAN-AM">  CAN-AM    </option>            
																			<option  value="CAREER"      data-gtm-label="CAREER">  CAREER    </option>            
																			<option  value="CARVER"      data-gtm-label="CARVER">  CARVER    </option>            
																			<option  value="CCM"      data-gtm-label="CCM">  CCM    </option>            
																			<option  value="CECTEK"      data-gtm-label="CECTEK">  CECTEK    </option>            
																			<option  value="CEMOTO"      data-gtm-label="CEMOTO">  CEMOTO    </option>            
																			<option  value="CEZETA"      data-gtm-label="CEZETA">  CEZETA    </option>            
																			<option  value="CF  MOTO"    data-gtm-label="CF  MOTO">  CF  MOTO    </option>        
																			<option  value="CHANGJIANG"      data-gtm-label="CHANGJIANG">  CHANGJIANG    </option>            
																			<option  value="CILO"      data-gtm-label="CILO">  CILO    </option>            
																			<option  value="CITY  BIKE"    data-gtm-label="CITY  BIKE">  CITY  BIKE    </option>        
																			<option  value="CITYCOCO"      data-gtm-label="CITYCOCO">  CITYCOCO    </option>            
																			<option  value="CLASSIC  CYCLES"    data-gtm-label="CLASSIC  CYCLES">  CLASSIC  CYCLES    </option>        
																			<option  value="CLEVELAND"      data-gtm-label="CLEVELAND">  CLEVELAND    </option>            
																			<option  value="COLOVE"      data-gtm-label="COLOVE">  COLOVE    </option>            
																			<option  value="CONDOR"      data-gtm-label="CONDOR">  CONDOR    </option>            
																			<option  value="CORVUS"      data-gtm-label="CORVUS">  CORVUS    </option>            
																			<option  value="COVENTRY-EAGLE"      data-gtm-label="COVENTRY-EAGLE">  COVENTRY-EAGLE    </option>            
																			<option  value="COVINGTONS"      data-gtm-label="COVINGTONS">  COVINGTONS    </option>            
																			<option  value="CPI"      data-gtm-label="CPI">  CPI    </option>            
																			<option  value="CR&amp;S"      data-gtm-label="CR&amp;S">  CR&amp;S    </option>            
																			<option  value="DAELIM"      data-gtm-label="DAELIM">  DAELIM    </option>            
																			<option  value="DALTEC"      data-gtm-label="DALTEC">  DALTEC    </option>            
																			<option  value="DAXARA"      data-gtm-label="DAXARA">  DAXARA    </option>            
																			<option  value="DERBI"      data-gtm-label="DERBI">  DERBI    </option>            
																			<option  value="DI  BLASI"    data-gtm-label="DI  BLASI">  DI  BLASI    </option>        
																			<option  value="DINLI"      data-gtm-label="DINLI">  DINLI    </option>            
																			<option  value="DKW"      data-gtm-label="DKW">  DKW    </option>            
																			<option  value="DNEPR"      data-gtm-label="DNEPR">  DNEPR    </option>            
																			<option  value="DOGEBOS"      data-gtm-label="DOGEBOS">  DOGEBOS    </option>            
																			<option  value="DOOHAN"      data-gtm-label="DOOHAN">  DOOHAN    </option>            
																			<option  value="DORTON  WALKER"    data-gtm-label="DORTON  WALKER">  DORTON  WALKER    </option>        
																			<option  value="DOUGLAS"      data-gtm-label="DOUGLAS">  DOUGLAS    </option>            
																			<option  value="DUCATI"      data-gtm-label="DUCATI">  DUCATI    </option>            
																			<option  value="E  TROPOLIS"    data-gtm-label="E  TROPOLIS">  E  TROPOLIS    </option>        
																			<option  value="E.F.O"      data-gtm-label="E.F.O">  E.F.O    </option>            
																			<option  value="EASY  TRIKE"    data-gtm-label="EASY  TRIKE">  EASY  TRIKE    </option>        
																			<option  value="EASY  WATTS"    data-gtm-label="EASY  WATTS">  EASY  WATTS    </option>        
																			<option  value="E-ATV"      data-gtm-label="E-ATV">  E-ATV    </option>            
																			<option  value="EBR"      data-gtm-label="EBR">  EBR    </option>            
																			<option  value="ECCITY"      data-gtm-label="ECCITY">  ECCITY    </option>            
																			<option  value="ECOBIT"      data-gtm-label="ECOBIT">  ECOBIT    </option>            
																			<option  value="ECOOTER"      data-gtm-label="ECOOTER">  ECOOTER    </option>            
																			<option  value="EFUN"      data-gtm-label="EFUN">  EFUN    </option>            
																			<option  value="EGLI"      data-gtm-label="EGLI">  EGLI    </option>            
																			<option  value="ELECTRIC  MOTION"    data-gtm-label="ELECTRIC  MOTION">  ELECTRIC  MOTION    </option>        
																			<option  value="E-MAX"      data-gtm-label="E-MAX">  E-MAX    </option>            
																			<option  value="EMCO"      data-gtm-label="EMCO">  EMCO    </option>            
																			<option  value="EMIA"      data-gtm-label="EMIA">  EMIA    </option>            
																			<option  value="EML"      data-gtm-label="EML">  EML    </option>            
																			<option  value="ENERGICA"      data-gtm-label="ENERGICA">  ENERGICA    </option>            
																			<option  value="E-SCOOTER"      data-gtm-label="E-SCOOTER">  E-SCOOTER    </option>            
																			<option  value="ETRIX"      data-gtm-label="ETRIX">  ETRIX    </option>            
																			<option  value="E-TROPOLIS"      data-gtm-label="E-TROPOLIS">  E-TROPOLIS    </option>            
																			<option  value="EVT"      data-gtm-label="EVT">  EVT    </option>            
																			<option  value="EWII"      data-gtm-label="EWII">  EWII    </option>            
																			<option  value="EXCALIBUR"      data-gtm-label="EXCALIBUR">  EXCALIBUR    </option>            
																			<option  value="EXPLORER"      data-gtm-label="EXPLORER">  EXPLORER    </option>            
																			<option  value="EZS"      data-gtm-label="EZS">  EZS    </option>            
																			<option  value="FADA"      data-gtm-label="FADA">  FADA    </option>            
																			<option  value="FAMEL"      data-gtm-label="FAMEL">  FAMEL    </option>            
																			<option  value="FANTIC"      data-gtm-label="FANTIC">  FANTIC    </option>            
																			<option  value="FANTIC  MOTOR"    data-gtm-label="FANTIC  MOTOR">  FANTIC  MOTOR    </option>        
																			<option  value="FD  MOTORS"    data-gtm-label="FD  MOTORS">  FD  MOTORS    </option>        
																			<option  value="FENIAN"      data-gtm-label="FENIAN">  FENIAN    </option>            
																			<option  value="FIVE  STAR-SENN"    data-gtm-label="FIVE  STAR-SENN">  FIVE  STAR-SENN    </option>        
																			<option  value="FLEX  TECH"    data-gtm-label="FLEX  TECH">  FLEX  TECH    </option>        
																			<option  value="FLYER"      data-gtm-label="FLYER">  FLYER    </option>            
																			<option  value="FN"      data-gtm-label="FN">  FN    </option>            
																			<option  value="FORSEN"      data-gtm-label="FORSEN">  FORSEN    </option>            
																			<option  value="FULU"      data-gtm-label="FULU">  FULU    </option>            
																			<option  value="FURRER-TRIKES"      data-gtm-label="FURRER-TRIKES">  FURRER-TRIKES    </option>            
																			<option  value="GARELLI"      data-gtm-label="GARELLI">  GARELLI    </option>            
																			<option  value="GAS  GAS"    data-gtm-label="GAS  GAS">  GAS  GAS    </option>        
																			<option  value="GECO"      data-gtm-label="GECO">  GECO    </option>            
																			<option  value="GENERIC  KSR MOTO"    data-gtm-label="GENERIC  /  KSR  MOTO">  GENERIC  /  KSR  MOTO    </option>
																			<option  value="GG"      data-gtm-label="GG">  GG    </option>            
																			<option  value="GHEZZI  BRIAN"    data-gtm-label="GHEZZI  BRIAN">  GHEZZI  BRIAN    </option>        
																			<option  value="GILERA"      data-gtm-label="GILERA">  GILERA    </option>            
																			<option  value="GOES"      data-gtm-label="GOES">  GOES    </option>            
																			<option  value="GOVECS"      data-gtm-label="GOVECS">  GOVECS    </option>            
																			<option  value="GRAF  CARELLO"    data-gtm-label="GRAF  CARELLO">  GRAF  CARELLO    </option>        
																			<option  value="GRINNALL"      data-gtm-label="GRINNALL">  GRINNALL    </option>            
																			<option  value="GSMOON"      data-gtm-label="GSMOON">  GSMOON    </option>            
																			<option  value="HAIBIKE"      data-gtm-label="HAIBIKE">  HAIBIKE    </option>            
																			<option  value="HANWAY"      data-gtm-label="HANWAY">  HANWAY    </option>            
																			<option  value="HARLEY-DAVIDSON"      data-gtm-label="HARLEY-DAVIDSON">  HARLEY-DAVIDSON    </option>            
																			<option  value="HEADBANGER"      data-gtm-label="HEADBANGER">  HEADBANGER    </option>            
																			<option  value="HEINKEL"      data-gtm-label="HEINKEL">  HEINKEL    </option>            
																			<option  value="HENDERSON"      data-gtm-label="HENDERSON">  HENDERSON    </option>            
																			<option  value="HERCHEE"      data-gtm-label="HERCHEE">  HERCHEE    </option>            
																			<option  value="HERKULES"      data-gtm-label="HERKULES">  HERKULES    </option>            
																			<option  value="HESKETH"      data-gtm-label="HESKETH">  HESKETH    </option>            
																			<option  value="HISUN"      data-gtm-label="HISUN">  HISUN    </option>            
																			<option  value="HM-MOSER"      data-gtm-label="HM-MOSER">  HM-MOSER    </option>            
																			<option  value="HMO"      data-gtm-label="HMO">  HMO    </option>            
																			<option  value="HOLLISTERS"      data-gtm-label="HOLLISTERS">  HOLLISTERS    </option>            
																			<option  value="HONDA"      data-gtm-label="HONDA">  HONDA    </option>            
																			<option  value="HOREX"      data-gtm-label="HOREX">  HOREX    </option>            
																			<option  value="HPU"      data-gtm-label="HPU">  HPU    </option>            
																			<option  value="HRD"      data-gtm-label="HRD">  HRD    </option>            
																			<option  value="HULCO"      data-gtm-label="HULCO">  HULCO    </option>            
																			<option  value="HUMBAUR"      data-gtm-label="HUMBAUR">  HUMBAUR    </option>            
																			<option  value="HUSABERG"      data-gtm-label="HUSABERG">  HUSABERG    </option>            
																			<option  value="HUSQVARNA"      data-gtm-label="HUSQVARNA">  HUSQVARNA    </option>            
																			<option  value="HUSQVARNA  BICYCLES"    data-gtm-label="HUSQVARNA  BICYCLES">  HUSQVARNA  BICYCLES    </option>        
																			<option  value="HVR"      data-gtm-label="HVR">  HVR    </option>            
																			<option  value="HYOSUNG"      data-gtm-label="HYOSUNG">  HYOSUNG    </option>            
																			<option  value="HYTRACK"      data-gtm-label="HYTRACK">  HYTRACK    </option>            
																			<option  value="IFOR"      data-gtm-label="IFOR">  IFOR    </option>            
																			<option  value="INDIAN"      data-gtm-label="INDIAN">  INDIAN    </option>            
																			<option  value="IO"      data-gtm-label="IO">  IO    </option>            
																			<option  value="ISO"      data-gtm-label="ISO">  ISO    </option>            
																			<option  value="ITALJET"      data-gtm-label="ITALJET">  ITALJET    </option>            
																			<option  value="JAWA"      data-gtm-label="JAWA">  JAWA    </option>            
																			<option  value="JIALING"      data-gtm-label="JIALING">  JIALING    </option>            
																			<option  value="JINCHENG"      data-gtm-label="JINCHENG">  JINCHENG    </option>            
																			<option  value="JINLING"      data-gtm-label="JINLING">  JINLING    </option>            
																			<option  value="JINLUN"      data-gtm-label="JINLUN">  JINLUN    </option>            
																			<option  value="JOHAMMER"      data-gtm-label="JOHAMMER">  JOHAMMER    </option>            
																			<option  value="JONWAY"      data-gtm-label="JONWAY">  JONWAY    </option>            
																			<option  value="JORDAN"      data-gtm-label="JORDAN">  JORDAN    </option>            
																			<option  value="JOTAGAS"      data-gtm-label="JOTAGAS">  JOTAGAS    </option>            
																			<option  value="JOYNER"      data-gtm-label="JOYNER">  JOYNER    </option>            
																			<option  value="JUNAK"      data-gtm-label="JUNAK">  JUNAK    </option>            
																			<option  value="KALEX"      data-gtm-label="KALEX">  KALEX    </option>            
																			<option  value="KAWASAKI"      data-gtm-label="KAWASAKI">  KAWASAKI    </option>            
																			<option  value="KBM"      data-gtm-label="KBM">  KBM    </option>            
																			<option  value="KEEWAY"      data-gtm-label="KEEWAY">  KEEWAY    </option>            
																			<option  value="KIKKER  5150"    data-gtm-label="KIKKER  5150">  KIKKER  5150    </option>        
																			<option  value="KINGTEX"      data-gtm-label="KINGTEX">  KINGTEX    </option>            
																			<option  value="KINROAD"      data-gtm-label="KINROAD">  KINROAD    </option>            
																			<option  value="KITO"      data-gtm-label="KITO">  KITO    </option>            
																			<option  value="KJMCO"      data-gtm-label="KJMCO">  KJMCO    </option>            
																			<option  value="KL"      data-gtm-label="KL">  KL    </option>            
																			<option  value="KODLIN"      data-gtm-label="KODLIN">  KODLIN    </option>            
																			<option  value="KOEHLER  ESCOFFIER"    data-gtm-label="KOEHLER  ESCOFFIER">  KOEHLER  ESCOFFIER    </option>        
																			<option  value="KRÃ„MER"      data-gtm-label="KRÃ„MER">  KRÃ„MER    </option>            
																			<option  value="KREIDLER"      data-gtm-label="KREIDLER">  KREIDLER    </option>            
																			<option  value="KTM"      data-gtm-label="KTM">  KTM    </option>            
																			<option  value="KUMPAN"      data-gtm-label="KUMPAN">  KUMPAN    </option>            
																			<option  value="KVN"      data-gtm-label="KVN">  KVN    </option>            
																			<option  value="KYBURZ"      data-gtm-label="KYBURZ">  KYBURZ    </option>            
																			<option  value="KYMCO"      data-gtm-label="KYMCO">  KYMCO    </option>            
																			<option  value="LA  STRADA"    data-gtm-label="LA  STRADA">  LA  STRADA    </option>        
																			<option  value="LAMBRETTA"      data-gtm-label="LAMBRETTA">  LAMBRETTA    </option>            
																			<option  value="LAVERDA"      data-gtm-label="LAVERDA">  LAVERDA    </option>            
																			<option  value="LAZARETH"      data-gtm-label="LAZARETH">  LAZARETH    </option>            
																			<option  value="LIDER"      data-gtm-label="LIDER">  LIDER    </option>            
																			<option  value="LIFAN"      data-gtm-label="LIFAN">  LIFAN    </option>            
																			<option  value="LINHAI"      data-gtm-label="LINHAI">  LINHAI    </option>            
																			<option  value="LMI  FLISTAR"    data-gtm-label="LMI  FLISTAR">  LMI  FLISTAR    </option>        
																			<option  value="LML"      data-gtm-label="LML">  LML    </option>            
																			<option  value="LONGCHANG"      data-gtm-label="LONGCHANG">  LONGCHANG    </option>            
																			<option  value="LUYUAN"      data-gtm-label="LUYUAN">  LUYUAN    </option>            
																			<option  value="LVNENG"      data-gtm-label="LVNENG">  LVNENG    </option>            
																			<option  value="LYNX"      data-gtm-label="LYNX">  LYNX    </option>            
																			<option  value="MAGNAT-DEBON"      data-gtm-label="MAGNAT-DEBON">  MAGNAT-DEBON    </option>            
																			<option  value="MAICO"      data-gtm-label="MAICO">  MAICO    </option>            
																			<option  value="MALAGUTI"      data-gtm-label="MALAGUTI">  MALAGUTI    </option>            
																			<option  value="MALANCA"      data-gtm-label="MALANCA">  MALANCA    </option>            
																			<option  value="MANGOSTEEN"      data-gtm-label="MANGOSTEEN">  MANGOSTEEN    </option>            
																			<option  value="MASAI"      data-gtm-label="MASAI">  MASAI    </option>            
																			<option  value="MASH"      data-gtm-label="MASH">  MASH    </option>            
																			<option  value="MATCHLESS"      data-gtm-label="MATCHLESS">  MATCHLESS    </option>            
																			<option  value="MBK"      data-gtm-label="MBK">  MBK    </option>            
																			<option  value="ME  SCOOTER"    data-gtm-label="ME  SCOOTER">  ME  SCOOTER    </option>        
																			<option  value="MESSERSCHMITT"      data-gtm-label="MESSERSCHMITT">  MESSERSCHMITT    </option>            
																			<option  value="MICHAEL  BLAST"    data-gtm-label="MICHAEL  BLAST">  MICHAEL  BLAST    </option>        
																			<option  value="MIDLAND  CHOPPERS"    data-gtm-label="MIDLAND  CHOPPERS">  MIDLAND  CHOPPERS    </option>        
																			<option  value="MKS"      data-gtm-label="MKS">  MKS    </option>            
																			<option  value="MOBEC"      data-gtm-label="MOBEC">  MOBEC    </option>            
																			<option  value="MOKO"      data-gtm-label="MOKO">  MOKO    </option>            
																			<option  value="MONARK"      data-gtm-label="MONARK">  MONARK    </option>            
																			<option  value="MONDIAL"      data-gtm-label="MONDIAL">  MONDIAL    </option>            
																			<option  value="MONET-GOYON"      data-gtm-label="MONET-GOYON">  MONET-GOYON    </option>            
																			<option  value="MONNIER-HONDA"      data-gtm-label="MONNIER-HONDA">  MONNIER-HONDA    </option>            
																			<option  value="MONTESA"      data-gtm-label="MONTESA">  MONTESA    </option>            
																			<option  value="MORAKOT"      data-gtm-label="MORAKOT">  MORAKOT    </option>            
																			<option  value="MOTO  Di FERRO"    data-gtm-label="MOTO  DI  FERRO">  MOTO  DI  FERRO    </option>    
																			<option  value="MOTO  GUZZI"    data-gtm-label="MOTO  GUZZI">  MOTO  GUZZI    </option>        
																			<option  value="MOTO  MORINI"    data-gtm-label="MOTO  MORINI">  MOTO  MORINI    </option>        
																			<option  value="MOTO  ZETA"    data-gtm-label="MOTO  ZETA">  MOTO  ZETA    </option>        
																			<option  value="MOTOBECANE"      data-gtm-label="MOTOBECANE">  MOTOBECANE    </option>            
																			<option  value="MOTOBI"      data-gtm-label="MOTOBI">  MOTOBI    </option>            
																			<option  value="MOTOGRAZIELLA"      data-gtm-label="MOTOGRAZIELLA">  MOTOGRAZIELLA    </option>            
																			<option  value="MOTOM"      data-gtm-label="MOTOM">  MOTOM    </option>            
																			<option  value="MOTOR  MANIA"    data-gtm-label="MOTOR  MANIA">  MOTOR  MANIA    </option>        
																			<option  value="MOTOSACOCHE"      data-gtm-label="MOTOSACOCHE">  MOTOSACOCHE    </option>            
																			<option  value="MOTRON"      data-gtm-label="MOTRON">  MOTRON    </option>            
																			<option  value="MUTT"      data-gtm-label="MUTT">  MUTT    </option>            
																			<option  value="MV  AGUSTA"    data-gtm-label="MV  AGUSTA">  MV  AGUSTA    </option>        
																			<option  value="MWH"      data-gtm-label="MWH">  MWH    </option>            
																			<option  value="MZ"      data-gtm-label="MZ">  MZ    </option>            
																			<option  value="MZ  (MuZ)"    data-gtm-label="MZ  (MuZ)">  MZ  (MuZ)    </option>        
																			<option  value="NESS  MOTORCYCLES"    data-gtm-label="NESS  MOTORCYCLES">  NESS  MOTORCYCLES    </option>        
																			<option  value="NEW  IMPERIAL"    data-gtm-label="NEW  IMPERIAL">  NEW  IMPERIAL    </option>        
																			<option  value="NIMBUS"      data-gtm-label="NIMBUS">  NIMBUS    </option>            
																			<option  value="NITO"      data-gtm-label="NITO">  NITO    </option>            
																			<option  value="NIU"      data-gtm-label="NIU">  NIU    </option>            
																			<option  value="NORTON"      data-gtm-label="NORTON">  NORTON    </option>            
																			<option  value="NSU"      data-gtm-label="NSU">  NSU    </option>            
																			<option  value="ODERMATT-KTM"      data-gtm-label="ODERMATT-KTM">  ODERMATT-KTM    </option>            
																			<option  value="OK-SUPREME"      data-gtm-label="OK-SUPREME">  OK-SUPREME    </option>            
																			<option  value="ONLINE"      data-gtm-label="ONLINE">  ONLINE    </option>            
																			<option  value="ORCAL"      data-gtm-label="ORCAL">  ORCAL    </option>            
																			<option  value="OSET"      data-gtm-label="OSET">  OSET    </option>            
																			<option  value="OSSA"      data-gtm-label="OSSA">  OSSA    </option>            
																			<option  value="OUTBACK"      data-gtm-label="OUTBACK">  OUTBACK    </option>            
																			<option  value="OXYGEN"      data-gtm-label="OXYGEN">  OXYGEN    </option>            
																			<option  value="PANNONIA"      data-gtm-label="PANNONIA">  PANNONIA    </option>            
																			<option  value="PANTHER"      data-gtm-label="PANTHER">  PANTHER    </option>            
																			<option  value="PARILLA"      data-gtm-label="PARILLA">  PARILLA    </option>            
																			<option  value="PAT      data-gtm-label="PAT  BIKES  PONTIFEX">  PAT  BIKES  PONTIFEX    </option>    
																			<option  value="PEDA"      data-gtm-label="PEDA">  PEDA    </option>            
																			<option  value="PERAVES"      data-gtm-label="PERAVES">  PERAVES    </option>            
																			<option  value="PEUGEOT"      data-gtm-label="PEUGEOT">  PEUGEOT    </option>            
																			<option  value="PGO"      data-gtm-label="PGO">  PGO    </option>            
																			<option  value="PIAGGIO"      data-gtm-label="PIAGGIO">  PIAGGIO    </option>            
																			<option  value="PINK  MOBILITY"    data-gtm-label="PINK  MOBILITY">  PINK  MOBILITY    </option>        
																			<option  value="POLARIS"      data-gtm-label="POLARIS">  POLARIS    </option>            
																			<option  value="PONY"      data-gtm-label="PONY">  PONY    </option>            
																			<option  value="PUCH"      data-gtm-label="PUCH">  PUCH    </option>            
																			<option  value="QUADRO"      data-gtm-label="QUADRO">  QUADRO    </option>            
																			<option  value="QUADRON"      data-gtm-label="QUADRON">  QUADRON    </option>            
																			<option  value="QUANTYA"      data-gtm-label="QUANTYA">  QUANTYA    </option>            
																			<option  value="QVR"      data-gtm-label="QVR">  QVR    </option>            
																			<option  value="R  RAYMON"    data-gtm-label="R  RAYMON">  R  RAYMON    </option>        
																			<option  value="RAY"      data-gtm-label="RAY">  RAY    </option>            
																			<option  value="REGAL-RAPTOR"      data-gtm-label="REGAL-RAPTOR">  REGAL-RAPTOR    </option>            
																			<option  value="REWACO"      data-gtm-label="REWACO">  REWACO    </option>            
																			<option  value="RGNT"      data-gtm-label="RGNT">  RGNT    </option>            
																			<option  value="RHON"      data-gtm-label="RHON">  RHON    </option>            
																			<option  value="RICKMAN"      data-gtm-label="RICKMAN">  RICKMAN    </option>            
																			<option  value="RIEJU"      data-gtm-label="RIEJU">  RIEJU    </option>            
																			<option  value="RIXE"      data-gtm-label="RIXE">  RIXE    </option>            
																			<option  value="RIYA"      data-gtm-label="RIYA">  RIYA    </option>            
																			<option  value="ROMET"      data-gtm-label="ROMET">  ROMET    </option>            
																			<option  value="ROYAL  ENFIELD"    data-gtm-label="ROYAL  ENFIELD">  ROYAL  ENFIELD    </option>        
																			<option  value="RUEEGG"      data-gtm-label="RUEEGG">  RUEEGG    </option>            
																			<option  value="RUFF  CYCLES"    data-gtm-label="RUFF  CYCLES">  RUFF  CYCLES    </option>        
																			<option  value="RUMI"      data-gtm-label="RUMI">  RUMI    </option>            
																			<option  value="SACHS"      data-gtm-label="SACHS">  SACHS    </option>            
																			<option  value="SAKURA"      data-gtm-label="SAKURA">  SAKURA    </option>            
																			<option  value="SANGLAS"      data-gtm-label="SANGLAS">  SANGLAS    </option>            
																			<option  value="SANILI"      data-gtm-label="SANILI">  SANILI    </option>            
																			<option  value="SANYOU"      data-gtm-label="SANYOU">  SANYOU    </option>            
																			<option  value="SARIS"      data-gtm-label="SARIS">  SARIS    </option>            
																			<option  value="SAROLEA"      data-gtm-label="SAROLEA">  SAROLEA    </option>            
																			<option  value="SAXON"      data-gtm-label="SAXON">  SAXON    </option>            
																			<option  value="S-BIKE"      data-gtm-label="S-BIKE">  S-BIKE    </option>            
																			<option  value="SCOTT"      data-gtm-label="SCOTT">  SCOTT    </option>            
																			<option  value="SECMA"      data-gtm-label="SECMA">  SECMA    </option>            
																			<option  value="SEEYES"      data-gtm-label="SEEYES">  SEEYES    </option>            
																			<option  value="SEGWAY"      data-gtm-label="SEGWAY">  SEGWAY   </option>                
																			<option  value="SENN"      data-gtm-label="SENN">  SENN    </option>            
																			<option  value="SERVETTA"      data-gtm-label="SERVETTA">  SERVETTA    </option>            
																			<option  value="SEV"      data-gtm-label="SEV">  SEV    </option>            
																			<option  value="SHANSU"      data-gtm-label="SHANSU">  SHANSU    </option>            
																			<option  value="SHERCO"      data-gtm-label="SHERCO">  SHERCO    </option>            
																			<option  value="SHINERAY"      data-gtm-label="SHINERAY">  SHINERAY    </option>            
																			<option  value="SIDE-BIKE"      data-gtm-label="SIDE-BIKE">  SIDE-BIKE    </option>            
																			<option  value="SILENCE"      data-gtm-label="SILENCE">  SILENCE    </option>            
																			<option  value="SIMPLE"      data-gtm-label="SIMPLE">  SIMPLE    </option>            
																			<option  value="SIMSON"      data-gtm-label="SIMSON">  SIMSON    </option>            
																			<option  value="SKIDOO"      data-gtm-label="SKIDOO">  SKIDOO    </option>            
																			<option  value="SKYTEAM"      data-gtm-label="SKYTEAM">  SKYTEAM    </option>            
																			<option  value="S-LEM"      data-gtm-label="S-LEM">  S-LEM    </option>            
																			<option  value="SLINGSHOT"      data-gtm-label="SLINGSHOT">  SLINGSHOT    </option>            
																			<option  value="SMC(SM)"      data-gtm-label="SMC  (SM)">  SMC  (SM)    </option>        
																			<option  value="SNE"      data-gtm-label="SNE">  SNE    </option>            
																			<option  value="SOLEX"      data-gtm-label="SOLEX">  SOLEX    </option>            
																			<option  value="SPEED-UP"      data-gtm-label="SPEED-UP">  SPEED-UP    </option>            
																			<option  value="SPY RACING"      data-gtm-label="SPY  RACING">  SPY  RACING    </option>        
																			<option  value="STELS"      data-gtm-label="STELS">  STELS    </option>            
																			<option  value="STEVENS"      data-gtm-label="STEVENS">  STEVENS    </option>            
																			<option  value="STROMER"      data-gtm-label="STROMER">  STROMER    </option>            
																			<option  value="SUNBEAM"      data-gtm-label="SUNBEAM">  SUNBEAM    </option>            
																			<option  value="SUNRA"      data-gtm-label="SUNRA">  SUNRA    </option>            
																			<option  value="SUPER SOCO"      data-gtm-label="SUPER  SOCO">  SUPER  SOCO    </option>        
																			<option  value="SUR-RON"      data-gtm-label="SUR-RON">  SUR-RON    </option>            
																			<option  value="SUTER"      data-gtm-label="SUTER">  SUTER    </option>            
																			<option  value="SUZUKI"      data-gtm-label="SUZUKI">  SUZUKI    </option>            
																			<option  value="SWISSPERFORMANCE"      data-gtm-label="SWISSPERFORMANCE">  SWISSPERFORMANCE    </option>            
																			<option  value="SWM"      data-gtm-label="SWM">  SWM    </option>            
																			<option  value="SYM"      data-gtm-label="SYM">  SYM    </option>            
																			<option  value="TAILG"      data-gtm-label="TAILG">  TAILG    </option>            
																			<option  value="TARO"      data-gtm-label="TARO">  TARO    </option>            
																			<option  value="TATA"      data-gtm-label="TATA">  TATA    </option>            
																			<option  value="TAURIS"      data-gtm-label="TAURIS">  TAURIS    </option>            
																			<option  value="TELL"      data-gtm-label="TELL">  TELL    </option>            
																			<option  value="TERROT"      data-gtm-label="TERROT">  TERROT    </option>            
																			<option  value="TGB"      data-gtm-label="TGB">  TGB    </option>            
																			<option  value="THE      data-gtm-label="THE  BLACK  DOUGLAS">  THE  BLACK  DOUGLAS    </option>    
																			<option  value="TINBOT"      data-gtm-label="TINBOT">  TINBOT    </option>            
																			<option  value="TM"      data-gtm-label="TM">  TM    </option>            
																			<option  value="TOL"      data-gtm-label="TOL">  TOL    </option>            
																			<option  value="TOMOS"      data-gtm-label="TOMOS">  TOMOS    </option>            
																			<option  value="TORNAX"      data-gtm-label="TORNAX">  TORNAX    </option>            
																			<option  value="TOUR      data-gtm-label="TOUR  DE  SUISSE">  TOUR  DE  SUISSE    </option>    
																			<option  value="TPGS      data-gtm-label="TPGS  601  SPORT">  TPGS  601  SPORT    </option>    
																			<option  value="TREK"      data-gtm-label="TREK">  TREK    </option>            
																			<option  value="TRIKETEC"      data-gtm-label="TRIKETEC">  TRIKETEC    </option>            
																			<option  value="TRINITY"      data-gtm-label="TRINITY">  TRINITY    </option>            
																			<option  value="TRITON"      data-gtm-label="TRITON">  TRITON    </option>            
																			<option  value="TRIUMPH"      data-gtm-label="TRIUMPH">  TRIUMPH    </option>            
																			<option  value="TRMOTOR"      data-gtm-label="TRMOTOR">  TRMOTOR    </option>            
																			<option  value="TROIKA-BMW"      data-gtm-label="TROIKA-BMW">  TROIKA-BMW    </option>            
																			<option  value="TROXUS"      data-gtm-label="TROXUS">  TROXUS    </option>            
																			<option  value="TRS"      data-gtm-label="TRS">  TRS    </option>            
																			<option  value="TUK  TUK"    data-gtm-label="TUK  TUK">  TUK  TUK    </option>        
																			<option  value="TWIKE"      data-gtm-label="TWIKE">  TWIKE    </option>            
																			<option  value="TWN"      data-gtm-label="TWN">  TWN    </option>            
																			<option  value="UBCO"      data-gtm-label="UBCO">  UBCO    </option>            
																			<option  value="UM"      data-gtm-label="UM">  UM    </option>            
																			<option  value="UNIVERSAL"      data-gtm-label="UNIVERSAL">  UNIVERSAL    </option>            
																			<option  value="URAL"      data-gtm-label="URAL">  URAL    </option>            
																			<option  value="VALENTI"      data-gtm-label="VALENTI">  VALENTI    </option>            
																			<option  value="VALENTI  RACING"    data-gtm-label="VALENTI  RACING">  VALENTI  RACING    </option>        
																			<option  value="VANDERHALL"      data-gtm-label="VANDERHALL">  VANDERHALL    </option>            
																			<option  value="VAP"      data-gtm-label="VAP">  VAP    </option>            
																			<option  value="VECTRIX"      data-gtm-label="VECTRIX">  VECTRIX    </option>            
																			<option  value="VELOCETTE"      data-gtm-label="VELOCETTE">  VELOCETTE    </option>            
																			<option  value="VENGO"      data-gtm-label="VENGO">  VENGO    </option>            
																			<option  value="VENT"      data-gtm-label="VENT">  VENT    </option>            
																			<option  value="VERTEMATI"      data-gtm-label="VERTEMATI">  VERTEMATI    </option>            
																			<option  value="VERTIGO"      data-gtm-label="VERTIGO">  VERTIGO    </option>            
																			<option  value="VESPINO"      data-gtm-label="VESPINO">  VESPINO    </option>            
																			<option  value="VICTORIA"      data-gtm-label="VICTORIA">  VICTORIA    </option>            
																			<option  value="VICTORY"      data-gtm-label="VICTORY">  VICTORY    </option>            
																			<option  value="VINCENT"      data-gtm-label="VINCENT">  VINCENT    </option>            
																			<option  value="VITAL"      data-gtm-label="VITAL">  VITAL    </option>            
																			<option  value=""VITTORIA  125  LUXE"      data-gtm-label="VITTORIA  125  LUXE">  VITTORIA  125  LUXE    </option>    
																			<option  value="VOR"      data-gtm-label="VOR">  VOR    </option>            
																			<option  value="VOXAN"      data-gtm-label="VOXAN">  VOXAN    </option>            
																			<option  value="VR"      data-gtm-label="VR">  VR    </option>            
																			<option  value="VRO-KTM"      data-gtm-label="VRO-KTM">  VRO-KTM    </option>            
																			<option  value="WALZ"      data-gtm-label="WALZ">  WALZ    </option>            
																			<option  value="WALZWERK"      data-gtm-label="WALZWERK">  WALZWERK    </option>            
																			<option  value="WESLAKE"      data-gtm-label="WESLAKE">  WESLAKE    </option>            
																			<option  value="WHEELER"      data-gtm-label="WHEELER">  WHEELER    </option>            
																			<option  value="WINKING"      data-gtm-label="WINKING">  WINKING    </option>            
																			<option  value="WM  MEYER"    data-gtm-label="WM  MEYER">  WM  MEYER    </option>        
																			<option  value="WOLF  TRIKES"    data-gtm-label="WOLF  TRIKES">  WOLF  TRIKES    </option>        
																			<option  value="WOTTAN"      data-gtm-label="WOTTAN">  WOTTAN    </option>            
																			<option  value="XINGYANG"      data-gtm-label="XINGYANG">  XINGYANG    </option>            
																			<option  value="XINGYUE"      data-gtm-label="XINGYUE">  XINGYUE    </option>            
																			<option  value="YADEA"      data-gtm-label="YADEA">  YADEA    </option>            
																			<option  value="YAMAHA"      data-gtm-label="YAMAHA">  YAMAHA    </option>            
																			<option  value="YIBEN"      data-gtm-label="YIBEN">  YIBEN    </option>            
																			<option  value="ZABEL"      data-gtm-label="ZABEL">  ZABEL    </option>            
																			<option  value="ZAETA"      data-gtm-label="ZAETA">  ZAETA    </option>            
																			<option  value="ZEHNDER"      data-gtm-label="ZEHNDER">  ZEHNDER    </option>            
																			<option  value="ZERO"      data-gtm-label="ZERO">  ZERO    </option>            
																			<option  value="ZERO  ENGINEERING"    data-gtm-label="ZERO  ENGINEERING">  ZERO  ENGINEERING    </option>        
																			<option  value="ZNEN"      data-gtm-label="ZNEN">  ZNEN    </option>            
																			<option  value="ZONGSHEN"      data-gtm-label="ZONGSHEN">  ZONGSHEN    </option>            
																			<option  value="ZONTES"      data-gtm-label="ZONTES">  ZONTES    </option>            
																			<option  value="ZPMOTO"      data-gtm-label="ZPMOTO">  ZPMOTO    </option>            
																			<option  value="Z-SUZUKI"      data-gtm-label="Z-SUZUKI">  Z-SUZUKI    </option>            
                          
																		<input style="color:#0072B5;  margin:0px 0 0 0px; font-size:14px;width:300px; border:1px solid #cccccc;height:40px;font-weight:600;" type="text" name="format" value=""/>																																	
																	</select>
																	
																</div>
															</td>  
													</tr>
													<tr><td height="5px"></td></tr>	
													<tr>
														
															<td>modello moto&nbsp;:&nbsp;</td>
															<td><input type ="text"></td>
														
													</tr>
													<tr><td height="5px"></td></tr>	
													<tr> 
														<td>anno moto&nbsp;:&nbsp; </td>
														<td><input type="number" style="color:#0072B5;  margin:0px 0 0 0px; font-size:14px; border:1px solid #cccccc;height:40px;font-weight:600;" name="age" step="1" placeholder = "anno moto"></td>
													</tr>
													<tr><td height="5px"></td></tr>	
													<tr>
														<td> misura maglia&nbsp;:&nbsp; </td>
														<td>
															<select>
																<option>S</option>
																<option>M</option>
																<option>L</option>
																<option>XL</option>
																<option>XXL</option>
															</select>
														</td>
													</tr>
													<tr><td height="5px"></td></tr>	
													<!---tr>
														<td>tipo account</td>
														<td>
															<select id="accountType">
																<option>Socio Ordinario – AICS 2022</option>
																<option>Socio Sostenitore – AICS 2022</option>
																<option>Socio Ordinario – AICS 2022 + tessera FMI Member</option>
																<option> Socio Sostenitore -AICS 2022 +  tessera FMI Member</option>
															</select>
														</td>
													</tr--->
													<tr>
														<td> note particolari&nbsp;:&nbsp;</td>
														<td><textarea width="180px" height="100px"></textarea></td>
													</tr>
													<tr><td height="5px"></td></tr>	
													<tr><td height="5px"></td></tr>	
													<tr>
														<td colspan=2><center><input type="submit" value="INSERISCI I DATI (obbligatori)"></center></td>
													</tr>
													</table>
												</form>										
											</center>
										</div>
										<!-- --------------POPUP-------------- -->
										<!-- --------------POPUP-------------- -->
										
								<%end if%>	

								
								<!--#include file="benvenuto.inc"-->
									<button class="bott_carrellovisua" onClick="top.location.href='listino.asp'">PRODOTTI PREFERITI</button>
							         <br><br>
									<button class="bott_carrellovisua" onClick="top.location.href='registratiupdate.asp'">DATI PERSONALI</button>
								     <br><br>
								</div>
								<br>
								


						
						
						
						
						
						
				

 
						
				
            </div>
        </div>
    </div>
    
<!--#include file="foot.inc"-->
  </body>
</html>
<!--#include file="sqlchiudi.inc"-->