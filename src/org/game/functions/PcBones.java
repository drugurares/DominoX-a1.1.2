package org.game.functions;

import java.util.ArrayList;

public abstract class PcBones {
	public static ArrayList<Bone> pcBones = new ArrayList<Bone>();

	public static void takeBones() {
		pcBones.clear();
		for (int i = 7; i < 14; i++) {
			pcBones.add(BonePack.bonePack.get(i));
			BonePack.bonePack.get(i).selectBy(2);
		}
	}
}
