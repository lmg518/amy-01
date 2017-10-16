package cn.amy.product.service;

import java.text.ParseException;
import java.util.List;

import cn.amy.product.entity.HotActivity;
import cn.amy.product.entity.HotCity;
import cn.amy.product.entity.HouseInfo;

public interface ProductService {

	/**
	 * 查询房源信息
	 * @param province
	 * @param createTime
	 * @param predictSum
	 * @return
	 */
	public List<HouseInfo> queryHouseInfo(String province,String createTime,Integer predictSum) throws ParseException;
	
	/**
	 * 查询首页显示的地址图片信息
	 * @return
	 */
	List<HotCity> queryHotCityAll();
	
	/**
	 * 查询热门活动
	 * @return
	 */
	List<HotActivity> queryHotActivity();
}