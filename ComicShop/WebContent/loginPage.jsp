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
<link href="./style/style.css" rel="stylesheet" type="text/css">
<link href="./style/error.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>Login</title>
<script src="./js/login.js"></script>
</head>
<body>
<%if(request.getParameter("login")!=null)
{
	if(request.getParameter("login").equals("wrong"))
	{%>
	<h2 class=error>Le credenziali inserite sono sbagliate </h2>
<%}
	}%>

	<h2>Accedi / Registrati</h2>
	
	<h3 style="text-align: center">Hai già un account?</h3>
	
<div class=login>

	<div class="alert">
			<span class="closebtn"
				onclick="this.parentElement.style.display='none';">&times;</span>
				<span id="errorspan"></span>
	</div>

	<form action="Login" class=login id="loginform">
		<label for="un">Username: 
			<input class=login type="text" name="un" placeholder="Username">
		</label> <br><br>
		
		<label for="pw">Password: 
			<input class=login type="password" name="pw" placeholder="Password" >
		</label> <br><br>
		
		<button class=btn type="submit" name="login">Login</button>
		<button class=btn type="submit" formaction="RegistrationPage.jsp">Crea un account</button>
	</form>



</div>
</body>
<%@ include file="./fragments/footer.html" %>
</html>