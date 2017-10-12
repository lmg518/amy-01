package cn.amy.product.controller;

import java.text.ParseException;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

import cn.amy.product.entity.HouseInfo;
import cn.amy.product.service.ProductService;

//首页
@Controller
public class IndexController {
	
	@Resource	
	private ProductService productService;
	
	@RequestMapping("indexUI")
	public String indexUI(){
		return "index";
	}
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
	@ResponseBody
	@RequestMapping("loadHouseInfo")
	public String loadHouseInfo(HttpSession httpSession,String province,String createTime,Integer predictSum) throws ParseException{
		JSONObject json = new JSONObject();
		json.put("success", true);
		HouseInfo houseInfos = productService.queryHouseInfo(province, createTime, predictSum);
		json.put("houseInfos", houseInfos);
		return json.toJSONString();
	}

}
