package apply.dao;

import java.util.List;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import cn.amy.apply.dao.HouseStatusDao;
import cn.amy.apply.entity.HouseStatus;

public class ApplyTest {
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
		HouseStatusDao dao=ac.getBean("houseStatusDao",HouseStatusDao.class);
		System.out.println("============>"+dao);
		
		List<HouseStatus> list=dao.findObjects(1001);
		System.out.println(list);
	}

}
