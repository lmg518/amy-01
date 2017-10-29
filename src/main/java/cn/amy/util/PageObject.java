package cn.amy.util;

import java.io.Serializable;
/**
 * 当前页
 * 记录数
 * 总页数
 * @author soft01
 *
 */



public class PageObject implements Serializable {
	private static final long serialVersionUID =1L;
	
	private int pageCurrent=1;      //当前页
	private int rowCount;           //记录数   查询出来的
	private int pageCount;         //总页数   查询后计算出来的
	private int pageSize=2;        //每页显示的记录数
	private int startIndex;        //当前页 数据的起始位置   =(pageCount-1)*pageSize;
	
	
	
	public int getPageCurrent() {
		return pageCurrent;
	}

	public void setPageCurrent(int pageCurrent) {
		this.pageCurrent = pageCurrent;
	}

	public int getRowCount() {
		return rowCount;
	}

	public void setRowCount(int rowCount) {
		this.rowCount = rowCount;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	
	
	//返回当前页数据的起始位置
	public int getStartIndex() {
		return (pageCurrent-1)*pageSize;
	}

	
	
	
	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	//返回总页数
	public  int getPageCount(){
		if(rowCount%pageSize==0){
			pageCount=rowCount/pageSize;
		}else{
			pageCount=rowCount/pageSize+1;
		}
		
		return pageCount;
	}
	
	
	
	public static void main(String[] args) {
		PageObject p=new PageObject();
		
		System.out.println(p.pageSize);
		System.out.println(p.startIndex);
	}
	
	

}
