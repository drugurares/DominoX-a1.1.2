package org.game.functions;

import java.util.ArrayList;
import java.util.Collections;

public abstract class BonePack {
	public static ArrayList<Bone> bonePack;

	public static void gBonePack() {
		bonePack = new ArrayList<Bone>();
		int k = 0;
		for (int i = 0; i <= 6; i++)
			for (int j = i; j <= 6; j++) {
				bonePack.add(new Bone(i, j, k));
				k++;
			}
	}

	public static void shuffle() {
		if (bonePack != null)
			Collections.shuffle(bonePack);
	}
}
