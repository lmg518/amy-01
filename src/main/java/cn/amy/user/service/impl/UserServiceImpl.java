package cn.amy.user.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.amy.user.dao.UserDao;
import cn.amy.user.entity.User;
import cn.amy.user.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {
	
	@Resource
	private UserDao userDao;
	
	

	@Override
	public void saveUser(User user) {
		userDao.insertSelective(user);
	}

}
