<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">	
    <head>
		<link rel="stylesheet" href="asp.css"  type="text/css" />
		<title>Cute Editor for ASP AJAX example</title>
		<script language="JavaScript" type="text/javascript">
			//Gets the browser specific XmlHttpRequest Object
			function getXmlHttpRequestObject() {
				if (window.XMLHttpRequest) {
					return new XMLHttpRequest(); //Not IE
				} else if(window.ActiveXObject) {
					return new ActiveXObject("Microsoft.XMLHTTP"); //IE
				} else {
					//Display your error message here. 
					//and inform the user they might want to upgrade
					//their browser.
					alert("Your browser doesn't support the XmlHttpRequest object.  Better upgrade to Firefox.");
				}
			}			
			//Get our browser specific XmlHttpRequest object.
			var receiveReq = getXmlHttpRequestObject();		
			//Initiate the asyncronous request.
			function ShowEditor() {
				//If our XmlHttpRequest object is not in the middle of a request, start the new asyncronous call.
				if (receiveReq.readyState == 4 || receiveReq.readyState == 0) {
					//Setup the connection as a GET call to SayHello.html.
					//True explicity sets the request to asyncronous (default).
					receiveReq.open("GET", 'ShowEditor.asp', true);
					//Set the function that will be called when the XmlHttpRequest objects state changes.
					receiveReq.onreadystatechange = handleShowEditor; 
					//Make the actual request.
					receiveReq.send(null);
				}			
			}
			//Called every time our XmlHttpRequest objects state changes.
			function handleShowEditor() {
				//Check to see if the XmlHttpRequests state is finished.
				if (receiveReq.readyState == 4) {
					//Set the contents of our span element to the result of the asyncronous call.
					document.getElementById('span_result').innerHTML = receiveReq.responseText;
				}
			}
			</script>
		<%
		
		Dim Loader
		userAgent = Request.ServerVariables("HTTP_USER_AGENT")
		if InStr(1, userAgent, "MSIE", 1) > 0 AND InStr(1, userAgent, "Win", 1) > 0 AND InStr(1, userAgent, "Opera", 1) = 0 then
			if Trim(Mid(userAgent, inStr(1, userAgent, "MSIE", 1)+5, 3)) >= "5.5" OR Trim(Mid(userAgent, inStr(1, userAgent, "MSIE", 1)+5, 3)) = "5,5" then
				Loader = "IE_Loader"
			end if
		ElseIf inStr(1, userAgent, "Firebird", 1) then
			if CLng(Trim(Mid(userAgent, CInt(inStr(1, userAgent, "Gecko/", 1)+6), 8))) >= 20030728 then
					Loader = "Gecko_Loader"
			end if
		ElseIf inStr(1, userAgent, "Gecko", 1) > 0 AND inStr(1, userAgent, "Firebird", 1) = 0 AND isNumeric(Trim(Mid(userAgent, CInt(inStr(1, userAgent, "Gecko/", 1)+6), 8))) then
			if CLng(Trim(Mid(userAgent, CInt(inStr(1, userAgent, "Gecko/", 1)+6), 8))) => 20030312 then
				Loader = "Gecko_Loader"
			end if
		ElseIf inStr(1, userAgent, "Opera", 1) > 0 then
			dim OperaNumber
			OperaNumber = Mid(userAgent, inStr(1, userAgent, "Opera", 1)+6, 1)
			if IsNumeric (OperaNumber) then
				if CInt(OperaNumber) => 9  then
					Loader = "Opera_Loader"
				end if
			end if		    
		ElseIf inStr(1, userAgent, "Safari", 1) > 0  then
			if CInt(Trim(Mid(userAgent, CInt(inStr(1, userAgent, "AppleWebKit/", 1)+12), 3))) => 522 then
				Loader = "Safari_Loader"
			ElseIf CInt(Trim(Mid(userAgent, CInt(inStr(1, userAgent, "AppleWebKit/", 1)+12), 3))) => 312 then
				Loader = "Safari12_Loader"	
			end if
		end if
		If inStr(1, userAgent, "Chrome", 1) > 0 then
			Loader = "Gecko_Loader"
		end if
		
		%>
			<script language="JavaScript" src="cuteeditor_files/Scripts/<%=Loader%>/Loader.js"></script>
			<script language="JavaScript" src="cuteeditor_files/Scripts/Constant.js"></script>
			<script language="JavaScript">var CE_Editor1_IDSettingClass_Strings=""; </script>
			
	</head>
    <body>
					
		<h1>Ajax Rich Text Editor</h1>
					<p>This example shows you how to use Cute Editor in Ajax.</p>
		<!-- Clicking this link initiates the asyncronous request -->
		<h4><a href="javascript:ShowEditor();">Show Editor</a></h4><br />
		<!-- used to display the results of the asyncronous request -->
		<span id="span_result"></span>
		
	</body>
</html>