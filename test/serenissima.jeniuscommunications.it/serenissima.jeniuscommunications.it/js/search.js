	search_id = '';
  function handleHttpResponse() {
		if (http.readyState == 4) {
			if (search_id != '') {
				document.getElementById(search_id).innerHTML = http.responseText;
			}
		}
	}
  function getHTTPObject() {
		var xmlhttp;
		if (!xmlhttp && typeof XMLHttpRequest != 'undefined') {
			try {
				xmlhttp = new XMLHttpRequest();
			} catch (e) {
				xmlhttp = false;
			}
		}
		return xmlhttp;
	}
	var http = getHTTPObject();

  function getScriptPage(div_id,terms_id,get_count,get_p) {
    search_id = div_id;
     zearch = document.getElementById(terms_id).value;
    http.open("GET", "search.php?terms=" + escape(zearch)+"&count="+get_count+"&page="+get_p, true);
   http.onreadystatechange = handleHttpResponse;
  http.send(null);
	}