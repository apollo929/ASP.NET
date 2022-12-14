<%@ CODEPAGE=65001 %> 
<% Response.CodePage=65001%> 
<% Response.Charset="UTF-8" %> 
<!-- #include file = "include_Security.asp" -->
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>		
		<link href="../Themes/<%=Theme%>/dialog.css" type="text/css" rel="stylesheet" />
		<!--[if IE]>
			<link href="../style/IE.css" type="text/css" rel="stylesheet" />
		<![endif]-->
		<script type="text/javascript" src="../Scripts/Dialog/DialogHead.js"></script>
		<style type="text/css">
	    #upload_image {height:80; VISIBILITY: inherit; Z-INDEX: 2}
		.row { HEIGHT: 22px }
		.cb { VERTICAL-ALIGN: middle }
		.itemimg { VERTICAL-ALIGN: middle }
		.editimg { VERTICAL-ALIGN: middle }
		.cell1 { VERTICAL-ALIGN: middle }
		.cell2 { VERTICAL-ALIGN: middle }
		.cell3 { PADDING-RIGHT: 4px; VERTICAL-ALIGN: middle; TEXT-ALIGN: right }
		.cb { }
		</style>		
	    <meta http-equiv="Page-Enter" content="blendTrans(Duration=0.1)" />
	    <meta http-equiv="Page-Exit" content="blendTrans(Duration=0.1)" />
	    <title><%= GetString("InsertFlash") %></title>
	    <%
		    Response.Expires = -1
    				
		    Dim Current_FlashGalleryPath
		    Current_FlashGalleryPath=FlashGalleryPath
		    if Request.QueryString("MP") <> "" then
			    Current_FlashGalleryPath = Request.QueryString("MP")
		    End if
	    %>	
	</head>
	<body>
		<div id="container">
			<table border="0" cellspacing="0" cellpadding="0" width="100%">
	            <tr>
		            <td style="white-space:nowrap; width:250px">
		            </td>
		            <td valign="bottom" style="width:200px">
<img src="../Images/newfolder.gif" id="btn_CreateDir" onclick="CreateDir_click();" title="<%= GetString("Createdirectory") %>" <% if CBool(AllowCreateFolder) then %> class="dialogButton" <% else %> class="CuteEditorButtonDisabled" <% end if%> onmouseover="CuteEditor_ColorPicker_ButtonOver(this);" /> 
<img src="../Images/zoom_in.gif" id="btn_zoom_in" onclick="Zoom_In();" title="<%= GetString("ZoomIn") %>" class="dialogButton" onmouseover="CuteEditor_ColorPicker_ButtonOver(this);" /> 
<img src="../Images/zoom_out.gif" id="btn_zoom_out" onclick="Zoom_Out();" title="<%= GetString("ZoomOut") %>" class="dialogButton" onmouseover="CuteEditor_ColorPicker_ButtonOver(this);" /> 
<img src="../Images/Actualsize.gif" id="btn_Actualsize" onclick="Actualsize();" title="<%= GetString("ActualSize") %>" class="dialogButton" onmouseover="CuteEditor_ColorPicker_ButtonOver(this);" /> 
		            </td>
		            <td align="right">
		            </td>	
	            </tr>
            </table>
			<table border="0" cellspacing="0" cellpadding="0" width="100%">
				<tr>
					<td valign="top" style="width:260px;">
						<iframe src="browse_flash.asp?<%=setting %>&MP=<%=Current_FlashGalleryPath%>&Theme=<%=Theme%>" id="browse_Frame" frameborder="0" scrolling="auto" style="border:1.5pt inset;width:260px;height:246px"></iframe>		
					</td>
					<td valign="top" style="width:290px">
						<div style="BORDER: 1.5pt inset; VERTICAL-ALIGN: top; OVERFLOW: auto; WIDTH: 290px; HEIGHT: 250px; BACKGROUND-COLOR: white; TEXT-ALIGN: center">
<div id="divpreview" style="BACKGROUND-COLOR: white">&nbsp;</div>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="height:2">
					</td>
				</tr>
			</table>
			<table border="0" cellspacing="0" cellpadding="0" width="100%">
				<tr>
					<td valign="top">
						<fieldset><legend><%= GetString("Properties") %></legend>
							<table border="0" cellpadding="4" cellspacing="0" id="Table3">
								<tr>
									<td>
										<table border="0" cellpadding="1" cellspacing="0" class="normal">
											<tr>
												<td style="width:110"><%= GetString("Width") %>:</td>
												<td style="width:120">
