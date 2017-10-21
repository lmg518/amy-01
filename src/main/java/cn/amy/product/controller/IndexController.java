package cn.amy.product.controller;

import java.text.ParseException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.amy.product.entity.HotActivity;
import cn.amy.product.entity.HotCity;
import cn.amy.product.entity.HouseImage;
import cn.amy.product.entity.HouseInfo;
import cn.amy.product.service.ProductService;
import cn.amy.user.entity.CustPerson;
import cn.amy.user.service.UserService;

//首页
@Controller
public class IndexController {
	
	@Resource	
	private ProductService productService;
	@Resource
	private UserService userService;
	
	/*@RequestMapping("indexUI")
	public String indexUI(){
		return "index";
	}*/
	//首页搜索条件页面
	@RequestMapping("city.do")
	public String city(){
		return "city";
	}
	@RequestMapping("guest.do")
	public String guest(){
		return "guest";
	}
	@RequestMapping("choose_date.do")
	public String choose_date(){
		return "choose_date";
	}
	
	
	//show详情json  没使用json 使用el 表达式在页面赋值
	@RequestMapping("showHouseInfo")
	public String showHouseInfo(Model model,String house_info_id){
		System.out.println("-----id------>"+house_info_id);
	    HouseInfo houseinfo = productService.showHouseInfo(house_info_id);
	    //获取房源对应的房东  landlord_id
	    String landlord_id=houseinfo.getLandlordId();
	    //找到房东
	    //CustPerson custPerson = userService.findlandlordById(landlord_id);  //有的字段映射不出来 手写的方法 用resultType
	    CustPerson custPerson = userService.selectByPrimaryKey(landlord_id);
	    
	    List<HouseImage> houseImages=productService.findHouseImages(house_info_id); //查询房源的图片集
	    
	    System.out.println(houseinfo.getTitle());
	    model.addAttribute("houseinfo", houseinfo);   //房源信息
	    model.addAttribute("custPerson", custPerson); //房东信息
	    model.addAttribute("houseImages", houseImages); //房源图片集
	    System.out.println("--------headUrl----"+custPerson);
	    
		return "house/show1";
	}
	
	
	/**
	 * 首页显示房源信息
	 * @param httpSession
	 * @param province 省份
	 * @param createTime 房源日期
	 * @param predictSum 预租人数量
	 * @return
	 * @throws ParseException 
	 */
	//@ResponseBody
	@RequestMapping(value="indexUI",produces="text/html;charset=utf-8")
	public String loadHouseInfo(HttpSession httpSession,Model model,String province,String createTime,Integer predictSum) throws ParseException{
		//JSONObject json = new JSONObject();
		//获取房源信息
		List<HouseInfo> houseInfos = productService.queryHouseInfo(province, createTime, predictSum);
		//获取热门城市信息
		List<HotCity> hotCitys = productService.queryHotCityAll();
		//获取热门活动信息
		List<HotActivity> hotActivitys = productService.queryHotActivity();
		model.addAttribute("hotCitys", hotCitys);
		model.addAttribute("hotActivitys", hotActivitys);
		model.addAttribute("houseInfos", houseInfos);
		//json.put("hotCitys", hotCitys);
		//json.put("hotActivitys", hotActivitys);
		//json.put("success", true);
		//json.put("houseInfos", houseInfos);
		return "index";
	}
}
