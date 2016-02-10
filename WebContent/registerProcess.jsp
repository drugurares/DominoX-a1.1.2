<%@page import="org.Tools.Utility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Process Register</title>
</head>
<body>
	<%
		if (Utility.addUser(request.getParameter("userName"), request.getParameter("password"))) {
			Cookie uCookie = new Cookie("userId", Integer.toString(Utility.numberOfUsers()));
			Cookie uNCookie = new Cookie("userName",request.getParameter("userName"));
			uCookie.setMaxAge(60 * 60 * 24);
			uNCookie.setMaxAge(60 * 60 * 24);
			response.addCookie(uCookie);
			response.addCookie(uNCookie);
			response.sendRedirect("welcome.jsp");
		} else
			response.sendRedirect("index.jsp?reg=incorect");
	%>
</body>
</html>