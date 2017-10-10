package cn.amy.apply.service;

import java.util.List;

import cn.amy.apply.entity.HouseStatus;

public interface HouseStatusService {
	//查询所有的房源信息
	List<HouseStatus> findObjects(int id);

}
