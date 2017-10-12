package cn.amy.product.dao;

import cn.amy.product.dao.mapper.HotCityMapper;
import cn.amy.product.entity.HotCity;

public interface HotCityDao extends HotCityMapper {

	/**
	 * 查询首页地区图片信息
	 * @return
	 */
	HotCity queryHotCityAll();
}
