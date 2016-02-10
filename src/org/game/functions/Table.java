package org.game.functions;

import java.util.ArrayList;

public class Table {
	public Bone firstBone;
	public boolean isSpinner;
	public ArrayList<Bone> rightSide = new ArrayList<Bone>();
	public ArrayList<Bone> leftSide = new ArrayList<Bone>();
	public int boneNumber;
	public int score;
	public void setFirstBone(Bone b) {
		if (b.boneNumber == 27)
			isSpinner = true;
		else
			isSpinner = false;
		firstBone = b;
		boneNumber = 1;
	}

	public boolean addright(Bone b) {
		if (rightSide.isEmpty()) {
			if (leftSide.isEmpty()) {
				if (firstBone.x == b.x || firstBone.y == b.x) {
					rightSide.add(b);
					rightSide.get(rightSide.size() - 1).setDirection(1);
					boneNumber++;
					return true;
				} else if (firstBone.x == b.y || firstBone.y == b.y) {
					rightSide.add(b);
					rightSide.get(rightSide.size() - 1).setDirection(2);
					boneNumber++;
					return true;
				}
			} else if (leftSide.get(0).direction == 1) {
				if (leftSide.get(0).y == firstBone.x) {
					if (firstBone.y == b.x) {
						rightSide.add(b);
						rightSide.get(rightSide.size() - 1).setDirection(1);
						boneNumber++;
						return true;
					} else if (firstBone.y == b.y) {
						rightSide.add(b);
						rightSide.get(rightSide.size() - 1).setDirection(2);
						boneNumber++;
						return true;
					}
				} else if (leftSide.get(0).y == firstBone.y) {
					if (firstBone.x == b.x) {
						rightSide.add(b);
						rightSide.get(rightSide.size() - 1).setDirection(1);
						boneNumber++;
						return true;
					} else if (firstBone.x == b.y) {
						rightSide.add(b);
						rightSide.get(rightSide.size() - 1).setDirection(2);
						boneNumber++;
						return true;
					}
				}
			} else if (leftSide.get(0).direction == 2) {
				if (leftSide.get(0).x == firstBone.x) {
					if (firstBone.y == b.x) {
						rightSide.add(b);
						rightSide.get(rightSide.size() - 1).setDirection(1);
						boneNumber++;
						return true;
					} else if (firstBone.y == b.y) {
						rightSide.add(b);
						rightSide.get(rightSide.size() - 1).setDirection(2);
						boneNumber++;
						return true;
					}
				} else if (leftSide.get(0).x == firstBone.y) {
					if (firstBone.x == b.x) {
						rightSide.add(b);
						rightSide.get(rightSide.size() - 1).setDirection(1);
						boneNumber++;
						return true;
					} else if (firstBone.x == b.y) {
						rightSide.add(b);
						rightSide.get(rightSide.size() - 1).setDirection(2);
						boneNumber++;
						return true;
					}
				}
			}
		} else {
			if (rightSide.get(rightSide.size() - 1).direction == 1) {
				if (rightSide.get(rightSide.size() - 1).y == b.x) {
					rightSide.add(b);
					rightSide.get(rightSide.size() - 1).setDirection(1);
					boneNumber++;
					return true;
				} else if (rightSide.get(rightSide.size() - 1).y == b.y) {
					rightSide.add(b);
					rightSide.get(rightSide.size() - 1).setDirection(2);
					boneNumber++;
					return true;
				}
			} else if (rightSide.get(rightSide.size() - 1).direction == 2) {
				if (rightSide.get(rightSide.size() - 1).x == b.x) {
					rightSide.add(b);
					rightSide.get(rightSide.size() - 1).setDirection(1);
					boneNumber++;
					return true;
				} else if (rightSide.get(rightSide.size() - 1).x == b.y) {
					rightSide.add(b);
					rightSide.get(rightSide.size() - 1).setDirection(2);
					boneNumber++;
					return true;
				}
			}
		}

		return false;
	}

	public boolean addleft(Bone b) {

		if (leftSide.isEmpty()) {
			if (rightSide.isEmpty()) {

				if (firstBone.x == b.x || firstBone.y == b.x) {
					leftSide.add(b);
					leftSide.get(leftSide.size() - 1).setDirection(2);
					boneNumber++;
					return true;
				} else if (firstBone.x == b.y || firstBone.y == b.y) {
					leftSide.add(b);
					leftSide.get(leftSide.size() - 1).setDirection(1);
					boneNumber++;
					return true;
				}
			} else if (rightSide.get(0).direction == 1) {
				if (rightSide.get(0).x == firstBone.x) {
					if (firstBone.x == b.x) {
						leftSide.add(b);
						leftSide.get(leftSide.size() - 1).setDirection(2);
						boneNumber++;
						return true;
					} else if (firstBone.x == b.y) {
						leftSide.add(b);
						leftSide.get(leftSide.size() - 1).setDirection(1);
						boneNumber++;
						return true;
					}
				} else if (rightSide.get(0).x == firstBone.y) {
					if (firstBone.y == b.x) {
						leftSide.add(b);
						leftSide.get(leftSide.size() - 1).setDirection(2);
						boneNumber++;
						return true;
					} else if (firstBone.y == b.y) {
						leftSide.add(b);
						leftSide.get(leftSide.size() - 1).setDirection(1);
						boneNumber++;
						return true;
					}
				}
			} else if (rightSide.get(0).direction == 2) {
				if (rightSide.get(0).y == firstBone.x) {
					if (firstBone.x == b.x) {
						leftSide.add(b);
						leftSide.get(leftSide.size() - 1).setDirection(2);
						boneNumber++;
						return true;
					} else if (firstBone.x == b.y) {
						leftSide.add(b);
						leftSide.get(leftSide.size() - 1).setDirection(1);
						boneNumber++;
						return true;
					}
				} else if (rightSide.get(0).y == firstBone.y) {
					if (firstBone.x == b.x) {
						leftSide.add(b);
						leftSide.get(leftSide.size() - 1).setDirection(2);
						boneNumber++;
						return true;
					} else if (firstBone.y == b.y) {
						leftSide.add(b);
						leftSide.get(leftSide.size() - 1).setDirection(1);
						boneNumber++;
						return true;
					}
				}
			}
		} else {
			if (leftSide.get(leftSide.size() - 1).direction == 1) {
				if (leftSide.get(leftSide.size() - 1).x == b.x) {
					leftSide.add(b);
					leftSide.get(leftSide.size() - 1).setDirection(2);
					boneNumber++;
					return true;
				} else if (leftSide.get(leftSide.size() - 1).x == b.y) {
					leftSide.add(b);
					leftSide.get(leftSide.size() - 1).setDirection(1);
					boneNumber++;
					return true;
				}
			} else if (leftSide.get(leftSide.size() - 1).direction == 2) {
				if (leftSide.get(leftSide.size() - 1).y == b.x) {
					leftSide.add(b);
					leftSide.get(leftSide.size() - 1).setDirection(2);
					boneNumber++;
					return true;
				} else if (leftSide.get(leftSide.size() - 1).y == b.y) {
					leftSide.add(b);
					leftSide.get(leftSide.size() - 1).setDirection(1);
					boneNumber++;
					return true;
				}
			}
		}

		return false;
	}
}