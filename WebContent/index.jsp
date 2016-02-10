<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
Cookie[] cookies = null;
	cookies = request.getCookies();
	Cookie cookie = null;
	for (int i = 0; i < cookies.length; i++)
		if (cookies[i].getName().equals("userId"))
			cookie = cookies[i];
	if(cookie!=null&&cookie.getValue()!="0")
		response.sendRedirect("welcome.jsp");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<meta charset="ISO-8859-1">
<title>DominoX</title>
</head>
<body>
	<header class="w3-container w3-blue">
	<h1 class="w3-text-shadow">Please login into your account!</h1>
	</header>

	<div class="w3-row">
		<div class="w3-col m1 l1">
			<br />
		</div>

		<div class="w3-col m4 l3">
			<form class="w3-container w3-card-4" method="post"
				action="loginProcess.jsp">

				<h2 class="w3-text-blue">Login:</h2>

				<p>
					<input class="w3-input" type="text" name="userName" required>
					<label class="w3-label w3-validate ">Name<%=((request.getParameter("log")!=null)&&(request.getParameter("log").equals("incorect"))?(": Incorect name or password"):(""))%></label>
				</p>

				<p>
					<input class="w3-input" type="password" name="password" required>
					<label class="w3-label w3-validate">Password</label>
				</p>

				<input class="w3-btn w3-blue" type="submit" value="Login">

			</form>
		</div>
		<div class="w3-col m1 l1">
			<br />
		</div>
		<div class="w3-col m4 l3">
			<form class="w3-container w3-card-4" method="post"
				action="registerProcess.jsp">

				<h2 class="w3-text-blue">Register:</h2>

				<p>
					<input class="w3-input" type="text" name="userName" required>
					<label class="w3-label w3-validate">Name<%=((request.getParameter("reg")!=null)&&(request.getParameter("reg").equals("incorect"))?(": Allready taked"):(""))%>
					</label>
				</p>

				<p>
					<input class="w3-input" type="password" name="password" required>
					<label class="w3-label w3-validate">Password</label>
				</p>

				<input class="w3-btn w3-blue" type="submit" value="Register">

			</form>
		</div>
	</div>
</body>
</html>