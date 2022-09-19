<%if Session("nomeutente")="preventivo" then%>
    <%if request("prezzobuffetti")="" then%>
      <center>
      <form method="post">
        <table>
        <tr><td colspan="2"><strong>Benvenuto nel Portale</strong></td></tr>
        <tr>
          <td>Prezzo Buffetti</td>
          <td>
            <select name="Prezzobuffetti">
              <option>PREZZO1</option>
              <option>PREZZO2</option>
              <option>PREZZO3</option>
              <option>PREZZO4</option>
              <option>PREZZO5</option>
            </select>
          </td>
        </tr>
        <tr>
          <td>Prezzo cwr</td>
          <td>
            <select name="Prezzocwr">
              <option>PREZZO1</option>
              <option>PREZZO2</option>
              <option>PREZZO3</option>
              <option>PREZZO4</option>
              <option>PREZZO5</option>
            </select>
          </td>
        </tr>
        <tr>
          <td>Prezzo isp</td>
          <td>
            <select name="Prezzoisp">
              <option>PREZZO1</option>
              <option>PREZZO2</option>
              <option>PREZZO3</option>
              <option>PREZZO4</option>
              <option>PREZZO5</option>
            </select>
          </td>
        </tr>
        <tr>
          <td>Prezzo Spicers</td>
          <td>
            <select name="PrezzoSpicers">
              <option>PREZZO1</option>
              <option>PREZZO2</option>
              <option>PREZZO3</option>
              <option>PREZZO4</option>
              <option>PREZZO5</option>
            </select>
          </td>
        </tr>
        <tr>
          <td>Spese Spedizione</td>
          <td>
            <select name="spesespedizione">
              <option value="1">SI</option>
              <option value="0">NO</option>
            </select>
          </td>
        </tr>
          <tr>
            <td></td>
            <td>
              <input type="submit" value=" i m p o s t a " />
            </td>
          </tr>
      </table>
      </form>
    </center>
    <%
    else
			Session("Prezzobuffetti")=request("Prezzobuffetti")
			Session("Prezzocwr")=request("Prezzocwr")
			Session("Priceisp")=request("Prezzoisp")
			Session("Prezzo")=request("PrezzoSpicers")
			Session("carrelloabilitato")= request("spesespedizione")
      %>
      <center>
		<table>
		<tr>
		<td><b>OK VALORI IMPOSTATI:<br>
		Prezzo buffetti=<%=request("Prezzobuffetti")%><br>
		Prezzo cwr=<%=request("Prezzocwr")%><br>
		Price isp=<%=request("Prezzoisp")%><br>
		Prezzo Spicers=<%=request("PrezzoSpicers")%><br>
		Spese spedizione=<%=request("spesespedizione")%>
		
		</td></tr>
		</table>
        
      </b>
      </center>
    <%end if%>
<%else%>
     
    <center><p><font class="tx4 azzurro grassetto">Benvenuto nel Portale!</font></p>
    
    <!--#include file="preventivocarica.inc" --></center>
    </form>
<%end if%>