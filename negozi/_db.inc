<%    
     cDBStats = "/negozi/db/scart.mdb"
     Sub Openconn
      stringdb= "Provider=Microsoft.Jet.OLEDB.4.0;" &_
      "Persist Security Info=False;" &_
      "Data Source=" & Server.MapPath(cDBStats)
      set dbc = Server.CreateObject("ADODB.Connection")
      dbc.open stringdb
     End Sub
     
     Sub CloseConn()
	  if isobject(dbc) then
		if dbc.State = adStateOpen then
			dbc.Close
		end if
		set dbc = nothing
	  end if
     End sub
     
     
     
     cDBStats1 = "/negozi/db/merchant.mdb"
     Sub Openconnmrc
      stringdb1= "Provider=Microsoft.Jet.OLEDB.4.0;" &_
      "Persist Security Info=False;" &_
      "Data Source=" & Server.MapPath(cDBStats1)
      set dbcmrc = Server.CreateObject("ADODB.Connection")
      dbcmrc.open stringdb1
     End Sub
     
     Sub closeConnmrc()
	  if isobject(dbcmrc) then
		if dbcmrc.State = adStateOpen then
			dbcmrc.Close
		end if
		set dbcmrc = nothing
	  end if
     End sub
     
     
     cDBStats2 = "/negozi/db/merchant.mdb"
     Sub Openconncar
      stringdb2= "Provider=Microsoft.Jet.OLEDB.4.0;" &_
      "Persist Security Info=False;" &_
      "Data Source=" & Server.MapPath(cDBStats2)
      set dbcmrc = Server.CreateObject("ADODB.Connection")
      dbccar.open stringdb2
     End Sub
     
     Sub closeConncar()
	  if isobject(dbccar) then
		if dbccar.State = adStateOpen then
			dbccar.Close
		end if
		set dbccar = nothing
	  end if
     End sub
     
     
%>
