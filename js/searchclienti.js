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

  function getScriptPage(div_id,terms_id,get_count,get_p,cliente) {
		search_id = div_id;
		zearch = document.getElementById(terms_id).value;
		http.open("GET", "searchclienti.php?terms=" + escape(zearch)+"&cliente="+cliente+"&count="+get_count+"&page="+get_p, true);
		http.onreadystatechange = handleHttpResponse;
		http.send(null);
	}
	  function getScriptPage2(div_id,terms_id,get_count,get_p,cliente) {
		search_id = div_id;
		http.open("GET", "searchclienti.php?terms=a&cliente="+cliente+"&count="+get_count+"&page="+get_p, true);
		http.onreadystatechange = handleHttpResponse;
		http.send(null);
	}