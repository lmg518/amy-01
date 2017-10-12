package cn.amy.product.service;

import java.text.ParseException;

import cn.amy.product.entity.HouseInfo;

public interface ProductService {

	/**
	 * 查询房源信息
	 * @param province
	 * @param createTime
	 * @param predictSum
	 * @return
	 */
	public HouseInfo queryHouseInfo(String province,String createTime,Integer predictSum) throws ParseException;
	
	
}
