package cn.amy.product.dao;

import java.util.List;

import cn.amy.product.dao.mapper.HouseInfoMapper;
import cn.amy.product.entity.HouseInfo;

public interface HouseInfoDao extends HouseInfoMapper{

	List<HouseInfo> selectHouseInfoByProvinceAndTimeAndPredictSum(HouseInfo houseInfo); 
}
