<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,java.time.format.DateTimeFormatter,it.unisa.model.ProductBean,it.unisa.model.Cart, it.unisa.model.ItemOrder,it.unisa.model.PhotoBean,it.unisa.model.PhotoDAO"%>
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
    ProductBean product = (ProductBean) request.getAttribute("product");
    Cart cart = (Cart) request.getAttribute("cart");
    PhotoDAO photoDAO = new PhotoDAO();
    LinkedList<PhotoBean> photos = null;
    
    if (product != null) {
        photos = (LinkedList<PhotoBean>) photoDAO.getPhotos(product);
    }
    
    // Formattazione della data (per LocalDate)
    String formattedDate = "";
    if (product != null && product.getData_uscita() != null) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        formattedDate = product.getData_uscita().format(formatter);
    }
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
        if (product != null) {
    %>
    
    <div class="product-details-container">
        <div class="product-image">
                <img src="ImageServlet?id=<%=photos.get(0).getId()%>" alt="<%=product.getNome()%>" width="400"/>
        </div>
        
        <div class="product-info">
            <table>
                <thead class="details">
                    <tr>
                        <th>Nome</th>
                        <th>Prezzo</th>
                        <th>Saldo</th>
                        <th>Data di uscita</th>
                        <th>Voto</th>
                        <th>Descrizione</th>
                        <th>Peso</th>
                        <th>Quantit&agrave;</th>
                    </tr>
                </thead>
                
                <tbody class="details">
                    <tr>
                        <td><%=product.getNome()%></td>
                        <td><%=String.format("%.2f", product.getPrezzo())%> &euro;</td>
                        <td><%=product.getSaldo()%></td>
                        <td><%=formattedDate%></td>
                        <td><%=product.getVoto()%></td>
                        <td><%=product.getDescrizione()%></td>
                        <td><%=product.getPeso()%></td>
                        <td><%=product.getQuantità()%></td>
                    </tr>
                </tbody>
            </table>
            
            <br>
            
            <div class="wrapper">
                <form class="details" action="product?action=addC&id=<%=product.getId()%>" method="post" id="checkout">
                    <button class="btn" type="submit">Aggiungi al carrello</button>
                </form>
            </div>
        </div>
    </div>

<%
    }
%>
    
</body>
<%@ include file="./fragments/footer.html" %>
</html>