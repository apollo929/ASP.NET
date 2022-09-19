<%
Function chkimg(byval immagine)
    Dim Img
    set Img = Server.CreateObject ("ImgSize.Check")
    chkimg=""
    Img.FileName = immagine
    if Img.Error <> "" then
      chkimg="c:\inetpub\wwwroot\alleluia\images\small\noimg.jpg"
    else
      chkimg=replace(immagine,"C:/inetpub/wwwroot/","../")
      if instr(Trim(Cstr(immagine)),"vuoto")>0 then
       chkimg="c:\inetpub\wwwroot\alleluia\images\small\noimg.jpg"
      end if
    end if
    set Img = nothing
End function
%>
