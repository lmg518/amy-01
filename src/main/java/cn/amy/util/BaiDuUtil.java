package cn.amy.util;


import net.sf.json.JSONObject;
 
/**
 * 百度工具类
 * @author gs
 *
 */
public class BaiDuUtil {

	/**
	 * 百度ak
	 */
	private static final String AK = "jlMaC5VZmtj04AhDFc0ANun9R2yVxfMT";
	
	/**
	 * 根据百度坐标系的经纬度获取地址信息
	 * @param lat
	 * @param lng
	 * @return
	 */
    public static String getLocation(String lat, String lng) {  
    	if(null == lat || "".equals(lat) || "null".equals(lat) || null == lat || "".equals(lat) || "null".equals(lat)){
    		return null;
    	}
    	Gps gps = PositionUtil.Wgs84_To_bd09(Double.parseDouble(lat),Double.parseDouble(lng));
        JSONObject obj = getLocationInfo(String.valueOf(gps.getWgLat()), String.valueOf(gps.getWgLon()))
        		.getJSONObject("result")
                //.getJSONObject("addressComponent")
                ;  
        String add = obj.getString("formatted_address");
        return add.toString();  
    }  
  
    public static JSONObject getLocationInfo(String lat, String lng) {  
        String url = "http://api.map.baidu.com/geocoder/v2/?location=" + lat + ","  
                + lng + "&output=json&ak=" + AK +"&pois=0";  
        JSONObject obj = JSONObject.fromObject(HttpUtil.getRequest(url));  
        return obj;  
    }  
  
    public static void main(String[] args) {  
        System.out.println(BaiDuUtil.getLocation("39.905721972222224", "116.57432597222221"));  
    }  
}
