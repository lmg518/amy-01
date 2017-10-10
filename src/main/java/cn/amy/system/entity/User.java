package cn.amy.system.entity;

import java.io.Serializable;
import java.util.Date;

public class User implements Serializable{
	private static final long serialVersionUID = 1768931144633277198L;
	private Integer id;
	private Integer orders_id;    //订单id   一对多
	private String name;          //用户名
	private String phone;         //电话号码
	private String password;      //密码
	private String invite_code;   //邀请码
	private String com_info;      //评论信息   
	private Integer coupons_id;   //优惠卷id  一对多
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getOrders_id() {
		return orders_id;
	}
	public void setOrders_id(Integer orders_id) {
		this.orders_id = orders_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getInvite_code() {
		return invite_code;
	}
	public void setInvite_code(String invite_code) {
		this.invite_code = invite_code;
	}
	public String getCom_info() {
		return com_info;
	}
	public void setCom_info(String com_info) {
		this.com_info = com_info;
	}
	public Integer getCoupons_id() {
		return coupons_id;
	}
	public void setCoupons_id(Integer coupons_id) {
		this.coupons_id = coupons_id;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", orders_id=" + orders_id + ", name=" + name + ", phone=" + phone + ", password="
				+ password + ", invite_code=" + invite_code + ", com_info=" + com_info + ", coupons_id=" + coupons_id
				+ "]";
	}
	
	
	
	
}
