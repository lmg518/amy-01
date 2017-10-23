package cn.amy.util;

/** 
 * MD5算法 
 */  
public class MD5 {  
	private static String pre="brainlong.";
	private static String post=".com";

    /** 
     * 获取MD5 结果字符串 
     *  
     * @param source 
     * @return 
     */  
    public static String encode(byte[] source) {  
        char hexDigits[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f' };  
        return encode(source,hexDigits);  
    }  
     
    private static String encode(byte[] source,char[] hexDigits) {
    		String s = null;  
        try {  
            java.security.MessageDigest md = java.security.MessageDigest.getInstance("MD5");  
            md.update(source);  
            byte tmp[] = md.digest();   
            char str[] = new char[16 * 2];   
            int k = 0;   
            for (int i = 0; i < 16; i++) {   
                byte byte0 = tmp[i];   
                str[k++] = hexDigits[byte0 >>> 4 & 0xf];   
                str[k++] = hexDigits[byte0 & 0xf];   
            }  
            s = new String(str);   
        } catch (Exception e) {  
            e.printStackTrace();  
            throw new RuntimeException("错误！！！", e);
        }  
        return s;  
    }
    public static String getMD5(String source) {  
        return (source == null || "".equals(source)) ? "" : encode(source.getBytes());  
    } 
    public static String getPasswordHash(String source) {  
        if (source == null || "".equals(source)) {
        		return "";
        }
        char hexDigits[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F' };  
        
        return encode((pre+source+post).getBytes(),hexDigits);  
    }  
    
    public static void main(String[] args) {
    		System.out.println(MD5.getPasswordHash("123456"));
    }
}  