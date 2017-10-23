package cn.amy.user.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

import cn.amy.user.entity.User;
import cn.amy.user.service.UserService;

@Controller
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Resource
	private UserService userService;
	
	@RequestMapping("/loginPage")
	public String loginPage(){
		return "/system/login";
	}

	@ResponseBody
	@RequestMapping(value="/login",produces="text/html;charset=utf-8")  
	public String clientLogin(HttpSession httpSession,String userName,String password){  
		User user = userService.selectByPhone(userName);
		JSONObject obj = new JSONObject();
		if(user == null){
			obj.put("success", false);
			obj.put("message", "您的手机号未注册，注册之后再来吧！");
			return JSON.toJSONString(obj);
		}
		//用户登录service
		if(userService.userLoginService(userName,password)){  
	        //登陆成功  
			httpSession.setAttribute("consoleRole","CUST_PERSON");
	        httpSession.setAttribute("userName",userName);  
	        obj.put("success", true);
	        logger.info("用户登录成功；用户名：{}；密码：{}",userName,password);
	    }else{  
	        //登陆失败
	    	obj.put("success", false);
	    	obj.put("message", "用户名或密码错误");
	    	logger.info("用户登录失败；用户名：{}；密码：{}",userName,password);
	    }  
		return obj.toJSONString();
	} 
}
