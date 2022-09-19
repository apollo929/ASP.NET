<%



dim myMail
Set myMail=CreateObject("CDO.Message")


myMail.Subject="mail"
myMail.From="ordini@idrauliche.it"
myMail.HTMLBody="body html"
myMail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=1
myMail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserverpickupdirectory") = "c:\inetpub\mailroot\pickup"
myMail.Configuration.Fields.Update
myMail.To="jeniuscommunications@gmail.com"
myMail.Send


myMail.Subject="mail"
myMail.From="ordini@du85.it"
myMail.HTMLBody="body html"
myMail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=1
myMail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserverpickupdirectory") = "c:\inetpub\mailroot\pickup"
myMail.Configuration.Fields.Update
myMail.To="info@webhousesas.net"
myMail.Send

myMail.Subject="mail"
myMail.From="info@jeniuscommunications.it"
myMail.HTMLBody="body html"
myMail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=1
myMail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserverpickupdirectory") = "c:\inetpub\mailroot\pickup"
myMail.Configuration.Fields.Update
myMail.To="jeniuscommunications@gmail.com"
myMail.Send

myMail.Subject="mail 2"
myMail.From="jeniuscommunications@gmail.com"
myMail.HTMLBody="body html 2"
myMail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=1
myMail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserverpickupdirectory") = "c:\inetpub\mailroot\pickup"
myMail.Configuration.Fields.Update
myMail.To="info@webhousesas.net"
myMail.Send





%>