function GetXmlHttpcar(handler)
{
  var objXMLHttp=null
  if (window.XMLHttpRequest)
  {
      objXMLHttp=new XMLHttpRequest()
  }
  else if (window.ActiveXObject)
  {
      objXMLHttp=new ActiveXObject("Microsoft.XMLHTTP")
  }
  return objXMLHttp
}

function statecar()
{
  if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
  {
          // show_results_cartucce will be filled with new page
          document.getElementById("show_results_cartucce").innerHTML = xmlHttp.responseText;
		  document.getElementById("show_results_cartucce").scrollIntoView();
  }
}

function htmlData_cartucce(url, terms_cartucce, pag)
{
  if (url.length==0)
  {
      document.getElementById("show_results_cartucce").innerHTML = "";
      return;
  }

  xmlHttp = GetXmlHttpcar();

  if (xmlHttp==null)
  {
      alert ("Browser does not support HTTP Request");
      return;
  }

  url=url+"?"+terms_cartucce+"&amp;"+pag;
  url=url+"&sid="+Math.random();
  xmlHttp.onreadystatechange = statecar;
  xmlHttp.open("GET",url,true) ;
  xmlHttp.send(null);
}