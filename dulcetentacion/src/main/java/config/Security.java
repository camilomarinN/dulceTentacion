package config;

import java.security.MessageDigest;
import java.util.Arrays;
import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

public class Security {

	private final String MASTERKEY = "DulceTentacionPPI507";
	
	public Security() {
		
	}
	
	private SecretKeySpec obtainKey(String key) {
		try {
			byte [] capsule = key.getBytes("UTF-8");
			MessageDigest md = MessageDigest.getInstance("SHA-1");
			capsule = md.digest(capsule);
			capsule = Arrays.copyOf(capsule, 16);
			SecretKeySpec secretKey = new SecretKeySpec(capsule, "AES");
			return secretKey;
		} catch (Exception e) {
			System.out.println("Error de seguridad - Fallo generación de llave | obtainKey - Error: "+ e.getMessage());
			return null;
		}
	}
	
	public String EncryptToAES(String toEncrypt) {
		
		try {
			SecretKeySpec secretKey = obtainKey(MASTERKEY);
			Cipher cipher = Cipher.getInstance("AES");
			cipher.init(Cipher.ENCRYPT_MODE, secretKey);
			
			byte [] capsule = toEncrypt.getBytes("UTF-8");
			byte [] EncryptedString = cipher.doFinal(capsule);
			String Encrypt = Base64.getEncoder().encodeToString(EncryptedString).replaceAll("=", "");
	
			return Encrypt;
		} catch (Exception e) {
			System.out.println("Error de seguridad - Fallo encriptado de datos | EncryptToAES - Error: "+ e.getMessage());
			
			return null;
		}
	}
	
	public String DecryptToAES(String toDecrypt) {
		
		try {
			SecretKeySpec secretKey = obtainKey(MASTERKEY);
			Cipher cipher = Cipher.getInstance("AES");
			cipher.init(Cipher.DECRYPT_MODE, secretKey);
			
			while (toDecrypt.length() % 4 != 0) {
	            toDecrypt += "=";
	        }
			
			byte [] capsule = Base64.getDecoder().decode(toDecrypt);
			byte [] DecryptedString = cipher.doFinal(capsule);
			String Decrypt = new String (DecryptedString, "UTF-8");
			
			return Decrypt;
		} catch (Exception e) {
			System.out.println("Error de seguridad - Fallo desencriptado de datos | DecryptToAES - Error: "+ e.getMessage());
			
			return null;
		}
	}
}
