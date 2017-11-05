package cn.amy.product.service.impl;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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

	@Override
	public int updateByPrimaryKeySelective(HouseInfo houseInfo) {
		return houseInfoDao.updateByPrimaryKeySelective(houseInfo);
	}

	@Override
	public int insertSelective(HouseInfo houseInfo) {
		return houseInfoDao.insertSelective(houseInfo);
	}

	@Override
	public int deleteByPrimaryKey(String houseInfoId) {
		return houseInfoDao.deleteByPrimaryKey(houseInfoId);
	}
	
	//上传图片
	@Override
	public void uploadImage(String houseInfoId, MultipartFile mfile, HttpServletRequest req) {
		
     //String servicePath=req.getServletContext().getRealPath("/"); //获取到服务器的项目文件路径
	String servicePath=req.getSession().getServletContext().getRealPath("/");
		
    System.out.println("服务器的路径："+servicePath);
		
		String ofileName=mfile.getOriginalFilename();  //获取到文件名
		System.out.println("原文件名："+ofileName);  //default.html
		//服务器的路径：D:\WorkSpace_Spring\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps\amy-jpminsu-01\
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String dateStr=sdf.format(new Date()); //以当前的日期作为保存 文件夹名
		
		String newFileName=UUID.randomUUID().toString()+"."
		+FilenameUtils.getExtension(ofileName);//获取到文件的扩展名 封装的类
		System.out.println("新文件名："+newFileName);
		
		
		File dest;  //上传文件保存到服务器端的文件
		byte[] fileBytes; //文件的字节数据
		String fileDigest;  //文件摘要 
		
		try {
			fileBytes=mfile.getBytes();
			
			//Linux系统
			//dest=new File("/home/soft01/upFiles/"+dateStr+"/"+newFileName);
			
			//windos系统
			//dest=new File("D:/upFiles/"+dateStr+"/"+newFileName);
			
			//保存到服务器的路经下 
			//dest=new File(servicePath+dateStr+"/"+newFileName); 
			dest=new File(servicePath+"images/houses"+"/"+newFileName); 
			
			File parent=dest.getParentFile();
			
			if(!parent.exists()){
				parent.mkdirs();
			}
			
			mfile.transferTo(dest);
			
		} catch (IOException e) {
			e.printStackTrace();
			throw new RuntimeException("UpLoad Error!");
		}
		
		HouseInfo houseinfo=houseInfoDao.selectByPrimaryKey(houseInfoId);
		houseinfo.setImgUrl(dest.getPath());
		houseInfoDao.updateByPrimaryKeySelective(houseinfo);  //更新到数据库中
	}

	

}
