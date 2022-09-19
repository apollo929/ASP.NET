<!--#include file=connessionesql.inc-->
<%
Session("Query")="select codice as title,descrizione as description,prezzoofferta as price from magazinebuffetti"
    sub Write_CSV_From_Recordset(RS)


        if RS.EOF then

            '
            ' There is no data to be written
            '
            exit sub

        end if

        dim RX
        set RX = new RegExp
            RX.Pattern = "\r|\n|,|"""

        dim i
        dim Field
        dim Separator

        '
        ' Writing the header row (header row contains field names)
        '

        Separator = ""
		Response.Write Separator & "id;" 
        for i = 0 to RS.Fields.Count - 1
            Field = RS.Fields(i).Name
            if RX.Test(Field) then
                '
                ' According to recommendations:
                ' - Fields that contain CR/LF, Comma or Double-quote should be enclosed in double-quotes
                ' - Double-quote itself must be escaped by preceeding with another double-quote
                '
                Field = """" & Replace(Field, """", """""") & """"
            end if
            Response.Write Separator & Field
            Separator = ";"
        next
		Response.Write Separator & "availability"
		Response.Write Separator & "condition"
		Response.Write Separator & "link"
		Response.Write Separator & "image_link"
		Response.Write Separator & "brand"
		Response.Write Separator & "google_product_category"
        Response.Write vbNewLine

        '
        ' Writing the data rows
        '
         cont_n=0
        do until RS.EOF
		    cont_n=cont_n+1
            Separator = ""
			Response.Write Separator & "face_b" & cont_n & ";"
            for i = 0 to RS.Fields.Count - 1
                '
                ' Note the concatenation with empty string below
                ' This assures that NULL values are converted to empty string
                '
                Field = RS.Fields(i).Value & ""
                if RX.Test(Field) then
                    Field = """" & Replace(Field, """", """""") & """"
                end if
				if i=2 then 
				  prezzo_txt=replace(cstr(formatnumber(cdbl(RS.Fields(2).Value),2)),",",".")
				  Response.Write Separator & prezzo_txt & " EUR"
				else  
                Response.Write Separator & lcase(Field)
				end if
                Separator = ";"
            next
			Response.Write Separator & "in stock"
			Response.Write Separator & "new"
			Response.Write Separator & Session("sitourl") & "/dettaglibuffettishop.asp?cod=" & RS.Fields(0).Value
			Response.Write Separator & Session("sitourl") & "/foto.asp?cat=catalogobuffetti2016_big&img=" & RS.Fields(0).Value & ".jpg"
			Response.Write Separator & "buffetti"
			Response.Write Separator & "forniture per ufficio"
            Response.Write vbNewLine			
            RS.MoveNext
        loop

    end sub

    Response.Buffer = True
    Response.ContentType = "text/csv"
    Response.AddHeader "Content-Disposition", "attachment; filename=Export.csv"
    theSQL = Session("Query")

    Set RS = conn.Execute(theSQL)
    Write_CSV_From_Recordset RS
%>
   <html>

    <head>
        <title>Excel/CSV Export</title>
    </head>

    <body>
         <H5>export file csv per FACEBOOK</H5>
    </body>

    </html> 
<!--#include file=closesql.inc-->