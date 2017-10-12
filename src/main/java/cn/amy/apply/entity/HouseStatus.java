package cn.amy.apply.entity;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;

import cn.amy.product.web.DateJsonTypeConvert;
//房源状态实体类
public class HouseStatus implements Serializable{
	private static final long serialVersionUID = -9123661874974887995L;
	private Integer id;
	private Integer house_infos_id;    //房源id
	private String title;              //标题
	@DateTimeFormat(pattern="yyyy-MM-dd")  //日期类型的json 需要转换
	private Date date_time;            //预订日期
	private Double price;              //单价
	private Integer row_num;           //房间数
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getHouse_infos_id() {
		return house_infos_id;
	}
	public void setHouse_infos_id(Integer house_infos_id) {
		this.house_infos_id = house_infos_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	@JsonSerialize(using=DateJsonTypeConvert.class)
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
	@Override
	public String toString() {
		return "HouseStatus [id=" + id + ", house_infos_id=" + house_infos_id + ", title=" + title + ", date_time="
				+ date_time + ", price=" + price + ", row_num=" + row_num + "]";
	}
	
	
	

}
