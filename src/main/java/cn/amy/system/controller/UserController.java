package cn.amy.system.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.amy.system.entity.User;
import cn.amy.system.service.impl.UserServiceImpl;

@Controller
public class UserController {
	@Resource
	private UserServiceImpl userServiceImpl;
	/**
	 * 跳转到用户编辑页面（新增/修改）
	 */
	@RequestMapping("editUserUI")
	public String editUser(){
		return "system/user_edit";
	}
	@RequestMapping("saveUser")
	@ResponseBody
	public Map<String,String> saveUser(String name,String phone,String password){
		if("".equals(name) && "".equals(phone) && "".equals(password)) {
			return null;
		}else {
			User u=new User();
			u.setName(name);
			u.setPassword(password);
			u.setPhone(phone);
			userServiceImpl.saveUser(u);
			
			System.out.println(u);
			
			Map<String,String> map=new HashMap<String,String>();
			map.put("state", "SUCCESS");
			return map;
		}
	}
	
}
