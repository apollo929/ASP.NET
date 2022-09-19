	search_id = '';
  function handleHttpcar() {
		if (http.readyState == 4) {
			if (search_id != '') {
				document.getElementById(search_id).innerHTML = http.responseText;
			}
		}
	}
  function getHTTPcar() {
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
	var http = getHTTPcar();

  function getCartucce(div_id,terms_cartucce_id,get_count,get_p) {
    search_id = div_id;
     zearch = document.getElementById(terms_cartucce_id).value;
    http.open("GET", "searchcartucce.php?terms_cartucce=" + escape(zearch)+"&count="+get_count+"&page="+get_p, true);
   http.onreadystatechange = handleHttpcar;
  http.send(null);
	}