<input type="text" name="Width" id="Width" style="WIDTH : 80px" onchange="do_preview()"	onkeypress="return CancelEventIfNotDigit()" value="200" />
												</td>
											</tr>
											<tr>
												<td><%= GetString("Height") %>:</td>
												<td>
 <input type="text" name="Height" id="Height" style="WIDTH : 80px" onchange="do_preview()" onkeypress="return CancelEventIfNotDigit()" value="200" />
											    </td>
											</tr>
								            <tr>
									            <td><%= GetString("Backgroundcolor") %>:</td>
									            <td style="text-align:left">
<input type="text" id="bgColortext" name="bgColortext" size="7" style="WIDTH:57px;" />
<img title="" src="../Images/colorpicker.gif" id="bgColortext_Preview" style="vertical-align:top;" />
									            </td>
								            </tr>
											<tr>
												<td><%= GetString("Quality") %>:
												</td>
												<td>
<select name="Quality" id="Quality" style="WIDTH : 80px" onchange="do_preview()" onpropertychange="do_preview()" >
    <option selected="selected" value="high">High</option>
    <option value="medium">Medium</option>
    <option value="low">Low</option>
</select>
												</td>
											</tr>
											<tr>
												<td style="width:100"><%= GetString("Scale") %>:</td>
												<td>
<select name="Scale" style="WIDTH : 80px" id="Scale" onchange="do_preview()" onpropertychange="do_preview()">
    <option selected="selected" value=""><%= GetString("Default") %></option>
    <option value="Noborder"><%= GetString("Noborder") %></option>
    <option value="Exactfit"><%= GetString("Exactfit") %></option>
</select>
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</fieldset>
						<fieldset>
						<legend><%= GetString("Layout") %></legend>
							<table border="0" cellpadding="4" cellspacing="0" width="100%">
								<tr>
									<td>
										<table border="0" cellpadding="1" cellspacing="0" class="normal" width="100%">
											<tr>
												<td style="width:100"><%= GetString("Alignment") %>:</td>
												<td>
<select name="Align" style="WIDTH : 80px" id="Align" onchange="do_preview()" onpropertychange="do_preview()">
	<option id="optNotSet" selected="selected" value=""><%= GetString("NotSet") %></option>
	<option id="optLeft" value="left"><%= GetString("Left") %></option>
	<option id="optRight" value="right"><%= GetString("Right") %></option>
	<option id="optTexttop" value="textTop"><%= GetString("Texttop") %></option>
	<option id="optAbsMiddle" value="absMiddle"><%= GetString("Absmiddle") %></option>
	<option id="optBaseline" value="baseline"><%= GetString("Baseline") %></option>
	<option id="optAbsBottom" value="absBottom"><%= GetString("Absbottom") %></option>
	<option id="optBottom" value="bottom"><%= GetString("Bottom") %></option>
	<option id="optMiddle" value="middle"><%= GetString("Middle") %></option>
	<option id="optTop" value="top"><%= GetString("Top") %></option>
</select>
												</td>
											</tr>
											<tr>
												<td valign="middle" style="width:110px"><%= GetString("Horizontal") %>:</td>
												<td>
<input type="text" size="2" name="HSpace" onchange="do_preview()" onpropertychange="do_preview()" onkeypress="return CancelEventIfNotDigit()" style="WIDTH:80px" id="HSpace" />
												</td>
											</tr>
											<tr>
												<td valign="middle"><%= GetString("Vertical") %>:</td>
												<td>
<input type="text" size="2" name="VSpace" onchange="do_preview()" onpropertychange="do_preview()" onkeypress="return CancelEventIfNotDigit()" style="WIDTH:80px" id="VSpace" />
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</fieldset>
					</td>
					<td style="width:2">
					</td>
					<td valign="top">
						<fieldset style="margin-bottom:5px">
							<legend>
								<%= GetString("Insert") %></legend>
							<table border="0" cellpadding="4" cellspacing="0">
								<tr>
									<td>
										<table border="0" cellpadding="1" cellspacing="0" class="normal">
											<tr>
												<td valign="middle" style="width:100">
													<%= GetString("Url") %>:</td>
												<td>
<input type="text" id="TargetUrl" size="43" name="TargetUrl" /></td>
											</tr>
											<tr>
												<td colspan="2">
