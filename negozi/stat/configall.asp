<%
	'Example : cDBStats = "../securefolder/stats.mdb"
	'cDBStats = "stat/stats.mdb"

	'sImageLocation constant defines the location of the image 
	'used by StatCounteX.
	const sImageLocation = "icostatcountex.gif"
	bRefThisServer = False
	bStripPathParameters	= True
	bStripPathProtocol		= True
	bStripRefParameters 	= True
	bStripRefProtocol		= True
	bStripRefFile			= False



	'ADO Constants
	'---- CursorTypeEnum Values ----
	Const adOpenForwardOnly = 0
	Const adOpenKeyset = 1
	Const adOpenDynamic = 2
	Const adOpenStatic = 3

	'---- CursorLocationEnum Values ----
	Const adUseServer = 2
	Const adUseClient = 3

	'---- CommandTypeEnum Values ----
	Const adCmdUnknown = &H0008
	Const adCmdText = &H0001
	Const adCmdTable = &H0002
	Const adCmdStoredProc = &H0004
	Const adCmdFile = &H0100
	Const adCmdTableDirect = &H0200
	



%>
