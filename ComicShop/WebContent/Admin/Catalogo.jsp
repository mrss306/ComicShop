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
<link href="./style/error.css" rel="stylesheet" type="text/css">
<script src="./js/update.js"></script>
<script src="./js/insert.js"></script>
<script src="./js/product-id-checker.js"></script>

<title>Catalogo</title>
</head>
<body>

<%
Collection<?> products = (Collection<?>) session.getAttribute("products");
%>





<!-- Insert -->
<h2>Inserisci Un Nuovo Articolo</h2>
<div class="alert">
    <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
    <span id="errorspan"></span>
</div>
<div class="insert-form">
    <form method="post" action="ProductInsert" enctype="multipart/form-data" class="product-form">
        <div class="form-group">
            <label for="id">ID</label>
            <input class="catalogue-input" name="id" type="number" maxlength="20" required placeholder="ID">
        </div>
        
        <div class="form-group">
            <label for="nome">Nome</label>
            <input class="catalogue-input" name="nome" type="text" maxlength="20" required placeholder="Nome">
        </div>
        
        <div class="form-group">
            <label for="prezzo">Prezzo</label>
            <input class="catalogue-input" name="prezzo" type="number" step="0.01" min="0" value="0" required placeholder="0.00">
        </div>
        
        <div class="form-group">
            <label for="voto">Voto</label>
            <input class="catalogue-input" name="voto" type="number" required placeholder="0-10">
        </div>
        
        <div class="form-group">
            <label for="quant">Quantit&agrave;</label>
            <input class="catalogue-input" name="quant" type="number" min="1" value="1" required placeholder="1">
        </div>
        
        <div class="form-group">
            <label for="saldo">Saldo</label>
            <input class="catalogue-input" name="saldo" type="number" value="0" required placeholder="0">
        </div>
        
        <div class="form-group">
            <label for="data">Data di uscita</label>
            <input class="catalogue-input" name="data" type="date" required>
        </div>
        
        <div class="form-group">
            <label for="descrizione">Descrizione</label>
            <input class="catalogue-input" name="descrizione" type="text" maxlength="1000" required placeholder="Descrizione">
        </div>
        
        <div class="form-group">
            <label for="peso">Peso in kg</label>
            <input class="catalogue-input" name="peso" type="number" step="0.01" required placeholder="0.00">
        </div>
        
        <div class="form-group">
            <label for="img">Foto</label>
            <input class="catalogue-input" type="file" name="img" accept="image/*">
        </div>
        
        <div class="form-actions">
            <input class="btn-det" type="submit" value="Aggiungi">
        </div>
    </form>
</div>



<!-- Update -->
<h2>Prodotti</h2>
<div class="ualert">
    <span class="uclosebtn" onclick="this.parentElement.style.display='none';">&times;</span>
    <span id="uerrorspan"></span>
</div>
<%
if (products != null && !products.isEmpty()) {
    Iterator<?> it = products.iterator();
    while (it.hasNext()) {
        ProductBean bean = (ProductBean) it.next();
%>
<div class="product-card">
    <form method="GET" action="ProductUpdate" class="product-form">
        <input type="hidden" name="id" value="<%=bean.getId()%>">
        
        <div class="form-group">
            <label for="id">ID</label>
            <input readonly class="catalogue-input" type="number" value="<%=bean.getId()%>">
        </div>
        
        <div class="form-group">
            <label for="nome">Nome</label>
            <input class="catalogue-input" name="nome" type="text" value="<%=bean.getNome()%>" required>
        </div>
        
        <div class="form-group">
            <label for="prezzo">Prezzo</label>
            <input class="catalogue-input" name="prezzo" type="number" step="0.01" value="<%=bean.getPrezzo()%>" required>
        </div>
        
        <div class="form-group">
            <label for="voto">Voto</label>
            <input class="catalogue-input" name="voto" type="number" value="<%= (int)bean.getVoto() %>" required>
        </div>
        
        <div class="form-group">
            <label for="quantita">Quantit&agrave;</label>
            <input class="catalogue-input" name="quantita" type="number" value="<%=bean.getQuantità()%>" required>
        </div>
        
        <div class="form-group">
            <label for="saldo">Saldo</label>
            <input class="catalogue-input" name="saldo" type="number" value="<%=bean.getSaldo()%>" required>
        </div>
        
        <div class="form-group">
            <label for="data">Data di uscita</label>
            <input class="catalogue-input" name="data" type="date" value="<%=bean.getData_uscita()%>" required>
        </div>
        
        <div class="form-group">
            <label for="descrizione">Descrizione</label>
            <input class="catalogue-input" name="descrizione" type="text" value="<%=bean.getDescrizione()%>" required>
        </div>
        
        <div class="form-group">
            <label for="peso">Peso in kg</label>
            <input class="catalogue-input" name="peso" type="number" step="0.01" value="<%=bean.getPeso()%>" required>
        </div>
        
        <div class="form-actions">
            <input class="btn-det" type="submit" value="Update">
        </div>
    </form>
</div>
<%
    }
} else {
%>
<div class="product-card">
    Nessun prodotto disponibile
</div>
<%
}
%>


<!-- Delete -->
<h2>Elimina Prodotti</h2>
<div class="delete-section">
<%
if (products != null && !products.isEmpty()) {
    Iterator<?> it = products.iterator();
    while (it.hasNext()) {
        ProductBean bean = (ProductBean) it.next();
%>
    <div class="delete-item">
        <form action="ProductDelete" method="GET" class="product-form">
            <div class="form-group">
                <label for="id">ID</label>
                <input readonly class="catalogue-input" type="number" value="<%=bean.getId()%>">
            </div>
            
            <div class="form-group">
                <label for="nome">Nome</label>
                <input readonly class="catalogue-input" type="text" value="<%=bean.getNome()%>">
            </div>
            
            <input type="hidden" name="deletedid" value="<%=bean.getId()%>">
            <button class="btn-det delete-btn" type="submit">Elimina</button>
        </form>
    </div>
<%
    }
} else {
%>
    <div class="delete-item">
        Nessun prodotto disponibile
    </div>
<%
}
%>
</div>

</body>
<%@ include file="../fragments/footer.html"%>
</html>