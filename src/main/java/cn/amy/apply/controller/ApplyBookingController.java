package cn.amy.apply.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.amy.apply.entity.HouseOrder;
import cn.amy.apply.service.HouseOrderService;
import cn.amy.product.entity.HouseInfo;
import cn.amy.product.entity.PriceCalendar;
import cn.amy.product.service.PriceCalendarService;
import cn.amy.product.service.ProductService;
import cn.amy.user.controller.LoginController;
import cn.amy.util.DateUtil;
import net.sf.json.JSONObject;

//申请预订页面
@Controller
public class ApplyBookingController {
	private static final Logger logger = LoggerFactory.getLogger(ApplyBookingController.class);
//	@Resource
//	private HouseStatusServiceImpl houseStatusServiceImpl;
	
	@Resource	
	private ProductService productService;
	
	@Resource
	private PriceCalendarService priceCalendarService;
	
	@Resource
	private HouseOrderService houseOrderService;
	
	
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
	/**
	 * 点击申请预定
	 * 1.
	 * @param model
	 * @param stay_num
	 * @param begin_date
	 * @param end_date
	 * @param userName
	 * @param IDNum
	 * @param house_info_id
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping("apply_booking.do")
	public String apply_booking(HttpSession httpSession,Model model,Integer stayNum,String begin_date,
			String end_date,String userName,String IDNum,String house_info_id) throws ParseException{
		String phone = httpSession.getAttribute("userName").toString();
		//生成订单号，显示订单的信息
		System.out.println("----stay_num---->"+stayNum);
		System.out.println("----begin_date---->"+begin_date);
		System.out.println("----end_date---->"+end_date);
		System.out.println("----userName---->"+userName);
		System.out.println("----IDNum---->"+IDNum);
		System.out.println("----id---->"+house_info_id); //房源id
		
		//获取房源信息
		HouseInfo houseinfo = productService.showHouseInfo(house_info_id);
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date d1=sdf.parse(begin_date);
		Date d2 = sdf.parse(end_date);
		
		/*
		 * 根据开始日期和结束日期查询期间段的价格
		 */
		BigDecimal priceSum = BigDecimal.ZERO;
		List<PriceCalendar> pcs = priceCalendarService.queryPriceCalendarByStartEndTime(house_info_id,d1, d2,"N");
		if(pcs != null && pcs.size() != 0){
			for(int i=0;i<pcs.size();i++){
				priceSum = priceSum.add(pcs.get(i).getPrice());
			}
		}
		
		
		PriceCalendar p1=new PriceCalendar();
		p1.setDateTime(d1);
		p1.setHouseInfoId(house_info_id);
		//保存订单信息
		HouseOrder houseOrder = new HouseOrder();
		houseOrder.setOrderId(UUID.randomUUID().toString());
		houseOrder.setHouseInfoId(house_info_id);
		LocalDateTime localDate = LocalDateTime.now();
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
		StringBuilder orderNum = new StringBuilder();;
		Random random = new Random();
		orderNum.append(localDate.format(dtf)).append(System.currentTimeMillis())
			.append(random.nextInt(10)).append(random.nextInt(10)).append(random.nextInt(10));
		houseOrder.setOrderNum(orderNum.toString());//年月日时分秒+时间戳+3位随机数
		houseOrder.setTotalPrice(priceSum);
		houseOrder.setDeposit(null);
		houseOrder.setCoupons(null);
		houseOrder.setHouseDeposit(null);
		houseOrder.setPayPrice(null);
		houseOrder.setBeginDate(d1);
		houseOrder.setEndDate(d2);
		houseOrder.setStayDays(DateUtil.differentDays(d1, d2));
		houseOrder.setStayId(userName);
		houseOrder.setStayPhone(phone);
		houseOrder.setRoomNum(1);
		houseOrder.setStayNum(stayNum);
		houseOrder.setOrderStatus("已提交");//已提交、已完成
		houseOrder.setPayStatus("未支付");//未支付、已支付
		houseOrder.setCreateTime(new Date());
		houseOrder.setPayTime(null);
		Integer status = houseOrderService.saveHouseOrderSelect(houseOrder);
		if(status>0){//如果订单表更新成功，更新日期表
			logger.info("保存订单表成功：{}",houseOrder.toString());
			//找到要修改的预订价格日历数据
			/*PriceCalendar pc=productService.findByHouseInfoIdAndDateTime(p1);
			pc.setStatus("Y"); //修改价格日历中 房源状态   默认：N未预订  Y:已预订  W:已入住
			productService.updateByPrimaryKeySelective(pc);  //修改价格日历中状态
*/			/*
			 * 更新日历价格表（开始日期、结束日期、房源编号、状态）
			 */
			Integer flag = priceCalendarService.updatePriceCalendarByStartEndTime(house_info_id, d1, d2, "N");
			logger.info("更新日历价格表成功条数：{}", flag);
		}
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

	
	public static void main(String[] args) {
		LocalDateTime localDate = LocalDateTime.now();
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
		System.out.println(localDate.format(dtf));
	}
	
	
}
