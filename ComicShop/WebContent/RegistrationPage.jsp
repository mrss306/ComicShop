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
<title>Pagina di registrazione</title>
<link href="./style/style.css" rel="stylesheet" type="text/css">
<link href="./style/error.css" rel="stylesheet" type="text/css">
<script src="./js/registration.js"></script>
<script src="./js/username-checker.js"></script>

</head>

<body>
	<h2>Compila il form per registrarti</h2>
	<div class=register>
	<div class="alert">
			<span class="closebtn"
				onclick="this.parentElement.style.display='none';">&times;</span>
				<span id="errorspan"></span>
	</div>
		
		<form action="UserControl" id="myform">
		
			<label for="usr">Username
			<input class=register type=text name="usr" placeholder="slowturtle12" required></label> 
			<br> 
			
			<label for="nome">Nome
			<input	class=register type=text name="nome" placeholder="mario" required></label>
			<br> 
			
			<label for="cogn">Cognome
			<input class=register type=text name="cogn" placeholder="rossi" required></label> 
			<br> 
			
			<label for="email">Email
			<input	class=register type=email name=email placeholder="someone@something.com"></label> 
			<br> 
			
			<label for="pwd">Password
			<input	class=register type=password name=pwd placeholder="supersecret" required></label> 
			<br> 
			
			<label for="num_tel">Numero di Telefono
			<input class=register type=text name=num_tel placeholder="3331725467" required></label> 
			<br> 
			
			<label for="paese">Paese di residenza
			<input class=register type=text name=paese placeholder="Italia" required></label>
			<br> 
			
			<label for="via">Via Indirizzo di Spedizione
			<input class=register type=text name=via placeholder="Via Domenico Catalano 27" required></label>
			<br>
			
			<label for="citta">Citt&agrave;
			<input class=register type=text name=citta placeholder="Scafati" required></label>
			<br>
			
			<label for="provincia">Provincia
			<input class=register type=text name=provincia placeholder="SA" required></label>
			<br>
			
			<label for="carta">Numero Carta di Credito
			<input class=register type=text name=carta placeholder="1234123412341234" required></label>
			<br>     
			
			<label for="data">Data di nascita
			<input class=register type=date name=data required></label><br> 
			
			
			<input class=btn type=submit value=Registrati>
		</form>
	</div>
</body>
<%@ include file="./fragments/footer.html"%>
</html>