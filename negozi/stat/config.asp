<%
	'Example : cDBStats = "../securefolder/stats.mdb"
	cDBStats = "stats.mdb"

	'sImageLocation constant defines the location of the image 
	'used by StatCounteX.
	const sImageLocation = "icostatcountex.gif"
	bRefThisServer = False
	bStripPathParameters	= True
	bStripPathProtocol		= True
	bStripRefParameters 	= True
	bStripRefProtocol		= True
	bStripRefFile			= False

	'Construct the connection string
	sConnStats = "Provider=Microsoft.Jet.OLEDB.4.0;" &_
     "Persist Security Info=False;" &_
     "Data Source=" & Server.MapPath(cDBStats)
    'Response.Write(Server.MapPath(cDBStats))    
	'Pre Create the connection and recordset objects
	set conn = Server.CreateObject("ADODB.Connection")
	set rs = Server.CreateObject("ADODB.Recordset")

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
	
	sub OpenDB(sConn)
		'Opens the given connection and initializes the recordset
		conn.open sConn
		set rs.ActiveConnection = conn
		rs.CursorType = adOpenStatic
	end sub
	
	sub CloseDB()
		'Closes and destroys the connection and recordset objects
		rs.close
		conn.close
		set rs = nothing
		set conn = nothing
	end sub
	
	sub w(sText)
		'A Quickie ;)
		response.write sText & vbCrLf
	end sub


%>
