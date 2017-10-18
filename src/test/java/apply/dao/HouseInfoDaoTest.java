package apply.dao;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.amy.product.dao.HouseInfoDao;
import cn.amy.product.entity.HouseInfo;

public class HouseInfoDaoTest {
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
		HouseInfoDao dao=ac.getBean("houseInfoDao",HouseInfoDao.class);
		System.out.println("============>"+dao);
		
		//HouseInfo list=dao.showHouseInfo("1"); 
		HouseInfo list=dao.selectByPrimaryKey("1");  //自动生成的方法
		System.out.println("------list----->"+list.getHouseInfoId());
	}

}
