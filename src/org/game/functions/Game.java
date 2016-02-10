package org.game.functions;

import java.io.IOException;
import java.util.Random;

public abstract class Game {
	public static int playerScore, pcScore, gameNumber, whoStart;
	public static Table table;
	public static String middleBone;

	public static int play(String plDec) throws IOException {

		int winner = 0;
		if (!PcBones.pcBones.isEmpty() && !PlayerBones.playerBones.isEmpty()) {
			if (whoStart % 2 == 0)
				pcNextMove();
			else if (whoStart % 2 != 0)
				playerNextMove(plDec);
			whoStart++;
		}
		if (PcBones.pcBones.isEmpty()) {
			winner = 2;
			updateScore(2, getScore());
		} else if (PlayerBones.playerBones.isEmpty()) {
			winner = 1;
			updateScore(1, getScore());
		}
		return winner;
	}

	public static int getScore() {
		int score = 0;

		return score;
	}

	public static boolean pcNextMove() {

		// put_a_bone_down;
		for (int i = 0; i < PcBones.pcBones.size(); i++) {
			if (table.addleft(PcBones.pcBones.get(i))) {
				PcBones.pcBones.remove(i);
				return true;
			} else if (table.addright(PcBones.pcBones.get(i))) {
				PcBones.pcBones.remove(i);
				return true;
			}

		}
		// if no bone to put down
		while (!BoneYard.boneYard.isEmpty())

		{
			PcBones.pcBones.add(BoneYard.boneYard.get(0));
			BoneYard.boneYard.remove(0);
			if (table.addleft(PcBones.pcBones.get(PcBones.pcBones.size() - 1))) {
				PcBones.pcBones.remove(PcBones.pcBones.size() - 1);
				return true;
			} else if (table.addright(PcBones.pcBones.get(PcBones.pcBones.size() - 1))) {
				PcBones.pcBones.remove(PcBones.pcBones.size() - 1);
				return true;
			}
		}

		return false;

	}

	public static boolean playerNextMove(String plDec) {
		// put_a_bone_down;

		int bid;
		int where;
		int reqBone;
		if (plDec != null) {
			String[] plDecTemp = plDec.split("_");
			bid = Integer.parseInt(plDecTemp[0]);
			where = Integer.parseInt(plDecTemp[1]);
			reqBone = Integer.parseInt(plDecTemp[2]);

			boolean isGood = false;
			while (isGood == false) {
				if (reqBone == 1) {// if no bone to put down
					if (!BoneYard.boneYard.isEmpty()) {
						PlayerBones.playerBones.add(BoneYard.boneYard.get(0));
						BoneYard.boneYard.remove(0);
						bid = PlayerBones.playerBones.get(PlayerBones.playerBones.size() - 1).boneNumber;
						return true;
					} else
						return false;
				}
				if (where != 0)
					if (where == 1) {
						if (table.addleft(PlayerBones.playerBones.get(bid))) {
							PlayerBones.playerBones.remove(bid);
							return true;
						}
					} else if (where == 2) {
						if (table.addright(PlayerBones.playerBones.get(bid))) {
							PlayerBones.playerBones.remove(bid);
							return true;
						}
					}

			}
		}
		return false;
	}

	public static void newGame() throws IOException {
		table = new Table();
		BonePack.shuffle();
		PlayerBones.takeBones();
		PcBones.takeBones();
		BoneYard.takeBones();
		int[] doubles = { 27, 25, 22, 18, 13, 7, 0 };
		if (gameNumber == 0) {
			outOfHere: for (int j = 0; j < 7; j++) {
				for (int i = 0; i < 7; i++) {
					if (PlayerBones.playerBones.get(i).boneNumber == doubles[j]) {
						whoStart = 1;
						table.setFirstBone(PlayerBones.playerBones.get(i));
						PlayerBones.playerBones.remove(i);
						break outOfHere;
					} else if (PcBones.pcBones.get(i).boneNumber == doubles[j]) {
						table.setFirstBone(PcBones.pcBones.get(i));
						PcBones.pcBones.remove(i);
						whoStart = 2;
						break outOfHere;
					}
				}
			}
			if (whoStart == 0) {
				Random r = new Random();
				if (r.nextBoolean())
					whoStart = 1;
				else
					whoStart = 2;
			}

			// System.out.println("winner: " + play());

		}
	}

	public static void newRound() {
		playerScore = 0;
		pcScore = 0;
		gameNumber = 0;
		whoStart = 0;
		PlayerBones.playerBones.clear();
		PcBones.pcBones.clear();
		BoneYard.boneYard.clear();
		BonePack.gBonePack();

	}

	public static void updateScore(int who, int score) {
		if (who == 1)
			playerScore += score;
		else if (who == 2)
			pcScore += score;
	}
}
