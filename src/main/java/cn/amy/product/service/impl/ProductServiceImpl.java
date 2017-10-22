package cn.amy.product.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.amy.product.dao.HotActivityDao;
import cn.amy.product.dao.HotCityDao;
import cn.amy.product.dao.HouseImageDao;
import cn.amy.product.dao.HouseInfoDao;
import cn.amy.product.dao.PriceCalendarDao;
import cn.amy.product.entity.HotActivity;
import cn.amy.product.entity.HotCity;
import cn.amy.product.entity.HouseImage;
import cn.amy.product.entity.HouseInfo;
import cn.amy.product.entity.PriceCalendar;
import cn.amy.product.service.ProductService;

@Service("productService")
public class ProductServiceImpl implements ProductService {

	@Resource
	private HouseInfoDao houseInfoDao;
	
	@Resource
	private HotCityDao hotCityDao;
	
	@Resource
	private HotActivityDao hotActivityDao;
	
	@Resource
	private HouseImageDao houseImageDao;  //房源图片集接口
	
	@Resource
	private PriceCalendarDao priceCalendarDao;  //价格日历接口
	
	@Override
	public List<HouseInfo> queryHouseInfo(String province, String createTime, Integer predictSum) throws ParseException {
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

	@Override
	public List<HotCity> queryHotCityAll() {
		return hotCityDao.queryHotCityAll();
	}

	@Override
	public List<HotActivity> queryHotActivity() {
		return hotActivityDao.queryHotActivityAll();
	}

	@Override
	public HouseInfo showHouseInfo(String house_info_id) {
		return houseInfoDao.showHouseInfo(house_info_id);
	}

	@Override
	public List<HouseImage> findHouseImages(String house_info_id) {
		return houseImageDao.showHouseInfo(house_info_id);
	}

	@Override
	public List<PriceCalendar> findAllPriceCalendar(PriceCalendar priceCalendar) {
		return priceCalendarDao.findAllPriceCalendar(priceCalendar);
	}

	@Override
	public PriceCalendar findByHouseInfoIdAndDateTime(PriceCalendar priceCalendar) {
		return priceCalendarDao.findByHouseInfoIdAndDateTime(priceCalendar);
	}

	@Override
	public int updateByPrimaryKeySelective(PriceCalendar record) {
		return priceCalendarDao.updateByPrimaryKeySelective(record);
	}

}
