package cn.amy.user.dao;

import cn.amy.user.dao.mapper.CustPersonMapper;
import cn.amy.user.entity.CustPerson;

public interface CustPersonDao extends CustPersonMapper {
	
	CustPerson findlandlordById(String landlord_id);

}
