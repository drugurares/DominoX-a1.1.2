<%@page import="org.Tools.Utility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	int userID = 0;
	String u = request.getParameter("userName");
	String p = Utility.hashCodeC(request.getParameter("password"));
	int d = Utility.verifyUser(u, p);
	userID = d;
	if (userID != 0) {
		Cookie uCookie = new Cookie("userId", Integer.toString(userID));
		Cookie uNCookie = new Cookie("userName",u);
		uCookie.setMaxAge(60 * 60 * 24);
		uNCookie.setMaxAge(60 * 60 * 24);
		response.addCookie(uCookie);
		response.addCookie(uNCookie);
		response.sendRedirect("welcome.jsp");
	} else
		response.sendRedirect("index.jsp?log=incorect");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>