<input type="checkbox" checked="checked" id="chk_Loop" onchange="do_preview()" onpropertychange="do_preview()" />&nbsp;<%= GetString("Loop") %>&nbsp;&nbsp;
<input type="checkbox" checked="checked" id="chk_Autoplay" onchange="do_preview()" onpropertychange="do_preview()" />&nbsp;<%= GetString("Autoplay") %>&nbsp;&nbsp;
<input type="checkbox" checked="checked" id="chk_Transparency" onchange="do_preview()" onpropertychange="do_preview()" />&nbsp;<%= GetString("Transparency") %>&nbsp;
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</fieldset>
						<%
						    Dim Style_Display_None
							if Not CBool(AllowUpload) then
							    Style_Display_None="Style='Display:none'"
						    end if
						%>
						<fieldset id="fieldsetUpload" <%= Style_Display_None %> >
							<legend><%= GetString("Upload") %> (Max size <%=MaxFlashSize%>K)</legend>
							<table border="0" cellspacing="2" cellpadding="0" width="100%" class="normal">
								<tr>
									<td style="width:8">
									</td>
								</tr>
								<tr>
									<td valign="top">
<iframe src="upload.asp?<%=setting %>&FP=<%=Current_FlashGalleryPath%>&Type=Flash&Theme=<%=Theme%>" id="upload_image" frameborder="0" scrolling="auto" style="width:100%;height:65px"></iframe>
									</td>
								</tr>
							</table>
						</fieldset>
						<div style="padding-top:10px; text-align:center">
<input class="formbutton" type="button" value="   <%= GetString("Insert") %>   " onclick="do_insert()" id="Button1" /> 
&nbsp;&nbsp;&nbsp; 
<input class="formbutton" type="button" value="   <%= GetString("Cancel") %>  " onclick="do_Close()" id="Button2" />
						</div>
					</td>
				</tr>
			</table>
		</div>	
	    <script type="text/javascript" src="../Scripts/Dialog/DialogFoot.js"></script>
	    <script type="text/javascript" src="../Scripts/Dialog/Dialog_InsertFlash.js"></script>
	    <script type="text/javascript">	
	        var OK = "<%= GetString("OK")%>";
	        var Cancel = "<%= GetString("Cancel")%>";
	        var InputRequired = "<%= GetString("InputRequired")%>";
	        var ValidID = "<%= GetString("ValidID")%>";
	        var ValidColor = "<%= GetString("ValidColor")%>";
	        var SelectImagetoInsert = "<%= GetString("SelectImagetoInsert")%>";
	        
	        function UploadSaved(sFileName,path){
		        ResetFields();
		        TargetUrl.value = sFileName;
		        setTimeout(function(){do_preview(sFileName);}, 100); 
		        browse_Frame.location="browse_flash.asp?<%=setting %>&Theme=<%=Theme%>&MP="+path+"";	
		        row_click(sFileName);
	        }
        	
	        function Refresh(path)
	        {
		        browse_Frame.location="browse_flash.asp?<%=setting %>&Theme=<%=Theme%>&MP=<%=FlashGalleryPath%>&loc="+path+"";
	        }
	        function CreateDir_click()
	        {
	                if(isDemoMode)
                    {
                        alert("This function is disabled in the demo mode.");
	                    return;
	                } 
		        <%
			        if not CBool(AllowCreateFolder) then
		        %>
			        alert("<%= GetString("Disabled")%>");
			        return;
		        <%
			        End If
		        %>		    
	            if(Browser_IsIE7())
	            {
		            IEprompt(promptCallback,'<%= GetString("SpecifyNewFolderName")%>', "");		
		            function promptCallback(dir)
		            {
			            var tempPath = browse_Frame.location;	
			            tempPath = tempPath + "&action=createfolder&foldername="+dir;
			            browse_Frame.location = tempPath;		
		            }
	            }
	            else
	            {
		            var dir=prompt("<%= GetString("SpecifyNewFolderName")%>","")
		            if(dir)
		            {
			            var tempPath = browse_Frame.location;	
			            tempPath = tempPath + "&action=createfolder&foldername="+dir;
			            browse_Frame.location = tempPath;			
		            }
	            }
	        }
	        function row_click(path)
	        {	
		        ResetFields();
		        TargetUrl.value=path;
		        do_preview();
	        }	    
    		
	        function SetUpload_FolderPath(path)
	        {	if(path.substring(path.length-1, path.length)=='/')
		        {
			        path=path.substring(0, path.length-1);
		        }
		        upload_image.location="upload.asp?<%=setting %>&FP="+path+"&Theme=<%=Theme%>&Type=Flash";
	        }	
	        
	        var ResourceDir='<%=ResourceDir%>';
	    </script>	
	</body>	
</html>