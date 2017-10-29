package cn.amy.apply.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.amy.apply.dao.HouseOrderDao;
import cn.amy.apply.entity.HouseOrder;
import cn.amy.apply.service.HouseOrderService;

@Service("houseOrderService")
public class HouseOrderServiceImpl implements HouseOrderService {

	@Resource
	public HouseOrderDao houseOrderDao;
	
	@Override
	public Integer saveHouseOrderSelect(HouseOrder houseOrder) {
		return houseOrderDao.insertSelective(houseOrder);
	}
	
}
