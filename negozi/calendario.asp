<%
	Function cheBello(byval testo)
		arparole=split(testo)
		txt=""
		for f=0 to ubound(arparole)
			txt=txt & Ucase(Left(arparole(f),1)) & lcase(mid(arparole(f),2)) & " "
		next
		cheBello=trim(txt)
	end function

	'------------------------------------------------------------
	' ESTRAPOLA IL NUMERO DI GIORNI
	'------------------------------------------------------------
	Function GetLastDay(intMonthNum, intYearNum)
		Dim dNextStart
		
            if   intMonthNum=12 then
              dNextStart = CDate("01/01/" & intYearNum+1)
            else
              dNextStart = CDate("01/"  & intMonthNum + 1  & "/" & intYearNum)
            end if  
		GetLastDay = Day(dNextStart - 1)
            
	End Function
	
	'-------------------------------------------------------------------------
	' DIVISIONE PER MESI GRAFICA
	'-------------------------------------------------------------------------
	Sub Write_TD(sValue, sClass)
		Response.Write "		<TD ALIGN=CENTER WIDTH=20 HEIGHT=20  VALIGN=MIDDLE CLASS='" & sClass & "'><FONT SIZE=2>" & sValue & "</FONT></TD>" & vbCrLf
	End Sub


	' COSTANTI GIORNI
	Const cSUN = 1, cMON = 2, cTUE = 3, cWED = 4, cTHU = 5, cFRI = 6, cSAT = 7
			
	'VERIFICA MESE
	If IsEmpty(Request("MONTH")) OR NOT IsNumeric(Request("MONTH")) Then
	  datToday = Date()
	  intThisMonth = Month(datToday)
	ElseIf CInt(Request("MONTH")) < 1 OR CInt(Request("MONTH")) > 12 Then
	  datToday = Date()
	  intThisMonth = Month(datToday)
	Else
	  intThisMonth = CInt(Request("MONTH"))
	End If
	
	' VERIFICA ANNO
	If IsEmpty(Request("YEAR")) OR NOT IsNumeric(Request("YEAR")) Then
	  datToday = Date()
	  intThisYear = Year(datToday)
	Else
	  intThisYear = CInt(Request("YEAR"))
	End If
	
	
	strMonthName = MonthName(intThisMonth)
	datFirstDay = DateSerial(intThisYear, intThisMonth, 1)
	intFirstWeekDay = WeekDay(datFirstDay, vbSunday)
	intLastDay = GetLastDay(intThisMonth, intThisYear)
	
	' VERIFICA ANNO E MESE
	intPrevMonth = intThisMonth - 1
	If intPrevMonth = 0 Then
		intPrevMonth = 12
		intPrevYear = intThisYear - 1
	Else
		intPrevYear = intThisYear	
	End If
	
	' PRENDI IL MESE E ANNO
	intNextMonth = intThisMonth + 1
	If intNextMonth > 12 Then
		intNextMonth = 1
		intNextYear = intThisYear + 1
	Else
		intNextYear = intThisYear
	End If

	' PRENDE FUNZIONE PER CALCOLARE INIZIO E FINE GIORNI IN UN MESE
	LastMonthDate = GetLastDay(intLastMonth, intPrevYear) - intFirstWeekDay + 2
	NextMonthDate = 1

	' STAMPA 1 GIORNO
	intPrintDay = 1

	' APRE DATABASE
	'Set Rs = Server.CreateObject("ADODB.RecordSet")
	
	' DATA PER SQL AMERICANA
	dFirstDay = intThisMonth & "/1/" & intThisYear
	dLastDay 	= intThisMonth & "/" & intLastDay & "/" & intThisYear

	
%>

