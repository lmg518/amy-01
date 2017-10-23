package cn.amy.user.service;

import cn.amy.user.entity.CustPerson;
import cn.amy.user.entity.User;

public interface UserService {
	
	//保存用户
	void saveUser(User user);
	//查询房东
    CustPerson findlandlordById(String landlord_id);
    CustPerson selectByPrimaryKey(String landlord_id);
    
    /**
     * 手机号查询用户
     * @param phone
     * @return
     */
    User selectByPhone(String phone);
    
    /**
     * 通过用户名和密码判断是否正确
     * @param userName
     * @param password
     * @return
     */
    Boolean userLoginService(String userName,String password);

}
