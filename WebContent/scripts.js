function updateTable() {
	for (var i = 0; i < getCookie("tableL"); i++) {
		var cTmpL = getCookie("tableL" + i).split(" ");
		document.write("<img alt=\"" + cTmpL[0] + "\" src=\"Bones\\" + cTmpL[0]
				+ ".bmp\" class=\"rotate" + cTmpL[1] + "\">");
	}
	var cTmpM = getCookie("tableM").split(" ");
	document.write("<img alt=\"" + cTmpM[0] + "\" src=\"Bones\\" + cTmpM[0]
			+ ".bmp\" class=\"rotate" + cTmpM[1] + "\">");

	for (var i = 0; i < getCookie("tableR"); i++) {
		var cTmpR = getCookie("tableR" + i).split(" ");
		document.write("<img alt=\"" + cTmpR[0] + "\" src=\"Bones\\" + cTmpR[0]
				+ ".bmp\" class=\"rotate" + cTmpR[1] + "\">");
	}
}
var ng_cg=0;
function button1() {
ng_cg=1;
	document.form1.selectGame.value = "cGame"
	form1.submit()
	setCookie("gameStarted", "true", 1);
	setCookie("ng", "0", 1);
}
function button2() {
	ng_cg=2;
	document.form1.selectGame.value = "nGame"
	form1.submit()
	setCookie("gameStarted", "true", 1);
	setCookie("ng", "1", 1);

}

function updateBoneYardBones() {
	for (var i = 0; i < getCookie("boneYardBoneNr"); i++) {
		var cTmp = getCookie("boneYardBoneNr" + i);
		document.write("<p><img alt=\"black\" src=\"Bones\\black.bmp\"></p>");
	}
}
function updatePcBones() {
	for (var i = 0; i < getCookie("pcBoneNr"); i++) {
		var cTmp = getCookie("pcBoneNr" + i);
		document
				.write("<img alt=\"black\" src=\"Bones\\black.bmp\" class=\"rotate90\">");
	}
}
function updateBackgroundColor(jscolor) {
	setCookie("backgroundColor", jscolor, 60 * 60 * 60);
}
function updateButtonColor(jscolor) {
	setCookie("buttonColor", jscolor, 60 * 60 * 60);
}
function updateTextColor(jscolor) {
	setCookie("textColor", jscolor, 60 * 60 * 60);
}
function setCookie(cname, cvalue, exmin) {
	var d = new Date();
	d.setTime(d.getTime() + (exmin * 60 * 1000));
	var expires = "expires=" + d.toUTCString();
	document.cookie = cname + "=" + cvalue + "; " + expires;
}
function logOut() {
	document.cookie = "userName=; expires=Thu, 01 Jan 1970 00:00:00 UTC";
	document.cookie = "userId=; expires=Thu, 01 Jan 1970 00:00:00 UTC";
	window.location.replace("index.jsp");
}
function getCookie(cname) {
	var name = cname + "=";
	var ca = document.cookie.split(';');
	for (var i = 0; i < ca.length; i++) {
		var c = ca[i];
		while (c.charAt(0) == ' ')
			c = c.substring(1);
		if (c.indexOf(name) == 0)
			return c.substring(name.length, c.length);
	}
	return "";
}
function getButtonColor() {
	return getCookie("buttonColor");
}
function getBackgroundColor() {
	return getCookie("backgroundColor");
}
function getTextColor() {
	return getCookie("textColor");
}

function addNewStyle(newStyle, clname) {
	var cols = document.getElementsByClassName('clname');
	for (i = 0; i < cols.length; i++) {
		cols[i].style.backgroundColor = '#' + newStyle;
	}
}
addNewStyle('#' + getBackgroundColor(), backgroundColorSt);
addNewStyle('buttonColorSt {background-color: #' + getButtonColor()
		+ ' !important;}');
addNewStyle('textColorSt {color: #' + getTextColor() + ' !important;}');

