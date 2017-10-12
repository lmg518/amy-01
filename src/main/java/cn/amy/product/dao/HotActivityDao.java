package cn.amy.product.dao;

import cn.amy.product.dao.mapper.HotActivityMapper;
import cn.amy.product.entity.HotActivity;

public interface HotActivityDao extends HotActivityMapper {

	/**
	 * 查询首页地区图片信息
	 * @return
	 */
	HotActivity queryHotActivityAll();
}
