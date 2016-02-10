<%@page import="org.game.functions.PlayerBones"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
#div1 {
	padding: 10px;
	border: 1px solid #aaaaaa;
}
</style>
<%
	Cookie[] cookies = null;
	cookies = request.getCookies();
	Cookie cookie = null;
	Cookie cookie2 = null;
	for (int i = 0; i < cookies.length; i++) {
		if (cookies[i].getName().equals("userId"))
			cookie = cookies[i];
		else if (cookies[i].getName().equals("userName"))
			cookie2 = cookies[i];
	}
	if (cookie == null || cookie2 == null)
		response.sendRedirect("index.jsp");
%>
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
	<script>
		var stmp = getCookie("gameStarted");
		if (stmp == "true") {
			$(function() {
				$("#divForButtons").hide();
				$("#gameTable").show();
			});
		} else {
			$(function() {
				$("#divForButtons").show();
				$("#gameTable").hide();
			});
		}
	</script>
	<div class="el1 w3-containter ">
		<div class="el11 w3-containter ">
			<center>
				<p class="w3-text-amber">
					Welcome
					<script>
						document.write(getCookie("userName"));
					</script>
				<p>
					<button class="w3-btn w3-round-xxlarge w3-text-shadow w3-red"
						onclick="logOut()">LogOut</button>
				</p>
			</center>
		</div>
		<div class="el12 w3-containter ">
			<div style="width: 100%; height: 50%;">
				<button
					class="w3-btn w3-small w3-round-xlarge w3-text-shadow w3-red"
					style="width: 140px;"
					onclick="document.getElementById('id01').style.display='block'">Account
					Settings</button>
				<div id="id01" class="w3-modal">
					<div class="w3-modal-content">
						<div class="w3-container">
							<span
								onclick="document.getElementById('id01').style.display='none'"
								class="w3-closebtn">×</span>
							<form action="welcome.jsp" method="post">
								<p>
									<input class="w3-input" type="text" required> <label
										class="w3-label w3-validate">User Name</label>
								</p>
								<p>
									<input class="w3-input" type="password" required> <label
										class="w3-label w3-validate">Password</label>
								</p>
								<p>
									<button class="w3-btn w3-blue">Change</button>
								</p>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div style="width: 100%; height: 50%;">
				<button
					class="w3-btn w3-small w3-round-xlarge w3-text-shadow w3-red"
					style="width: 140px;"
					onclick="document.getElementById('id02').style.display='block'">Colors
					Settings</button>
				<div id="id02" class="w3-modal">
					<div class="w3-modal-content">
						<div class="w3-container">
							<span
								onclick="document.getElementById('id02').style.display='none'"
								class="w3-closebtn">×</span>
							<p>
								<input id="js1" name="backgroundColor"
									class="jscolor {onFineChange:'updateBackgroundColor(this)'}"
									value="<script>document.write(getBackgroundColor());</script>">
							</p>
							<p>
								<input id="js2" name="buttonColor"
									class="jscolor {onFineChange:'updateButtonColor(this)'}"
									value="<script>document.write(getButtonColor());</script>">
							</p>
							<p>
								<input id="js3" name="textColor"
									class="jscolor {onFineChange:'updateTextColor(this)'}"
									value="<script>document.write(getTextColor());</script>">
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="el13 w3-containter "></div>
		<div class="el14 w3-containter "></div>
	</div>
	<div class="el2">
		<div class="el22 w3-containter">
			<div id="gameTable" style="width: 100%; height: 100%;">
				<script>
					document
							.write(
									'<iframe id="ifr" src="testnewgm.jsp?n='
											+ getCookie("ng")
											+ '" width="100%" height="100%" scrolling="yes"></iframe>')
				</script>
			</div>
			<div id="divForButtons">

				<FORM NAME="form1" METHOD="POST">
					<INPUT TYPE="HIDDEN" NAME="selectGame"> <INPUT
						TYPE="BUTTON" VALUE="Continue Last Game" ONCLICK="button1()">
					<INPUT TYPE="BUTTON" VALUE="Start New Game" ONCLICK="button2()">
				</FORM>
			</div>
		</div>
	</div>
</body>
</html>