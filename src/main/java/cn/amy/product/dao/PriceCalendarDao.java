package cn.amy.product.dao;

import java.util.Date;
import java.util.List;

import cn.amy.product.dao.mapper.PriceCalendarMapper;
import cn.amy.product.entity.PriceCalendar;

public interface PriceCalendarDao extends PriceCalendarMapper{

	/**
	 * 根据house_info_id查询
	 * @param house_info_id
	 * @return
	 */
	List<PriceCalendar> findAllPriceCalendar(PriceCalendar priceCalendar);
	
	/**
	 * 预订页面根据房源id  日期
	 * @param house_info_id
	 * @param date_time
	 * @return
	 */
	PriceCalendar findByHouseInfoIdAndDateTime(PriceCalendar priceCalendar);
	
	
	/**
	 * 根据开始日期和结束日期查询每天的价格
	 * @param house_info_id
	 * @param start_time
	 * @param end_time
	 * @return
	 */
	List<PriceCalendar> queryPriceCalendarByStartEndTime(PriceCalendar priceCalendar);
	
	
	/**
	 * 有人预定房屋后，将时间状态更新成Y
	 * @param houseInfoId
	 * @param startTime
	 * @param endTime
	 * @param status
	 * @return
	 */
	public Integer updatePriceCalendarByStartEndTime(PriceCalendar priceCalendar);
	
}
