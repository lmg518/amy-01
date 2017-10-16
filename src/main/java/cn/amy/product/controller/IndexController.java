package cn.amy.product.controller;

import java.text.ParseException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

import cn.amy.product.entity.HotActivity;
import cn.amy.product.entity.HotCity;
import cn.amy.product.entity.HouseInfo;
import cn.amy.product.service.ProductService;

//首页
@Controller
public class IndexController {
	
	@Resource	
	private ProductService productService;
	
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
	
	
	//房源1
	@RequestMapping("show1")
	public String show1(){
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
