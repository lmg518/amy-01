package cn.amy.user.dao;

import java.util.HashMap;

import cn.amy.user.dao.mapper.UserMapper;
import cn.amy.user.entity.User;

public interface UserDao extends UserMapper{
	
	int save(User u);
	
	/**
	 * 通过手机号查询用户
	 * @param phone
	 * @return
	 */
	User selectUserByPhone(String phone);

	/**
	 * 用户名和密码查询用户
	 * @param userName
	 * @param password
	 * @return
	 */
	User queryUserByUserNameAndPassword(HashMap<String,String> map);
}
