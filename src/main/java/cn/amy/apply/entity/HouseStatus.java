package cn.amy.apply.entity;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;

import cn.amy.product.web.DateJsonTypeConvert;
//房源状态实体类
public class HouseStatus implements Serializable{
	private static final long serialVersionUID = -9123661874974887995L;
	private String status_id;
	private String house_info_id;      //房源id
	private String title;              //标题
	//@DateTimeFormat(pattern="yyyy-MM-dd")  //日期类型的json 需要转换
	private Date date_time;            //预订日期
	private Double price;              //单价
	private Integer row_num;           //房间数
	public String getStatus_id() {
		return status_id;
	}
	public void setStatus_id(String status_id) {
		this.status_id = status_id;
	}
	public String getHouse_info_id() {
		return house_info_id;
	}
	public void setHouse_info_id(String house_info_id) {
		this.house_info_id = house_info_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	//@JsonSerialize(using=DateJsonTypeConvert.class)
	// 控制器返回的jsonp  
	public Date getDate_time() {
		return date_time;
	}
	public void setDate_time(Date date_time) {
		this.date_time = date_time;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Integer getRow_num() {
		return row_num;
	}
	public void setRow_num(Integer row_num) {
		this.row_num = row_num;
	}
	
//	@JsonSerialize(using=DateJsonTypeConvert.class)
//	public Date getDate_time() {
//		return date_time;
//	}
	
	@Override
	public String toString() {
		//转换格式
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		return "HouseStatus [status_id=" + status_id + ", house_info_id=" + house_info_id + ", title=" + title + ", date_time="
				+ sdf.format(date_time) + ", price=" + price + ", row_num=" + row_num + "]";
	}
	
	
	

}
