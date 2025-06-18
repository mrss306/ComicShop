<%@page import="java.util.ArrayList"%>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./fragments/headerlogged.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>il mio account</title>
</head>
<link href="./style/style.css" rel="stylesheet" type="text/css">
<body>
	<%
	UserBean user= (UserBean) session.getAttribute("currentSessionUser");
	%>

<br>

<div class="user-container">
<form action="UserUpdate">
	<ul>
		<li>
			<div class="user">
			<h3>I miei dati</h3>
				<div class="user-label">Nome:</div>
				<input class="user" name=nome type="text" value="<%=user.getNome()%>">
			</div>
		</li>
		
		<li>
		<div class="user">
			<div class="user-label">Cognome:</div>
				<input class="user" name=cognome type="text" value="<%=user.getCognome()%>">
			</div>
		</li>
		
		<li>
		<div class="user">
			<div class="user-label">Email:</div>
				<input class="user" name=email  type="email" value="<%=user.getEmail()%>">
			</div>
		</li>
		
		<li>
		<div class="user">
			<div class="user-label">Data di nascita:</div>
				<input class="user" name=data type="date" value=<%=user.getData_nascita()%>>
			</div>
		</li>
		
		<li>
		<div class="user">
			<div class="user-label">Numero di Telefono:</div>
				<input class="user" name=num_telefono type="text" value="<%=user.getNum_tel()%>">
			</div>
		</li>
		
		<li>
		<div class="user">
			<div class="user-label">Paese di Residenza:</div>
				<input class="user" name=paese_residenza type="text" value="<%=user.getPaese_residenza()%>">
			</div>
		</li>
		
		<li>
		<div class="user">
			<div class="user-label">Via Indirizzo di Spedizione:</div>
				<input class="user" name=via type="text" value="<%=user.getVia()%>">
			</div>
		</li>
		
		<li>
		<div class="user">
			<div class="user-label">Citt&agrave:</div>
				<input class="user" name=citta type="text" value="<%=user.getCitta()%>">
			</div>
		</li>
		
		<li>
		<div class="user">
			<div class="user-label">Provincia:</div>
				<input class="user" name=provincia type="text" value="<%=user.getProvincia()%>">
			</div>
		</li>
		
		<li>
		<div class="user">
			<div class="user-label">Carta di Credito:</div>
				<input class="user" name=carta type="text" value="<%=user.getCarta()%>">
			</div>
		</li>
		
		
		<li>
		<div class="user">
			<div class="user-label"></div>
			<input type="hidden" name=action value=update>
				<input type="submit" value=Salva>
			</div>
		</li>
	</ul>
	</form>
	</div>

	

</body>
<%@ include file="./fragments/footer.html"%>
</html>