<%@page import="it.unisa.model.*"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
if (session == null || session.getAttribute("currentSessionUser") == null) {
%>
<%@ include file="../fragments/header.jsp"%>
<%
} else {
%>
<%@ include file="../fragments/headerlogged.jsp"%>
<%
}
%>
<!DOCTYPE html>
<html>
<head>
<link href="./style/style.css" rel="stylesheet" type="text/css">
<script src="./js/catalogo.js"></script>
<title>Catalogo</title>
</head>
<body>

<%
Collection<?> products = (Collection<?>) session.getAttribute("products");
%>

<!-- Update -->
<h2>Prodotti</h2>
<div class="table-container">
    <table class="catalogue-table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Prezzo</th>
                <th>Voto</th>
                <th>Quantit&agrave;</th>
                <th>Saldo</th>
                <th>Data di uscita</th>
                <th>Descrizione</th>
                <th>Peso</th>
                <th>Azioni</th>
            </tr>
        </thead>
        <tbody>
            <%
            if (products != null && !products.isEmpty()) {
                Iterator<?> it = products.iterator();
                while (it.hasNext()) {
                    ProductBean bean = (ProductBean) it.next();
            %>
            <tr>
                <td>
                    <input readonly class="catalogue-input" type="number" value="<%=bean.getId()%>">
                </td>
                <td>
                    <form method="GET" action="ProductUpdate">
                        <input type="hidden" name="id" value="<%=bean.getId()%>">
                        <input class="catalogue-input" name="nome" type="text" value="<%=bean.getNome()%>">
                </td>
                <td>
                        <input class="catalogue-input" name="prezzo" type="number" step="0.01" value="<%=bean.getPrezzo()%>">
                </td>
                <td>
                        <input class="catalogue-input" name="voto" type="number" step="0.1" value="<%=bean.getVoto()%>">
                </td>
                <td>
                        <input class="catalogue-input" name="quantita" type="number" value="<%=bean.getQuantità()%>">
                </td>
                <td>
                        <input class="catalogue-input" name="saldo" type="number" value="<%=bean.getSaldo()%>">
                </td>
                <td>
                        <input class="catalogue-input" name="data" type="date" value="<%=bean.getData_uscita()%>">
                </td>
                <td>
                        <input class="catalogue-input" name="descrizione" type="text" value="<%=bean.getDescrizione()%>">
                </td>
                <td>
                        <input class="catalogue-input" name="peso" type="number" step="0.1" value="<%=bean.getPeso()%>">
                </td>
                <td>
                        <input class="btn-det" type="submit" value="Update">
                    </form>
                    
                    <form action="ProductDelete" method="GET" style="display:inline;">
                        <input type="hidden" name="deletedid" value="<%=bean.getId()%>">
                        <button class="btn-det" type="submit">Elimina Prodotto</button>
                    </form>
                </td>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="10">Nessun prodotto disponibile</td>
            </tr>
            <%
            }
            %>
        </tbody>
    </table>
</div>

<!-- Insert -->
<h2>Inserisci nuovo articolo</h2>
<div class="table-container">
    <table class="catalogue-table">
        <thead>
            <tr>
                <th>Id</th>
                <th>Nome</th>
                <th>Prezzo</th>
                <th>Voto</th>
                <th>Quantit&agrave;</th>
                <th>Saldo</th>
                <th>Data di uscita</th>
                <th>Descrizione</th>
                <th>Peso</th>
                <th>Foto</th>
                <th>Azioni</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>
                    <form method="post" action="ProductInsert" enctype="multipart/form-data">
                        <input class="catalogue-input" name="id" type="number" maxlength="20" required placeholder="ID">
                </td>
                <td>
                        <input class="catalogue-input" name="nome" type="text" maxlength="20" required placeholder="Nome">
                </td>
                <td>
                        <input class="catalogue-input" name="prezzo" type="number" step="0.01" min="0" value="0" required placeholder="0.00">
                </td>
                <td>
                        <input class="catalogue-input" name="voto" type="number" min="0" max="10" required placeholder="0-10">
                </td>
                <td>
                        <input class="catalogue-input" name="quant" type="number" min="1" value="1" required placeholder="1">
                </td>
                <td>
                        <input class="catalogue-input" name="saldo" type="number" value="0" required placeholder="0">
                </td>
                <td>
                        <input class="catalogue-input" name="data" type="date" required>
                </td>
                <td>
                        <input class="catalogue-input" name="descrizione" type="text" maxlength="1000" required placeholder="Descrizione">
                </td>
                <td>
                        <input class="catalogue-input" name="peso" type="number" step="0.01" required placeholder="0.00">
                </td>
                <td>
                        <input class="catalogue-input" type="file" name="img" accept="image/*">
                </td>
                <td>
                        <input class="btn-det" type="submit" value="Aggiungi">
                    </form>
                </td>
            </tr>
        </tbody>
    </table>
</div>

</body>
<%@ include file="../fragments/footer.html"%>
</html>