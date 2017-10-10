package cn.amy.system.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.amy.system.dao.UserDao;
import cn.amy.system.entity.User;
import cn.amy.system.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	
	@Resource
	private UserDao userDao;
	
	

	@Override
	public void saveUser(User user) {
		userDao.save(user);
	}

}
