package org.game.functions;

import java.util.ArrayList;

public abstract class BoneYard {
	public static ArrayList<Bone> boneYard = new ArrayList<Bone>();

	public static void takeBones() {
		boneYard.clear();
		for (int i = 14; i < 28; i++)
		{		boneYard.add(BonePack.bonePack.get(i));
		BonePack.bonePack.get(i).selectBy(3);
		}
	}
}
