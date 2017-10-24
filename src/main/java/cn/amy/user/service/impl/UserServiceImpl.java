package cn.amy.user.service.impl;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.UUID;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import cn.amy.common.ServiceException;
import cn.amy.user.dao.CustPersonDao;
import cn.amy.user.dao.UserDao;
import cn.amy.user.entity.CustPerson;
import cn.amy.user.entity.User;
import cn.amy.user.service.UserService;
import cn.amy.util.MD2Util;

@Service("userService")
public class UserServiceImpl implements UserService {
	private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);
	
	@Resource
	private UserDao userDao;
	@Resource
	private CustPersonDao custPersonDao;
	
	

	@Override
	public void saveUser(User user) {
		userDao.insertSelective(user);
	}



	@Override
	public CustPerson findlandlordById(String landlord_id) {
		return custPersonDao.findlandlordById(landlord_id);
	}



	@Override
	public CustPerson selectByPrimaryKey(String landlord_id) {
		return custPersonDao.selectByPrimaryKey(landlord_id);
	}



	@Override
	public User selectByPhone(String phone) {
		return userDao.selectUserByPhone(phone);
	}



	@Override
	public Boolean userLoginService(String userName, String password) {
		try {
			password = MD2Util.HMAC_SHA1_ENCODE(password.toString().getBytes("UTF-8"), "1234567".toString().getBytes("UTF-8"));
			HashMap<String,String> map = new HashMap<String,String>();
			map.put("userName", userName);
			map.put("password", password);
			User user = userDao.queryUserByUserNameAndPassword(map);
			logger.info("用户名为{}的用户登录，密码为：{}，登录信息为：{}",userName,password, user != null?user.toString():"null");
			if(user!=null){
				return true;
			}
		} catch (UnsupportedEncodingException e) {
			throw new ServiceException("加密错误", false);
		}
		return false;
	}



	/**
	 * 用户注册，保存注册信息
	 */
	@Override
	public Integer userRegisterService(String userName, String password) {
		Integer status = 0;
		try {
			password = MD2Util.HMAC_SHA1_ENCODE(password.toString().getBytes("UTF-8"), "1234567".toString().getBytes("UTF-8"));
			User user = new User();
			user.setUserId(UUID.randomUUID().toString());
			user.setUserName(userName);
			user.setPhone(userName);
			user.setPassword(password);
			user.setInvitationCode("无");
			status = userDao.insertSelective(user);
		} catch (UnsupportedEncodingException e) {
			throw new ServiceException("加密错误", false);
		}
		return status;
	}

}
