<%@page import="org.game.functions.BoneYard"%>
<%@page import="org.game.functions.PcBones"%>
<%@page import="org.game.functions.PlayerBones"%>
<%@page import="org.game.functions.BonePack"%>
<%@page import="org.game.functions.Game"%>
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
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script>
	function allowDrop(ev) {
		ev.preventDefault();
	}

	function drag(ev) {
		ev.dataTransfer.setData("text", ev.target.id);
	}
	function post(path, parameters) {
		var form = $('<form></form>');

		form.attr("method", "post");
		form.attr("action", path);

		$.each(parameters, function(key, value) {
			var field = $('<input></input>');

			field.attr("type", "hidden");
			field.attr("name", key);
			field.attr("value", value);

			form.append(field);
		});

		$(document.body).append(form);
		form.submit();
	}
	function drop(ev) {
		ev.preventDefault();
		var data = ev.dataTransfer.getData("text");
		var targetId = ev.target.id;
		var boneid = document.getElementById(data).getAttribute("id");
		boneid = boneid.slice(-1);
		var msg;
		if (targetId == "divLeftBoneDrop")
			msg = boneid + "_1_0";
		else if (targetId == "divRightBoneDrop")
			msg = boneid + "_2_0";

		ev.target.appendChild(document.getElementById(data));
		post("testnewgm.jsp?r=1", {
			'plDec' : msg
		});
	}
</script>

