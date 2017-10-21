package apply.dao;

import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.amy.product.dao.HouseImageDao;
import cn.amy.product.entity.HouseImage;

public class HouseImageDaoTest {
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
		HouseImageDao dao=ac.getBean("houseImageDao",HouseImageDao.class);
		System.out.println("============>"+dao);
		
		//HouseInfo list=dao.showHouseInfo("1"); 
		List<HouseImage> list=dao.showHouseInfo("1");
		System.out.println("------list----->"+list);
	}

}
