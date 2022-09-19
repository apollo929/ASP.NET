<!--#include virtual="/connessionesql.inc"-->
<!--#include file = "CuteEditor_Files/include_CuteEditor.asp" --> 
<!DOCTYPE html>
<html lang="en">
    <head>
		<TITLE>JENIUS COMMUNICATIONS - MARCO GENOVESE</TITLE>
		<meta name="keywords" content="JENIUS">
		<meta name="description" content="JENIUS">
		<link rel="stylesheet" type="text/css" href="../admin/style.css">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Backoffice JENIUS</title>
        <<!-- Bootstrap Core CSS -->
        <link href="../admin/css/bootstrap.min.css" rel="stylesheet">
        <!-- MetisMenu CSS -->
        <link href="../admin/css/metisMenu.min.css" rel="stylesheet">
        <!-- Custom CSS -->
        <link href="../admin/css/startmin.css" rel="stylesheet">
        <!-- Custom Fonts -->
        <link href="../admin/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div id="wrapper">

            <!-- Navigation -->
				<!--#include virtual="/admin/topmenu.inc" -->
				<!--#include virtual="/admin/navbarback.inc" -->
				<!--#include virtual="/admin/top_menu_sotto.inc" -->
                <div class="row">
                    <div class="col-lg-12"> 
                            <!-- .panel-heading -->
                            <div class="panel-body">
                                <div class="panel-group" id="accordion">
                                    <div class="panel panel-default">
									
														
														
														
					        <form>
            <table>
                <tr>
                    <td><label> numero identificativo </label></td>
                    <td><span name = "ni"> ****** </span></td>
                </tr>
                <tr>
                    <td> numero identificativo (opzionale) </td>
                    <td> <span name ="nio"> ****** </span> </td>
                </tr>
                <tr>
                    <td> password </td>
                    <td>
                        <input style = "border: 1px black solid;" type="password" name="password" id="password">
                        <i class="bi bi-eye-slash" id="togglePassword"></i>
                    </td>
                    <script>
                        const togglePassword = document.querySelector("#togglePassword");
                        const password = document.querySelector("#password");
                
                        togglePassword.addEventListener("click", function () {
                            const type = password.getAttribute("type") === "password" ? "text" : "password";
                            password.setAttribute("type", type);
                            
                            this.classList.toggle("bi-eye");
                        });
                    </script>
                </tr>
                <tr>
                    <td colspan="2" style="text-align:center;"> data prenotazione evento </td>
                </tr>
                <tr>
                    <td> data inizio: <input type="date" name ="dataInizio"> </td>
                    <td> data fine: <input type="date" name = "dataFine"> </td>
                </tr>
                <tr>
                    <td>titolo</td>
                    <td> <input type = "text" name = "titolo" placeholder = "titolo"> </td>
                </tr>
                <tr>
                    <td> sottotitolo </td>
                    <td> <input type = "text" name = "sottotitolo" placeholder = "sottotitolo"> </td>
                </tr>
                <tr>
                    <td> descrizione evento </td>
                    <td> 		<%
			
			dim content
					
			content ="<STRONG><EM><U>Easy to Install, Easy to Use</U></EM></STRONG><BR>"
			
			Dim editor
			Set editor = New CuteEditor
					
			editor.ID = "Editor1"
			editor.Text = content
			editor.FilesPath = "CuteEditor_Files"
			editor.AutoConfigure = "Minimal"
			
			editor.Width = 600
			'editor.Height = 240
			editor.Draw()
		%></td>
                </tr>
                
                <tr>
                    <td> autore </td>
                    <td> <input type = "text" name = "autore" placeholder = "autore"> </td>
                </tr>
                <tr>
                    <td style = "text-align: center;" colspan = "2"> Solo file .png .jpg .gif</td>
                </tr>
                <tr>
                    <td> nome file 1</td>
                    <td><input type="file" accept="image/png, image/gif, image/jpeg" name = "file1"> </td>
                </tr>
                <tr>
                    <td> fome file 2</td>
                    <td><input type="file" accept="image/png, image/gif, image/jpeg" name = "file2"> </td>
                </tr>
                <tr>
                    <td> nome file 3</td>
                    <td><input type="file" accept="image/png, image/gif, image/jpeg" name = "file3"> </td>
                </tr>
                <tr>
                    <td> nome file 4</td>
                    <td><input type="file" accept="image/png, image/gif, image/jpeg" name = "file4"> </td>
                </tr>
                <!---
                    ni
                    nio
                    password
                    dataInizio
                    dataFine
                    titolo
                    sottotitolo
                    autore
                    file1
                    file2
                    file3
                    file4
                --->
            </table>
            
        </form>									
														
														
														
														
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
        <script src="../admin/js/jquery.min.js"></script>
        <!-- Bootstrap Core JavaScript -->
        <script src="../admin/js/bootstrap.min.js"></script>
        <!-- Metis Menu Plugin JavaScript -->
        <script src="../admin/js/metisMenu.min.js"></script>
        <!-- Custom Theme JavaScript -->
        <script src="../admin/js/startmin.js"></script>
    </body>
</html>
<!--#include virtual=/admin/closesql.inc-->