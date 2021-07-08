package com.it15301.utilities;

import org.mindrot.jbcrypt.BCrypt;
//mã hóa password người dùng 
public class HashUtil {
	public static String hash(String plain) {
		String salt= BCrypt.gensalt();		
		return BCrypt.hashpw(plain, salt);
	}
	//kiểm tra chuỗi gốc có phù hợp với chuỗi mã hóa
	public static boolean verify(String plain,String hashed) {
		return BCrypt.checkpw(plain, hashed);
	}
}
