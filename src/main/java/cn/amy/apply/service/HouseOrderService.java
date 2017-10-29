package cn.amy.apply.service;

import cn.amy.apply.entity.HouseOrder;

public interface HouseOrderService {

	/**
	 * 保存订单信息
	 * @param houseOrder
	 * @return
	 */
	public Integer saveHouseOrderSelect(HouseOrder houseOrder);
}
