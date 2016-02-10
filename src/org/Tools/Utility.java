package org.Tools;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.LineNumberReader;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public abstract class Utility {
	public static String usersFile = "C:\\Users\\Rares\\eclipse\\jee-mars\\eclipse\\users.txt";

	public static String hashCodeC(String str) throws NoSuchAlgorithmException {
		MessageDigest md = MessageDigest.getInstance("SHA-512");
		md.update(str.getBytes());

		byte byteData[] = md.digest();

		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < byteData.length; i++) {
			sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
		}

		StringBuffer hexString = new StringBuffer();
		for (int i = 0; i < byteData.length; i++) {
			String hex = Integer.toHexString(0xff & byteData[i]);
			if (hex.length() == 1)
				hexString.append('0');
			hexString.append(hex);
		}
		return hexString.toString();
	}

	@SuppressWarnings("resource")
	public static boolean verifyUser(String user) {
		try {
			String verify;

			FileReader fr = new FileReader(usersFile);
			BufferedReader br = new BufferedReader(fr);

			while ((verify = br.readLine()) != null) {
				String us = verify.split("\\s+")[0].trim();
				if (us.equals(user))
					return true;
			}
			br.close();
			fr.close();

		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}

	public static int numberOfUsers() throws IOException {
		LineNumberReader lnr = new LineNumberReader(new FileReader(new File(usersFile)));
		lnr.skip(Long.MAX_VALUE);
		int ret = lnr.getLineNumber();
		lnr.close();
		return ret;
	}

	@SuppressWarnings("resource")
	public static int verifyUser(String user, String pass) {
		try {
			String verify;

			FileReader fr = new FileReader(usersFile);
			BufferedReader br = new BufferedReader(fr);
			int userId = 0;
			while ((verify = br.readLine()) != null) {
				String us = verify.split("\\s+")[0].trim();
				String ps = verify.split("\\s+")[1].trim();
				userId++;
				if (us.equals(user) && ps.equals(pass))
					return userId;
			}
			br.close();
			fr.close();

		} catch (IOException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public static boolean addUser(String user, String pass) throws NoSuchAlgorithmException {
		String pCript = hashCodeC(pass);
		boolean succes = false;
		if (verifyUser(user))
			return false;
		try {

			FileWriter fw = new FileWriter(usersFile, true);
			PrintWriter pw = new PrintWriter(fw);
			pw.println(user + " " + pCript);
			pw.close();
			succes = true;
		} catch (IOException e) {
			e.printStackTrace();
		}
		if (succes)
			return true;
		else
			return false;
	}
}
