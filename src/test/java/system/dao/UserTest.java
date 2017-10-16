package system.dao;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.amy.user.dao.UserDao;
import cn.amy.user.entity.User;

public class UserTest {
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
		UserDao dao=ac.getBean("userDao",UserDao.class);
		System.out.println("============>"+dao);
		
		User u=new User();
		//u.setName("李明贵");
		u.setPhone("13663963981");
		u.setPassword("123");
		System.out.println(u);
		dao.save(u);
		
		
		
		
	}

}
