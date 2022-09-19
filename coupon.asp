<!--#include file="connessionesql.inc"-->	
<!--#include file="parametriasp.inc"-->	
<!--#include file="parametriasplettura.inc" -->
<%if request("coupon_code")<>"" then
    'perfetto
    sqlfindcoupon="select * from carrellocoupon where coupon='" & request("coupon_code") & "' limit 1"
	set tbfindcoupon= server.CreateObject("ADODB.Recordset")
	tbfindcoupon.open sqlfindcoupon,connm
	if not tbfindcoupon.eof then 
		session("coupon")=cdbl(tbfindcoupon("sconto"))
	else
		session("coupon")=""
	end if
	tbfindcoupon.close	
end if
response.Redirect("carrellovisua.asp")%>
