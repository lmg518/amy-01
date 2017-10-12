package cn.amy.product.dao;

import cn.amy.product.dao.mapper.HouseInfoMapper;
import cn.amy.product.entity.HouseInfo;

public interface HouseInfoDao extends HouseInfoMapper{

	HouseInfo selectHouseInfoByProvinceAndTimeAndPredictSum(HouseInfo houseInfo); 
}
