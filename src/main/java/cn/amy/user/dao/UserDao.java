package cn.amy.user.dao;

import cn.amy.user.dao.mapper.UserMapper;
import cn.amy.user.entity.User;

public interface UserDao extends UserMapper{
	
	int save(User u);

}
