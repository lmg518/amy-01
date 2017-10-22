package cn.amy.apply.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.amy.apply.entity.HouseStatus;
import cn.amy.product.entity.HouseInfo;
import cn.amy.product.entity.PriceCalendar;
import cn.amy.product.service.ProductService;
import net.sf.json.JSONObject;

//申请预订页面
@Controller
public class ApplyBookingController {
	
//	@Resource
//	private HouseStatusServiceImpl houseStatusServiceImpl;
	
	@Resource	
	private ProductService productService;
	
	
	//跳转页面的路由  预订首页
	@RequestMapping("apply_book.do")
	public String apply_book(Model model,String house_info_id){
		System.out.println("-----id2------>"+house_info_id);
		 HouseInfo houseinfo = productService.showHouseInfo(house_info_id);
		 model.addAttribute("houseinfo", houseinfo);   //房源信息
		 return "apply/apply_book";
	}
	
	//订单详情页面   点击申请预订之后 跳转到订单详情页面
	@RequestMapping("order.do")
	public String order_write(){
		return "apply/order";
	}
	
	//点击申请预订 
	@RequestMapping("apply_booking.do")
	public String apply_booking(Model model,String stay_num,String begin_date,
			String end_date,String userName,String IDNum,String house_info_id) throws ParseException{
		//生成订单号，显示订单的信息
		System.out.println("----stay_num---->"+stay_num);
		System.out.println("----begin_date---->"+begin_date);
		System.out.println("----end_date---->"+end_date);
		System.out.println("----userName---->"+userName);
		System.out.println("----IDNum---->"+IDNum);
		System.out.println("----id---->"+house_info_id); //房源id
		
		//获取房源信息
		HouseInfo houseinfo = productService.showHouseInfo(house_info_id);
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date d1=sdf.parse(begin_date);
		PriceCalendar p1=new PriceCalendar();
		p1.setDateTime(d1);
		p1.setHouseInfoId(house_info_id);
		
		//找到要修改的预订价格日历数据
		PriceCalendar pc=productService.findByHouseInfoIdAndDateTime(p1);
		pc.setStatus("Y"); //修改价格日历中 房源状态   默认：N未预订  Y:已预订  W:已入住
		productService.updateByPrimaryKeySelective(pc);  //修改价格日历中状态
		
		
		
		model.addAttribute("houseinfo", houseinfo);   //房源信息
		
		
		return "apply/order";
	}
	
	//定金支付页面
	@RequestMapping("pay_money.do")
	public String pay_money(){
		return "apply/pay_money";
	}
	
	
	
	
	
	
	//返回json数据的路由   
	@RequestMapping("findHouseById.do")
	//@ResponseBody    //返回json 不能使用
	public void findHouseById(HttpServletRequest request,HttpServletResponse response,String house_info_id){
		
		System.out.println("--------house_info_id---->>>"+house_info_id);
		PriceCalendar p1=new PriceCalendar();
		//p1.setHouseInfoId(house_info_id);
		p1.setHouseInfoId("1"); //先只查询房源id为1的
		p1.setStatus("N");  //只查询状态为N的
		List<PriceCalendar> list=productService.findAllPriceCalendar(p1);  //查询房源id=1  
		//封装酒店预订价格日历
		try {  
	        response.setContentType("text/plain");  
	        response.setHeader("Pragma", "No-cache");  
	        response.setHeader("Cache-Control", "no-cache");  
	        response.setDateHeader("Expires", 0);  
	        Map<String,Object> map = new HashMap<String,Object>(); 
	        
	        //转换格式
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			
	        for(PriceCalendar hs:list){
	        	Map<String,String> m1=new HashMap<String,String>();
	        	m1.put("price", hs.getPrice().toString());
	        	m1.put("roomNum", hs.getRoomNum().toString());
	        	map.put(sdf.format(hs.getDateTime()), m1);
	        }
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
