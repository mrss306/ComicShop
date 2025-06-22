<%@page import="java.util.List"%>
<%@page import="java.util.LinkedList"%>
<%@page import="it.unisa.model.OrderBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
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

<title>Archivio ordini admin</title>

</head>
<body>
        
    <h2>Ordini effettuati</h2>
                
    <%
    List<OrderBean> ordini = new LinkedList<OrderBean>();
    ordini = (LinkedList<OrderBean>) session.getAttribute("ordini");
    %>
    <div class="details">
        <table>
            <thead class="details">
                <tr>
                    <th>Codice ordine:</th>
                    <th>Data:</th>
                    <th>Importo totale:</th>
                    <th>Identificativo:</th>
                </tr>
            </thead>
            <tbody class="details">
                 <%
                if (ordini != null) {
                    for (OrderBean ordine : ordini) {
                %>
                <tr>
                    <td><a
                        href="Ordine?action=mostradettagli&codice=<%=ordine.getId()%>"><%=ordine.getId()%></a>
                    </td>
                    <td><%=ordine.getData_ordine()%></td>
                    <td><%=ordine.getCosto_totale()%> &euro;</td>
                    <td><%=ordine.getUsername()%> </td>
                </tr>
                <%
                }
                %>
            </tbody>
        </table>
    </div>
    <%
    } else {
    %>
    <h2>Nessun ordine registrato</h2>
    <%
    }
    %>
    
    <div class="search-forms">
        <div class="date-input">
            <form action="OrderArchive">
                <label for="startdate">Cerca ordini per range di date:</label><br>
                <input type="date" id="startdate" name="startdate"> 
                <input type="date" id="enddate" name="enddate"> 
                <input type="submit" value="Cerca">
            </form>
        </div>
        
        <div class="username-input">
            <form action="OrderArchive">
                <label for="username">Cerca ordini per utente:</label><br>
                <input type="text" id="username" name="username" placeholder="Inserisci username"> 
                <input type="submit" value="Cerca">
            </form>
        </div>
    </div>

</body>

<%@ include file="../fragments/footer.html"%>

</html>