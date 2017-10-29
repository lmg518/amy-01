package cn.amy.product.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.amy.product.dao.PriceCalendarDao;
import cn.amy.product.entity.PriceCalendar;
import cn.amy.product.service.PriceCalendarService;

@Service("priceCalendarService")
public class PriceCalendarServiceImpl implements PriceCalendarService {

	@Resource
	private PriceCalendarDao priceCalendarDao;
	
	/**
	 * 根据开始日期和结束日期查询每天的价格
	 */
	@Override
	public List<PriceCalendar> queryPriceCalendarByStartEndTime(String houseInfoId,Date startTime, Date endTime,String status) {
		PriceCalendar pc = new PriceCalendar();
		pc.setHouseInfoId(houseInfoId);
		pc.setStartTime(startTime);
		pc.setEndTime(endTime);
		pc.setStatus(status);
		return priceCalendarDao.queryPriceCalendarByStartEndTime(pc);
	}

	/**
	 * 更新价格日历表中的状态
	 */
	@Override
	public Integer updatePriceCalendarByStartEndTime(String houseInfoId, Date startTime, Date endTime, String status) {
		PriceCalendar pc = new PriceCalendar();
		pc.setHouseInfoId(houseInfoId);
		pc.setStartTime(startTime);
		pc.setEndTime(endTime);
		pc.setStatus(status);
		return priceCalendarDao.updatePriceCalendarByStartEndTime(pc);
	}
}
