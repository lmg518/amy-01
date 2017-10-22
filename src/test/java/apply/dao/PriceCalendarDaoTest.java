package apply.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.amy.product.dao.PriceCalendarDao;
import cn.amy.product.entity.PriceCalendar;

public class PriceCalendarDaoTest {
	ClassPathXmlApplicationContext ac;
	//测试数据库连接
	@Before
	public void init(){
	    ac=new ClassPathXmlApplicationContext("spring-pool.xml","spring-mvc.xml");
	}
	@After
	public void destroy(){
		ac.close();
	}
	
	@Test
	public void test1() {
		PriceCalendarDao dao=ac.getBean("priceCalendarDao",PriceCalendarDao.class);
		PriceCalendar p=new PriceCalendar();
		p.setHouseInfoId("1");
		p.setStatus("Y");
		List<PriceCalendar> list=dao.findAllPriceCalendar(p);
		System.out.println("------list----->"+list);
	}
	//查询
	@Test
	public void test2() throws ParseException {
		PriceCalendarDao dao=ac.getBean("priceCalendarDao",PriceCalendarDao.class);
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date d1=sdf.parse("2017-10-01");
		PriceCalendar p=new PriceCalendar();
		p.setDateTime(d1);
		p.setHouseInfoId("1");
		PriceCalendar list=dao.findByHouseInfoIdAndDateTime(p);
		System.out.println("------list----->"+list.getStatus());
	}
   //修改房源状态
	@Test
	public void test3() throws ParseException {
		PriceCalendarDao dao=ac.getBean("priceCalendarDao",PriceCalendarDao.class);
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date d1=sdf.parse("2017-10-01");
		PriceCalendar p=new PriceCalendar();
		p.setDateTime(d1);
		p.setHouseInfoId("1");
		PriceCalendar pc=dao.findByHouseInfoIdAndDateTime(p);
		System.out.println("------list1----->"+pc.getStatus());
		pc.setStatus("Y");
		dao.updateByPrimaryKeySelective(pc);
		
		System.out.println("------list2----->"+pc.getStatus());
	}
	

}
