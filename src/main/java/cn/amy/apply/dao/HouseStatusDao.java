package cn.amy.apply.dao;

import java.util.List;

import cn.amy.apply.entity.HouseStatus;


public interface HouseStatusDao {
	
	
	//查询所有的房源状态信息   按照房源id 查询
	List<HouseStatus> findObjects(int id);

}
