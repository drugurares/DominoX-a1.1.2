<%@page import="org.game.functions.servletPrint"%>
<%@page import="org.game.functions.Game"%>
<%@page import="org.Tools.Utility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="w3.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>DominoX</title>
<script src="jscolor.js"></script>
<script src="scripts.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
</head>
<body>
	

	<div class="el21 w3-containter w3-green">
		<div style="float: right; padding-top: 2.5%; margin-right: 7.5%;">
			<script>
				updatePcBones();
			</script>
		</div>
	</div>
	<div id="gameTable"
		style="height: 85%; border: 0px solid black; -moz-box-sizing: border-box;"
		class="w3-blue">
		<div id="div1"
			style="height: 100%; border: 1px solid black; -moz-box-sizing: border-box;">
			
			<script>
				drow();
			</script>

		</div>
	</div>
	<div class="el24 w3-containter w3-grey">
		<div style="float: right; padding-top: 2.5%; margin-right: 7.5%;">
			<script>
				updatePlayerBones();
			</script>
		</div>
	</div>
</body>
</html>