</head>
<body>



	<%
		String n = request.getParameter("n");
		if (n != null)
			if (n.equals("1")) {
				session.setAttribute("isNew", "true");
				System.out.println("mata");
				session.setAttribute("isStarted", "false");

			} else
				session.setAttribute("isNew", "false");
		if (session.getAttribute("isStarted") != "true")
			if (session.getAttribute("isNew") == "true") {

				Game.newRound();
				Game.newGame();
				session.setAttribute("isStarted", "true");
				session.setAttribute("isNew", "false");

			} else if (session.getAttribute("isNew") == "falset") {
				Cookie[] cookies = null;
				cookies = request.getCookies();
				Cookie cookie = null;
				for (int i = 0; i < cookies.length; i++) {
					if (cookies[i].getName().equals("userId"))
						cookie = cookies[i];
				}
				//	Game.reloadLastGame(cookie.getValue());
			}
		if (session.getAttribute("isStarted") == "true") {
			while (!PlayerBones.playerBones.isEmpty() && !PcBones.pcBones.isEmpty()) {
				out.println("<script>$(\"body\").empty();</script>");
				out.println("<div id=\"pcBones\" style=\"height:20%;width:85%;margin-top:0px;margin-right:0px;\">");
				for (int i = 0; i < PcBones.pcBones.size(); i++) {
					out.println("<img id=\"pcBone" + i
							+ "\"  src=\"Bones\\black.bmp\" alt=\"black\" class=\"rotate90\"draggable=\"false\" ondragstart=\"drag(event)\"style=\"float:right;margin-top:15px;margin-left:-15px\">");
				}
				out.println("</div>");
				out.println("<div id=\"boneYard\" style=\"height:70%;width:14.999%;margin-top:-5%;float:right;\">");
				for (int i = 0; i < BoneYard.boneYard.size(); i++) {
					out.println("<a href=\"testnewgm.jsp?r=1?by=1\"><img id=\"byBone" + i
							+ "\"  src=\"Bones\\black.bmp\" alt=\"black\" class=\"rotate180\"draggable=\"false\" ondragstart=\"drag(event)\"style=\"float:right;margin-top:15px;padding-left:30%;padding-right:30%;float:right; zoom:75%;\"></a></br>");
				}
				out.println("</div>");
				out.println(
						"<div id=\"divCentral\" style=\"height:60%;width:85%;padding-top:5%;text-align: center;\">");
				if (Game.table.leftSide.size() > 0)
					if (PlayerBones.playerBones.size() > 0) {
						String dvad = "<div id=\"divLeftBoneDrop"
								+ "\" class=\"drow11\" style=\" width: 60px;height: 60px;outline: 1px solid; float: left;\" ondrop=\"drop(event)\" ondragover=\"allowDrop(event)\"></div>";
						out.println(dvad);
					}
				for (int i = Game.table.leftSide.size() - 1; i >= 0; i--) {
					String lb = "<div id=\"divLeftBone" + i
							+ "\" class=\"drow11\" style=\" width: 60px;height: 60px;outline: 1px solid; float: left;\"><img id=\"leftBone"
							+ i + "\" alt=\"" + Game.table.leftSide.get(i).getBoneNumber() + "\"  src=\"Bones\\"
							+ Game.table.leftSide.get(i).getBoneNumber() + ".bmp\" class=\"rotate";
					if (Game.table.leftSide.get(i).getDirection() == 1)
						lb += "0";
					else if (Game.table.leftSide.get(i).getDirection() == 2)
						lb += "180";
					lb += "\"draggable=\"false\" style=\"margin-top:15px;margin-left:0px\"></div>";
					out.println(lb);

				}
				if (PlayerBones.playerBones.size() > 0 && Game.table.leftSide.size() == 0) {
					String dvad = "<div id=\"divLeftBoneDrop"
							+ "\" class=\"drow11\" style=\" width: 60px;height: 60px;outline: 1px solid; float: left;\"ondrop=\"drop(event)\" ondragover=\"allowDrop(event)\"></div>";
					out.println(dvad);
				}
				String middleBone = "<div id=\"divStart\" class=\"drow11\" style=\" width: 30px;height: 60px;outline: 1px solid; float: left;\"><img id=\"startBone\" alt=\""
						+ Game.table.firstBone.getBoneNumber() + "\"  src=\"Bones\\"
						+ Game.table.firstBone.getBoneNumber()
						+ ".bmp\" class=\"rotate90\"draggable=\"false\" style=\"margin-top:15px;margin-left:-15px\"></div>";
				out.println(middleBone);
				if (PlayerBones.playerBones.size() > 0 && Game.table.rightSide.size() == 0) {
					String dvad = "<div id=\"divRightBoneDrop"
							+ "\" class=\"drow11\" style=\" width: 60px;height: 60px;outline: 1px solid; float: left;\"ondrop=\"drop(event)\" ondragover=\"allowDrop(event)\"></div>";
					out.println(dvad);
				}
				for (int i = 0; i < Game.table.rightSide.size(); i++) {
					String rb = "<div id=\"divRightBone" + i
							+ "\" class=\"drow11\" style=\" width: 60px;height: 60px;outline: 1px solid; float: left;\"><img id=\"leftBone"
							+ i + "\" alt=\"" + Game.table.rightSide.get(i).getBoneNumber() + "\"  src=\"Bones\\"
							+ Game.table.rightSide.get(i).getBoneNumber() + ".bmp\" class=\"rotate";
					if (Game.table.rightSide.get(i).getDirection() == 1)
						rb += "0";
					else if (Game.table.rightSide.get(i).getDirection() == 2)
						rb += "180";
					rb += "\"draggable=\"false\" style=\"margin-top:15px;margin-left:0px\"></div>";
					out.println(rb);
				}
				if (Game.table.rightSide.size() > 0) {
					String dvad = "<div id=\"divRightBoneDrop"
							+ "\" class=\"drow11\" style=\" width: 60px;height: 60px;outline: 1px solid; float: left;\"ondrop=\"drop(event)\" ondragover=\"allowDrop(event)\"></div>";
					out.println(dvad);
				}

				out.println("</div><div id=\"playerBones\" style=\"height:20%;width:85%;margin-bottom: 0px;\">");
				for (int i = 0; i < PlayerBones.playerBones.size(); i++) {
					String bn = PlayerBones.playerBones.get(i).getBoneNumber();
					bn = bn.trim();
					out.println("<img id=\"plBone" + i + "\"  src=\"Bones\\" + bn + ".bmp\" alt=\"" + bn
							+ "\" class=\"rotate90\"draggable=\"true\" ondragstart=\"drag(event)\"style=\"float:right;margin-top:15px;margin-left:-15px\">");
				}
				out.println("</div>");
				out.flush();

				if (request.getParameter("r") != null)
					if (request.getParameter("plDec") != null && request.getParameter("r").equals("1")) {
						int xxs = 0;
						xxs = Game.play(request.getParameter("plDec"));
						if (xxs == 1)
							System.out.println("plwin");
						else if (xxs == 2)
							System.out.println("pcwin");
					} else if (request.getParameter("by") != null)
						if (request.getParameter("by").equals("1")) {
							System.out.println(request.getParameter("by"));
							Game.play(request.getParameter("0_0_1"));
						}
				out.println("<script>window.location.replace(\"testnewgm.jsp?n=0&r=0\")</script>");
				out.flush();
				Thread.sleep(2000);
			}
		}
	%>

</body>
</html>