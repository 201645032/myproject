import java.math.BigInteger;
import java.security.Key;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.Signature;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.RSAPrivateKeySpec;
import javax.crypto.Cipher;
public class Sign {
	
	private static KeyPairGenerator keyPairGen;
	private static KeyPair keyPair;
	private static PublicKey publicKey;
	private static PrivateKey privateKey;
	
	/**
	 * keySize에 해당하는 키 길이로 RSA 키쌍을 생성함.
	 * @param keySize
	 * @return
	 */
	public static KeyPair generateRsaKeyPair(int keySize) {
		KeyPair keys = null;
		try {
			
			// RSA 암호화 알고리즘, key 길이는 2048bit로 설정
			keyPairGen = KeyPairGenerator.getInstance("RSA");
			keyPairGen.initialize(keySize);
			// 공개키 및 개인키 생성
			keyPair = keyPairGen.genKeyPair();
			publicKey = keyPair.getPublic();		// 공개키
			privateKey = keyPair.getPrivate();		// 개인키
			System.out.println("-----------------");
			System.out.println(publicKey.toString());
			System.out.println(privateKey.toString());
			System.out.println("-----------------");
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return keys;
	}
	
	
	/**
	 * 공개키로 평문을 RSA 암호화하는 함수
	 * @param plainText
	 * @return
	 */
	public static byte[] RSAEncrypt(byte[] plainText) {
		
		try {
			Signature sign = Signature.getInstance("SHA256withRSA");
			sign.initSign(privateKey);
			sign.update(plainText);
			return sign.sign();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	/**
	 * 개인키로 평문을 RSA 복호화하는 함수
	 * @param cipherText
	 * @return
	 */
	public static boolean RSADecrypt(byte[] plainText, byte[] cipherText) {
		try {
			Signature sign = Signature.getInstance("SHA256withRSA");
			sign.initVerify(publicKey);
			sign.update(plainText);
			return sign.verify(cipherText);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
}
