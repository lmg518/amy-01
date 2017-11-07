package cn.amy.product.service;

import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import cn.amy.product.entity.HotActivity;
import cn.amy.product.entity.HotCity;
import cn.amy.product.entity.HouseImage;
import cn.amy.product.entity.HouseInfo;
import cn.amy.product.entity.PriceCalendar;

public interface ProductService {

	/**
	 * 查询房源信息
	 * @param province
	 * @param createTime
	 * @param predictSum
	 * @return
	 */
	public List<HouseInfo> queryHouseInfo(String province,String createTime,Integer predictSum) throws ParseException;
	
	HouseInfo showHouseInfo(String house_info_id); //根据房源id查询
	
	List<HouseImage> findHouseImages(String house_info_id); //根据房源id查询房源图片集
	
	List<PriceCalendar> findAllPriceCalendar(PriceCalendar priceCalendar);
	
	PriceCalendar findByHouseInfoIdAndDateTime(PriceCalendar priceCalendar); //预订页面查询预订的日历
	
	int updateByPrimaryKeySelective(PriceCalendar record); //更新价格日历状态信息
	
	/**
	 * 查询首页显示的地址图片信息
	 * @return
	 */
	List<HotCity> queryHotCityAll();
	
	/**
	 * 查询热门活动
	 * @return
	 */
	List<HotActivity> queryHotActivity();
	

	//修改
	int updateByPrimaryKeySelective(HouseInfo houseInfo);
	
	//保存
	int insertSelective(HouseInfo houseInfo);
	
	//删除
	int deleteByPrimaryKey(String houseInfoId);
	
	//上传图片
	void uploadImage(String houseInfoId,String type,MultipartFile mfile,HttpServletRequest req);
	
	
}
