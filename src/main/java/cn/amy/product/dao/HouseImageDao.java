package cn.amy.product.dao;

import java.util.List;

import cn.amy.product.dao.mapper.HouseImageMapper;
import cn.amy.product.entity.HouseImage;

public interface HouseImageDao extends HouseImageMapper{

	/**
	 * 根据房源id  查找图片集
	 * @param house_info_id
	 * @return
	 */
	List<HouseImage> showHouseInfo(String house_info_id);
}
