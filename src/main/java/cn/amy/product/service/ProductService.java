package cn.amy.product.service;

import java.text.ParseException;

import cn.amy.product.entity.*;

public interface ProductService {

	/**
	 * 查询房源信息
	 * @param province
	 * @param createTime
	 * @param predictSum
	 * @return
	 */
	public HouseInfo queryHouseInfo(String province,String createTime,Integer predictSum) throws ParseException;
	
	/**
	 * 查询首页显示的地址图片信息
	 * @return
	 */
	HotCity queryHotCityAll();
}
