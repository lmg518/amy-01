package cn.amy.product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//首页
@Controller
public class IndexController {
		
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
	

}
