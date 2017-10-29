package cn.amy.product.service;

import java.util.Date;
import java.util.List;

import cn.amy.product.entity.PriceCalendar;

public interface PriceCalendarService {

	/**
	 * 根据开始日期和结束日期查询价格
	 * @return
	 */
	public List<PriceCalendar> queryPriceCalendarByStartEndTime(String houseInfoId,Date startTime,Date endTime,String status);
	
	/**
	 * 有人预定房屋后，将时间状态更新成Y
	 * @param houseInfoId
	 * @param startTime
	 * @param endTime
	 * @param status
	 * @return
	 */
	public Integer updatePriceCalendarByStartEndTime(String houseInfoId,Date startTime,Date endTime,String status);
}
