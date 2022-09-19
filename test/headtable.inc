  <head>
 	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta charset="utf-8">
	<script src="sweetalert.min.js"></script>
	<script type="text/javascript" src="carrello.js"></script>	
    <title><%=Session("titolopagina")%></title>
	<link rel="icon" href="<%=Session("sitourl")%>/img/favicon.ico" type="image/x-icon">    
    
    <!-- Bootstrap -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="css/font-awesome.min.css">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="stile.css">
	<link rel="stylesheet" href="style.css">
	<link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="css/responsive.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
	<script language="JavaScript">
	function opensn(url) {
		popupWin = window.open(url, 'new_page', 'width=720,height=620,scrollbars=yes,resizable=yes');
	}
	function aggqta(qta){
	var x = document.getElementById(qta).value;
	document.getElementById(qta).value=parseInt(x) + 1;
	} 
	function dimqta(qta){
	var x = document.getElementById(qta).value;
	var y=Math.abs(parseInt(x) - 1);
	if (y==0) {
	    swal('0 acquisto non possibile'); 
	    y=1}
	document.getElementById(qta).value=y;
	} 
	function ZoomIn(nomeimg,fornitore)
	{
	var controlla = fornitore;
	if (controlla.indexOf("silko") != (-1)) {
	swal("", "", "foto.asp?cat=fileftp/immagini&img="+nomeimg);
	};
	}
	</script>
	<script src="jquery.min.js"></script>
	<script type="text/javascript" src="zoom/lib/blowup.min.js"></script>
	<script type="text/javascript" src="zoom/demo/scripts/index.js"></script>
	<!-- jQuery Popup Overlay -->
	<script src="jquery.popupoverlay.js"></script>
    <script src="sweetalert.min.js"></script>
	<link rel="stylesheet" href="css/yBox.min.css">
	<script src="yBox.min.js"></script>	
	<script language="javascript">
	function openpopup(divName) {
	// Initialize the plugin
	$('#basic').popup({
	autoopen: true, /* per non far aprire al caricamento impostare su false */
	// transition: 'all 0.3s',
	scrolllock: true
	});
	}
	$(document).ready(function () {
	$('#loading').popup({
	autoopen: true, /* per non far aprire al caricamento impostare su false */
	//transition: 'all 0.3s',
	scrolllock: true
	});
	});
	</script>
  </head>
  