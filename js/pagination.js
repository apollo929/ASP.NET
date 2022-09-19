function GetXmlHttpObject(handler)
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

function stateChanged()
{
  if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
  {
          // show_results will be filled with new page
          document.getElementById("show_results").innerHTML = xmlHttp.responseText;
		  document.getElementById("show_results").scrollIntoView();
  }
}

function htmlData(url, terms, pag)
{
  if (url.length==0)
  {
      document.getElementById("show_results").innerHTML = "";
      return;
  }

  xmlHttp = GetXmlHttpObject();

  if (xmlHttp==null)
  {
      alert ("Browser does not support HTTP Request");
      return;
  }

  url=url+"?"+terms+"&amp;"+pag;
  url=url+"&sid="+Math.random();
  xmlHttp.onreadystatechange = stateChanged;
  xmlHttp.open("GET",url,true) ;
  xmlHttp.send(null);
}