<html>
<head>
<meta HTTP-EQUIV="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Calendario <% = CheBello(strMonthName) & " " & intThisYear & "                                      "%></title>
<style TYPE="text/css">
  TD.NON {font-family :Tahoma, Verdana, Arial; font-size :12px; color :#C0C0C0; font-weight :normal;}
  TD.TOP {font-family :Tahoma, Verdana, Arial; font-size :12px; color :#0000FF; font-weight :bold;}
  TD.Some {font-family :Tahoma, Verdana, Arial; font-size :12px; color :#000000; font-weight :normal;}

  A.NOEVENT:Link {font-family :Tahoma, Verdana, Arial; font-size :12px; color :#000000; font-weight :normal; text-decoration: none;}
  A.NOEVENT:Visited {font-family :Tahoma, Verdana, Arial; font-size :12px; color :#000000; font-weight :normal; text-decoration: none;}

  A.EVENT:Link {font-family :Tahoma, Verdana, Arial; font-size :12px; color :#000000; font-weight :bold; text-decoration: none;}
  A.EVENT:Visited {font-family :Tahoma, Verdana, Arial; font-size :12px; color :#000000; font-weight :bold; text-decoration: none;}

  A.NORMAL:Link {font-family :Verdana, Arial; font-size :12px; color :#0000FF; font-weight :normal; text-decoration: none;}
  A.NORMAL:Visited {font-family :Verdana, Arial; font-size :12px; color :#0000FF; font-weight :normal; text-decoration: none;}
</style>
<link rel="stylesheet" href="_styles.inc">
</head>
<body BGCOLOR="#eeb735"  WIDTH=300 HEIGHT=300 TEXT="#0000FF" LEFTMARGIN="3" LINK="#000000" vlink=White>
<br>
<center>
<table ALIGN="CENTER" BORDER="1" CELLSPACING="0" CELLPADDING="2" BGCOLOR="White" BORDERCOLOR="Gray" VLINK="#ffffff">
<tr><td>
	<table WIDTH="200" BORDER="0" CELLPADDING="1" CELLSPACING="0" >
	  <tr HEIGHT="18" bgcolor=Silver>
			<td WIDTH="20" HEIGHT="18" ALIGN="LEFT" VALIGN="MIDDLE"><a HREF="<% =sScript%>?month=<% =IntPrevMonth %>&amp;year=<% =IntPrevYear %>&id=<%=request("ID")%>"><img SRC="images/prev.gif" WIDTH="10" HEIGHT="18" BORDER="0" ALT="Previous Month"></a></td>
			<td COLSPAN="5" HEIGHT="40" ALIGN="CENTER" VALIGN="MIDDLE" CLASS="SOME"><FONT SIZE=2 color=black><B><% = trim(UCASE(strMonthName)) & " " & trim(UCASE(intThisYear)) %></B></FONT></td>
			<td WIDTH="20" HEIGHT="18" ALIGN="RIGHT" VALIGN="MIDDLE"><a HREF="<% =sScript %>?month=<% =IntNextMonth %>&amp;year=<% =IntNextYear %>&id=<%=request("ID")%>"><img SRC="images/next.gif" WIDTH="10" HEIGHT="18" BORDER="0" ALT="Next Month"></a></td>
	  </tr>
	  <tr>
			<td ALIGN="CENTER" CLASS="SOME" WIDTH="20" HEIGHT="20" VALIGN=MIDDLE ><FONT SIZE=2><B>D</B></FONT></td>
			<td ALIGN="CENTER" CLASS="SOME" WIDTH="20" HEIGHT="20" VALIGN=MIDDLE ><FONT SIZE=2><B>L</B></FONT></td>
			<td ALIGN="CENTER" CLASS="SOME" WIDTH="20" HEIGHT="20" VALIGN=MIDDLE ><FONT SIZE=2><B>M</B></FONT></td>
			<td ALIGN="CENTER" CLASS="SOME" WIDTH="20" HEIGHT="20" VALIGN=MIDDLE ><FONT SIZE=2><B>M</B></FONT></td>
			<td ALIGN="CENTER" CLASS="SOME" WIDTH="20" HEIGHT="20" VALIGN=MIDDLE ><FONT SIZE=2><B>G</B></FONT></td>
			<td ALIGN="CENTER" CLASS="SOME" WIDTH="20" HEIGHT="20" VALIGN=MIDDLE ><FONT SIZE=2><B>V</B></FONT></td>
			<td ALIGN="CENTER" CLASS="SOME" WIDTH="20" HEIGHT="20" VALIGN=MIDDLE ><FONT SIZE=2><B>S</B></FONT></td>
	  </tr>
	  <tr>  <td HEIGHT="1" ALIGN="MIDDLE" COLSPAN="7"><img SRC="images/line.gif" HEIGHT="1" WIDTH="140" BORDER="0"></td></tr>
	  <%
			' Initialize the end of rows flag to false
			EndRows = False
			Response.Write vbCrLf
			
			' Loop until all the rows are exhausted
		 	Do While EndRows = False
				' Start a table row
				Response.Write "	<TR>" & vbCrLf
				' This is the loop for the days in the week
				For intLoopDay = cSUN To cSAT
					' If the first day is not sunday then print the last days of previous month in grayed font
					If intFirstWeekDay > cSUN Then
						Write_TD LastMonthDate, "NON"
						LastMonthDate = LastMonthDate + 1
						intFirstWeekDay = intFirstWeekDay - 1
					' The month starts on a sunday	
					Else
						' If the dates for the month are exhausted, start printing next month's dates
						' in grayed font
						If intPrintDay > intLastDay Then
							Write_TD NextMonthDate, "NON"
							NextMonthDate = NextMonthDate + 1
							EndRows = True 
						Else
							' If last day of the month, flag the end of the row
							If intPrintDay = intLastDay Then
								EndRows = True
							End If
							
							dToday = CDate(intPrintDay & "/" & intThisMonth & "/" & intThisYear)  
													
							' If the event flag is not raise for that day, print it in a plain font
							If bEvents = False Then
							    Var= "<a href=" & Chr(34) & "javascript:opener.document.form1." & request("ID") & ".value='" & Cdate(dToday) & "';window.close();" & chr(34) & "><FONT SIZE=2>" & intPrintDay & "</FONT></A>"
								Write_TD Var, "SOME"
							End If
						End If 
						
						' Increment the date. Done once in the loop.
						intPrintDay = intPrintDay + 1
					End If
				
				' Move to the next day in the week
				Next
				Response.Write "	</TR>" & vbCrLf
				
			Loop 
		
		%>
	</table>
	</td></tr>
</table>
<!---a href="javascript:opener.document.form1.<%=request("ID")%>.value='10/10/2001';window.close();">pippo</a---->
</body>
</html>
