package cn.amy.product.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.amy.product.dao.HouseInfoDao;
import cn.amy.product.entity.HouseInfo;
import cn.amy.product.service.ProductService;

@Service("productService")
public class ProductServiceImpl implements ProductService {

	@Resource
	private HouseInfoDao houseInfoDao;
	
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

}
