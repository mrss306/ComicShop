<%@page import="it.unisa.model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
if (session == null || session.getAttribute("currentSessionUser") == null) {
%>
<%@ include file="./fragments/header.jsp"%>

<%
} else {
%>
<%@ include file="./fragments/headerlogged.jsp"%>
<%
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="./style/style.css" rel="stylesheet" type="text/css">
<title>Checkout</title>
</head>
<body>
	<%
	Cart cart = (Cart) session.getAttribute("cart");
	String itemID = request.getParameter("itemID");
	if (itemID != null) {
		String numItemsString = request.getParameter("numItems");
		if (numItemsString != null) {
			int numItems;
			try {
		numItems = Integer.parseInt(numItemsString);
			} catch (NumberFormatException nfe) {
		numItems = 1;
			}
			cart.setNumOrdered(Integer.parseInt(itemID), numItems);

		}

	}
	%>

	<%
	if (cart != null) {
		UserBean user= (UserBean) session.getAttribute("currentSessionUser");
	%>



	<h1>Riepilogo dell'ordine</h1>

<h3>Rivedi gli articoli</h3>
		<div class=details>
			<table >
				<thead class=details>
					<tr>
						<th>Articolo:</th>
						<th>Quantit&agrave;</th>
						<th>Prezzo:</th>
					</tr>
				</thead>

				<%
				List<ItemOrder> prodcart = cart.getProducts();
				float prezzo_finale = 0;
				for (ItemOrder beancart : prodcart) {
				%>

				<tbody class=details>
					<tr>
						<td><%=beancart.getNome()%></td>
						<td><%=beancart.getNumItems()%></td>
						<td><%=String.format("%.2f", beancart.getTotalCost())%>
							&euro;</td>
					</tr>
				</tbody>
				<%
				prezzo_finale += beancart.getTotalCost();
				%>

				<%
				}
				%>

				<tfoot class=cart>

					<tr>
						<th colspan=3>Totale: <%=String.format("%.2f", prezzo_finale)%> &euro;</th>
					</tr>
				</tfoot>
			</table>
		</div>
		
		<br>




	<div>
		
		
		<div class="user-container">
		
			<ul>
				<li>
					<div class="user-payment">
						<h3>Indirizzo di consegna: <%=user.getVia() + " " + user.getCitta() + " " + user.getProvincia() + " " + user.getPaese_residenza()%></h3>
					</div>
				</li>
			</ul>
	</div>
</div>


<br>


	<div>
		
		
		<div class="user-container">
			<ul>
				<li>
					<div class="user-payment">
						<h3>Carta di Credito Numero: <%=user.getCarta()%></h3>
					</div>
				</li>
			</ul>
	</div>
</div>
		<br>
	<form>
		<input type=hidden name=action value=CompletaOrdine>

		<div class=wrapper>

			<button class=btn type="submit" formaction="Ordine">Concludi ordine</button>
		</div>
	</form>
	
	
	<br>
	<br>
	
	<form>
		<input type="hidden" name="action" value="modifica">
		<div class=wrapper>
			<button class="btn" type="submit" formaction="Ordine">Modifica Dati</button>
		</div>
	</form>


	<%
	}
	%>

</body>
<%@ include file="./fragments/footer.html"%>
</html>