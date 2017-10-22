package cn.amy.product.dao;

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
	
	
}
