package org.game.functions;

import java.util.ArrayList;
import java.util.Scanner;

public abstract class PlayerBones {
	public static ArrayList<Bone> playerBones = new ArrayList<Bone>();

	public static void takeBones() {
		playerBones.clear();
		for (int i = 0; i < 7; i++) {
			playerBones.add(BonePack.bonePack.get(i));
			BonePack.bonePack.get(i).selectBy(1);
		}
	}

	public static int xxx = -1;

}
