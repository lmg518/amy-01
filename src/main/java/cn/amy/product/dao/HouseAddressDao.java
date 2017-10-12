package cn.amy.product.dao;

import cn.amy.product.dao.mapper.HouseAddressMapper;
import cn.amy.product.entity.HouseAddress;

public interface HouseAddressDao extends HouseAddressMapper {

	/**
	 * 查询首页地区图片信息
	 * @return
	 */
	HouseAddress queryHouseAddressAll();
}
