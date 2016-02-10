package org.game.functions;

public class Bone {
	public int x, y;
	String imgPath;
	int points;
	int boneNumber;
	int selectedBy;// 0-none,1-player,2-pc, 3-boneYard
	boolean isDouble;
	int direction;// 1-> x|y, 2->y|x

	public void setDirection(int d) {
		direction = d;
	}

	public int getDirection() {
		return direction;
	}

	public Bone(int x, int y, int boneNumber) {
		this.x = x;
		this.y = y;
		this.boneNumber = boneNumber;
		points = x + y;
		imgPath = "/boneimg/" + boneNumber;
		selectedBy = 0;
		if (x == y)
			isDouble = true;
		else
			isDouble = false;
	}

	public void selectBy(int by) {
		selectedBy = by;
	}

	public String toString(boolean a) {
		return "x: " + x + " y: " + y;
	}

	public String getBoneNumber() {
		return "" + boneNumber;
	}

	public String toString() {

		return "x:" + x + " y:" + y + " BN:" + boneNumber + " Selected:" + selectedBy + " Direction:" + direction;

	}

}
