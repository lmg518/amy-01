package cn.amy.product.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.amy.product.dao.HotActivityDao;
import cn.amy.product.dao.HotCityDao;
import cn.amy.product.dao.HouseInfoDao;
import cn.amy.product.entity.HotActivity;
import cn.amy.product.entity.HotCity;
import cn.amy.product.entity.HouseInfo;
import cn.amy.product.service.ProductService;

@Service("productService")
public class ProductServiceImpl implements ProductService {

	@Resource
	private HouseInfoDao houseInfoDao;
	
	@Resource
	private HotCityDao hotCityDao;
	
	@Resource
	private HotActivityDao hotActivityDao;
	
	@Override
	public HouseInfo queryHouseInfo(String province, String createTime, Integer predictSum) throws ParseException {
		Date date = null;
		if(createTime != null && !"".equals(createTime)){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			date = sdf.parse(createTime);
		}
		HouseInfo houseInfo = new HouseInfo();
		houseInfo.setProvince(province);
		houseInfo.setCreateTime(date);
		houseInfo.setPredictSum(predictSum);
		return houseInfoDao.selectHouseInfoByProvinceAndTimeAndPredictSum(houseInfo);
	}

	@Override
	public HotCity queryHotCityAll() {
		return hotCityDao.queryHotCityAll();
	}

	@Override
	public HotActivity queryHotActivity() {
		return hotActivityDao.queryHotActivityAll();
	}

}
