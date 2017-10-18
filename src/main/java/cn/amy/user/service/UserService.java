package cn.amy.user.service;

import cn.amy.user.entity.CustPerson;
import cn.amy.user.entity.User;

public interface UserService {
	
	//保存用户
	void saveUser(User user);
	//查询房东
    CustPerson findlandlordById(String landlord_id);

}
