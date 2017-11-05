package cn.amy.manage;

import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.amy.product.entity.HouseInfo;
import cn.amy.product.service.ProductService;
import cn.amy.util.JsonResult;

//后台添加房源信息
@Controller
public class ProductController {
	
	@Resource	
	private ProductService productService;
	
	/*-------------DemoImg测试------------------*/
	/*@RequestMapping("demoImg.do")
	public String demoImg(){
		return "manage/demoImg";
	}
	//@ResponseBody
	@RequestMapping("fileUpload")
	public String fileUpload(HttpServletRequest req,String name,MultipartFile img){
		//String img1=req.getParameter("img");
		System.out.println("--name---"+name);
		System.out.println("--img---"+img);
		return "manage/demoImg";
	}*/
	/*-------------DemoImg测试------------------*/
	
	//后台首页
	@RequestMapping("admin.do")
	public String pay_money(){
		return "manage/admin";
	}
	
	//转到注册页面
	@RequestMapping("/house/editUI")
	public String editUI() {
		return "manage/house_edit";
	}
	
	//房源信息首页
	@RequestMapping("/house/listUI")
	public String listUI() {
		return "manage/house_list";  //   WEB-INF/pages/team/team_list.jsp
	}
	
	//根据id 查询房源信息
    @RequestMapping("/house/doFindById")
    @ResponseBody
    public JsonResult doFindHouseById(String id){
    	//productTypeService.findObjectById(id);
    	//return new JsonResult(map);
    	HouseInfo list=productService.showHouseInfo(id);
    	return new JsonResult(list);
    }
	
	
	
	
	//查询所有的项目名称 id  使用  List<Map<String,Object>> 返回结果集
	@RequestMapping("/house/findAllObjects")
	@ResponseBody
	public JsonResult doFindProjects(String province,String createTime,Integer predictSum) throws ParseException{
		//获取所有房源信息
	    List<HouseInfo> list = productService.queryHouseInfo(province, createTime, predictSum);
		//List<Map<String,Object>> list=teamService.findProjectOptions();
	    System.out.println("projects="+list);
	    
	    Object obj=new JsonResult(list);
		System.out.println("project---->="+obj);
		
		return new JsonResult(list);
	}
	
	//修改房源信息
	@RequestMapping("/house/doUpdataProject")
	@ResponseBody
	public JsonResult doUpdataProject(HouseInfo houseInfo){
		productService.updateByPrimaryKeySelective(houseInfo);
		System.out.println("-----update-----"+houseInfo);
		return  new JsonResult();
	}
	
	//添加项目
	@RequestMapping("/house/doSaveProject")
	@ResponseBody
	public JsonResult doSaveProject(HouseInfo houseInfo){
		houseInfo.setHouseInfoId(UUID.randomUUID().toString());  //添加房源id
		Date d=new Date();
		houseInfo.setCreateTime(d);        //当前时间作为创建时间
		productService.insertSelective(houseInfo);
		System.out.println("-----save---:"+houseInfo);
		return  new JsonResult();
	}
	
	//删除房源信息
	@ResponseBody
	@RequestMapping("/house/delete")
	public JsonResult doDelete(String id){
		System.out.println("----delete----"+id);
		productService.deleteByPrimaryKey(id);
		return  new JsonResult();
	}
	
	//转到附件页面
	@RequestMapping("/house/uploadImages")
	public String uploadImages(String id) {
		System.out.println("---id----"+id);
		return "manage/attachment";
	}
		
    //上传附件
	@RequestMapping("/house/doSaveObject")
	@ResponseBody
	public JsonResult doSaveObject(String title,
			MultipartFile file,HttpServletRequest req){
		
		System.out.println("title:"+title);
		System.out.println("mfile:"+file);
		System.out.println("mfile:"+file.getName());
		String houseInfoId="4";
		productService.uploadImage(houseInfoId, file, req);
		//attrachementService.saveObject2(title,athType,belongId,mfile, req);
		return new JsonResult();
	}
	

}
