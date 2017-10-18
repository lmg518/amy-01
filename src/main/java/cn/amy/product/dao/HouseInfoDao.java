package cn.amy.product.dao;

import java.util.List;

import cn.amy.product.dao.mapper.HouseInfoMapper;
import cn.amy.product.entity.HouseInfo;

public interface HouseInfoDao extends HouseInfoMapper{

	List<HouseInfo> selectHouseInfoByProvinceAndTimeAndPredictSum(HouseInfo houseInfo);
	/**
	 * 根据house_info_id查询
	 * @param house_info_id
	 * @return
	 */
	HouseInfo showHouseInfo(String house_info_id);
}
