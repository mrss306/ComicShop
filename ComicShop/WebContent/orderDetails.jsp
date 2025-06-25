<%@page import="it.unisa.model.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.Cart, it.unisa.model.ItemOrder"%>
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


<%
OrderBean order = (OrderBean) session.getAttribute("ordine");
LinkedList<ContentBean> products = (LinkedList<ContentBean>) session.getAttribute("products");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="./style/style.css" rel="stylesheet" type="text/css">
<title>Dettagli</title>

</head>

<body>
	<h2>Dettagli</h2>
	<%
	if (order != null) {
	%>

	<div class=details>
		<table>
			<thead class=details>
				<tr>
					<th>Numero ordine</th>
					<th>Costo totale</th>
					<th>Indirizzo di spedizione</th>
					<th>Data ordine</th>
					<th>Data di spedizione</th>

				</tr>
			</thead>

			<tbody class=details>
				<tr>
					<td><%=order.getNum_ordine()%></td>
					<td><%=String.format("%.2f", order.getCosto_totale())%>
						&euro;</td>
					<td><%=order.getIndirizzo_spedizione()%></td>
					<td><%
 						      SimpleDateFormat originalFormat = new SimpleDateFormat("yyyy-MM-dd");
 						      SimpleDateFormat targetFormat = new SimpleDateFormat("dd/MM/yyyy");
  							  Date date = originalFormat.parse(order.getData_ordine().toString());
  							  out.print(targetFormat.format(date));
					%></td>
					<td><%
  							  Date date2 = originalFormat.parse(order.getData_spedizione().toString());
  							  out.print(targetFormat.format(date2));
					%></td>
				</tr>
			</tbody>
		</table>

		<br>


	</div>
	<table>
		<thead class=details>
			<tr>
				<th>Nome</th>
				<th>Prezzo</th>
				<th>Quantit&agrave; acquistata</th>
				<th>Iva</th>
			</tr>
		</thead>
		<tbody class=catalogo>
			<%
			if (products != null && products.size() != 0) {
				for (ContentBean bean : products) {
			%>
			<tr>
				<td><%=bean.getNome_art()%></td>
				<td><%=String.format("%.2f", bean.getPrezzo_acquisto())%>
					&euro;</td>
				<td><%=bean.getNum_art_acq()%></td>
				<td><%=bean.getIva()%>%</td>
			</tr>

			<%
			}
			} else {
			%>
			<tr>
				<td colspan="6">Nessun prodotto registrato</td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>




	<%
	}
	%>

</body>
<%@ include file="./fragments/footer.html"%>
</html>