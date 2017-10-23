package cn.amy.util;

import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import cn.amy.common.ServiceException;

public class MD2Util {

	/**
	 * 密码加密
	 * 
	 * @param data
	 * @param key
	 * @return
	 * @throws InvalidKeyException
	 * @throws NoSuchAlgorithmException
	 */
	public static String HMAC_SHA1_ENCODE(byte[] data, byte[] key){
		String HMAC_SHA1 = "HmacSHA1";
		SecretKeySpec signingKey = new SecretKeySpec(key, HMAC_SHA1);
		Mac mac = null;
		try {
			mac = Mac.getInstance(HMAC_SHA1);
		} catch (NoSuchAlgorithmException e) {
			throw new ServiceException("密码加密出现错误", false);
		}
		try {
			mac.init(signingKey);
		} catch (InvalidKeyException e) {
			throw new ServiceException("密码加密出现错误", false);
		}
		byte[] rawHmac = mac.doFinal(data);
		return MD5.encode(rawHmac);
	}
}