function updatePlayerBones() {
	for (var i = 1; i < getCookie("playerBoneNr"); i++) {
		var cTmp = getCookie("playerBoneNr" + i);
		document
				.write("<img id=\"plBone"
						+ i
						+ "\" alt=\""
						+ cTmp
						+ "\" src=\"Bones\\"
						+ cTmp
						+ ".bmp\" class=\"rotate90\"draggable=\"true\" ondragstart=\"drag(event)\"style=\"margin-top:15px;margin-left:-15px\">");
	}
}
function getBoneXY(boneNr) {
	if (boneNr == 0)
		return "0_0";
	else if (boneNr == 1)
		return "0_1";
	else if (boneNr == 2)
		return "0_2";
	else if (boneNr == 3)
		return "0_3";
	else if (boneNr == 4)
		return "0_4";
	else if (boneNr == 5)
		return "0_5";
	else if (boneNr == 6)
		return "0_6";
	else if (boneNr == 7)
		return "1_1";
	else if (boneNr == 8)
		return "1_2";
	else if (boneNr == 9)
		return "1_3";
	else if (boneNr == 10)
		return "1_4";
	else if (boneNr == 11)
		return "1_5";
	else if (boneNr == 12)
		return "1_6";
	else if (boneNr == 13)
		return "2_2";
	else if (boneNr == 14)
		return "2_3";
	else if (boneNr == 15)
		return "2_4";
	else if (boneNr == 16)
		return "2_5";
	else if (boneNr == 17)
		return "2_6";
	else if (boneNr == 18)
		return "3_3";
	else if (boneNr == 19)
		return "3_4";
	else if (boneNr == 20)
		return "3_5";
	else if (boneNr == 21)
		return "3_6";
	else if (boneNr == 22)
		return "4_4";
	else if (boneNr == 23)
		return "4_5";
	else if (boneNr == 24)
		return "4_6";
	else if (boneNr == 25)
		return "5_5";
	else if (boneNr == 26)
		return "5_6";
	else if (boneNr == 27)
		return "6_6";
}
function isValidMove(oldimg, pozition, newimg, lr) {
	var poz;
	if (pozition == "rotate90")
		poz = -1;
	if (pozition == "rotate0")
		poz = 0;
	if (pozition == "rotate180")
		poz = 1;
	if (lr == "L") {
		if (poz == 0 || poz == -1) {
			var x = getBoneXY(oldimg).split("_")[0];
			var y = getBoneXY(oldimg).split("_")[1];
			if (poz == 1) {
				var x = getBoneXY(oldimg).split("_")[1];
				var y = getBoneXY(oldimg).split("_")[0];

			}
		}

	}
}

function drow() {
	// for (var i = 0; i < 28; i++)
	// document
	// .write(' <div style=" width: 60px;height: 60px;outline: 1px solid; float:
	// left;" ondrop="drop(event)" ondragover="allowDrop(event)"></div>');
	document
			.write(' <div id="divStart" class="drow11" style=" width: 30px;height: 60px;outline: 1px solid; float: left;">');
	var cTmp = getCookie("playerBoneNr0");
	document
			.write("<img id=\"plBone0\" alt=\""
					+ cTmp
					+ "\" src=\"Bones\\"
					+ cTmp
					+ ".bmp\" class=\"rotate90\"draggable=\"false\" style=\"margin-top:15px;margin-left:-15px\"></div>");
	var tst0 = " <div id=\"drow_L_0\" style=\" width: 60px;height: 60px;outline: 1px solid; float: left;\" ondrop=\"drop(event)\" ondragover=\"allowDrop(event)\"></div>";
	var tst1 = " <div id=\"drow_L_1\" style=\" width: 60px;height: 60px;outline: 1px solid; float: left;\" ondrop=\"drop(event)\" ondragover=\"allowDrop(event)\"></div>";
	var tst2 = " <div id=\"drow_L_2\" style=\" width: 60px;height: 60px;outline: 1px solid; float: left;\" ondrop=\"drop(event)\" ondragover=\"allowDrop(event)\"></div>";
	var tst3 = " <div id=\"drow_R_5\" style=\" width: 60px;height: 60px;outline: 1px solid; float: left;\" ondrop=\"drop(event)\" ondragover=\"allowDrop(event)\"></div>";
	insertDivAfter("divStart", tst0);
	insertDivAfter("drow_L_0", tst1);
	insertDivAfter("drow_L_1", tst2);
	insertDivBefore("divStart", tst3);
}

function insertDivAfter(divId, divContent) {
	var $newdiv1 = $(divContent), newdiv2 = document.createElement("div"), existingdiv1 = document
			.getElementById(divId);

	$(existingdiv1).after($newdiv1);
}
function insertDivBefore(divId, divContent) {
	var $newdiv1 = $(divContent), newdiv2 = document.createElement("div"), existingdiv1 = document
			.getElementById(divId);

	$(existingdiv1).before($newdiv1);
}
// 15PX -15PX PT ROTATE90 SI 15PX 0PX PT ROTATE180
