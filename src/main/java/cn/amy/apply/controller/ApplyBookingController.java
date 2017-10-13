package cn.amy.apply.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.amy.apply.entity.HouseStatus;
import cn.amy.apply.service.impl.HouseStatusServiceImpl;
import net.sf.json.JSONObject;

//申请预订
@Controller
public class ApplyBookingController {
	
	@Resource
	private HouseStatusServiceImpl houseStatusServiceImpl;
	
	//跳转页面的路由  预订首页
	@RequestMapping("apply_book.do")
	public String apply_book(){
		return "apply/apply_book";
	}
	
	//订单填写页面
	@RequestMapping("order_write.do")
	public String order_write(){
		return "apply/order_write";
	}
	
	//定金支付页面
	@RequestMapping("pay_money.do")
	public String pay_money(){
		return "apply/pay_money";
	}
	
	@RequestMapping("apply_booking.do")
	@ResponseBody
	public String apply_booking(String stay_num,String begin_date,String end_date){
		System.out.println(stay_num);
		System.out.println(begin_date);
		System.out.println(end_date);
		return "ok";
	}
	
	
	
	
	//返回json数据的路由   
	@RequestMapping("findHouseById.do")
	//@ResponseBody    //返回json
	public void findHouseById(HttpServletRequest request,HttpServletResponse response){
		List<HouseStatus> list=houseStatusServiceImpl.findObjects("1");
		System.out.println("-----1---->"+list);
		//封装酒店预订价格日历
//		m1.put("price", "298");
//		m1.put("roomNum", "5");
//		System.out.println(m1);
		try {  
	        response.setContentType("text/plain");  
	        response.setHeader("Pragma", "No-cache");  
	        response.setHeader("Cache-Control", "no-cache");  
	        response.setDateHeader("Expires", 0);  
	        Map<String,Object> map = new HashMap<String,Object>(); 
	        
	        //转换格式
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			
	        for(HouseStatus hs:list){
	        	Map<String,String> m1=new HashMap<String,String>();
	        	m1.put("price", hs.getPrice().toString());
	        	m1.put("roomNum", hs.getRow_num().toString());
	        	map.put(sdf.format(hs.getDate_time()), m1);
	        }
	        System.out.println("----2------"+map);
	        
//	        map.put("2017-10-01", m1);
//	        map.put("2017-10-02", m1);
//	        map.put("2017-10-03", m1);
//	        map.put("2017-10-04", m1);
//	        map.put("2017-10-05", m1);
//	        map.put("2017-10-06", m1);
//	        map.put("2017-10-07", m1);
	        
	        PrintWriter out = response.getWriter();       
	        JSONObject resultJSON = JSONObject.fromObject(map); //根据需要拼装json  
	        String callback = request.getParameter("callback");//客户端请求参数  
	        System.out.println("===========>"+callback);
	        out.println(callback+"("+resultJSON.toString(1,1)+")");//返回jsonp格式数据  
	        out.flush();  
	        out.close();  
	      } catch (IOException e) {  
	       e.printStackTrace();  
	      }  
	}

}
