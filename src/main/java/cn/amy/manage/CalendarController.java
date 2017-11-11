package cn.amy.manage;

import java.text.ParseException;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import cn.amy.product.entity.HouseInfo;
import cn.amy.product.entity.PriceCalendar;
import cn.amy.product.service.PriceCalendarService;
import cn.amy.product.service.ProductService;
import cn.amy.util.JsonResult;

//房源价格日历管理
@Controller
@RequestMapping("/calendar")
public class CalendarController {
	
	@Resource
	private PriceCalendarService priceCalendarService;
	@Resource
	private ProductService productService;
	//首页
	@RequestMapping("listUI.do")
	public String listUI(){
		return "manage/calendar/calendar_list";
	}
	//新增，修改页面 
	@RequestMapping("editUI.do")
	public String pay_money(){
		return "manage/calendar/calendar_edit";
	}
	
	//查询所有的房源价格
	@RequestMapping("findAllObjects")
	@ResponseBody
	public JsonResult doFindProjects() throws ParseException{
		
		PriceCalendar p1=new PriceCalendar();
		p1.setHouseInfoId("1"); //先只查询房源id为1的
		List<PriceCalendar> list=productService.findAllPriceCalendar(p1);  //查询房源id=1 
		System.out.println("list---->="+list.get(0));
	    Object obj=new JsonResult(list);
		System.out.println("project---->="+obj);
		return new JsonResult(list);
	}
	
	
	

}
