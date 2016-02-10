package org.game.functions;

import java.io.IOException;

public class Main {

	public static void main(String[] args) throws IOException {
	/// BonePack b=new BonePack();
		// PlayerBones p=new PlayerBones();
	/*	BonePack.shuffle();
		PlayerBones.takeBones();
		PcBones.takeBones();
		BoneYard.takeBones();
		for (int i = 0; i < PlayerBones.playerBones.size(); i++)
			System.out.println(PlayerBones.playerBones.get(i).toString());

		System.out.println();
		System.out.println();
		for (int i = 0; i < PcBones.pcBones.size(); i++)
			System.out.println(PcBones.pcBones.get(i).toString());

		System.out.println();
		System.out.println();
		for (int i = 0; i < BoneYard.boneYard.size(); i++)
			System.out.println(BoneYard.boneYard.get(i).toString());
/*
		Table t = new Table();
		t.setFirstBone(PlayerBones.playerBones.get(0));
		for (int i = 1; i < PlayerBones.playerBones.size(); i++)
			System.out.println(t.addleft(PlayerBones.playerBones.get(i)));
		
		for (int i = 0; i < PcBones.pcBones.size(); i++)
			System.out.println(t.addright(PcBones.pcBones.get(i)));
		
		for(int i=t.leftSide.size()-1;i>=0;i--)
			System.out.println(t.leftSide.get(i).toString());
		System.out.println(t.firstBone.toString());
		for(int i=0;i<t.rightSide.size();i++)
			System.out.println(t.rightSide.get(i).toString());
		
		*/BonePack.gBonePack();
		Game.newRound();
		Game.newGame();
		
	
		
	}

}
