package cn.amy.product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MapController {

	@RequestMapping("map.do")
	public String city(){
		return "/house/map";
	}
}
