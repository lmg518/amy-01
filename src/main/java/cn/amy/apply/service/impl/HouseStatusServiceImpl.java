package cn.amy.apply.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.amy.apply.dao.HouseStatusDao;
import cn.amy.apply.entity.HouseStatus;
import cn.amy.apply.service.HouseStatusService;

@Service
public class HouseStatusServiceImpl implements HouseStatusService {

	@Resource
	private HouseStatusDao houseStatusDao;
	
	@Override
	public List<HouseStatus> findObjects(String id) {
		
		return houseStatusDao.findObjects(id);
	}

}
