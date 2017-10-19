package apply.dao;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.amy.user.dao.CustPersonDao;
import cn.amy.user.entity.CustPerson;

public class CustPersonDaoTest {
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
		CustPersonDao dao=ac.getBean("custPersonDao",CustPersonDao.class);
		System.out.println("============>"+dao);
		
		//CustPerson list=dao.selectByPrimaryKey("1");  //自动生成的方法  ok 
		CustPerson list=dao.findlandlordById("1");   //数据库中的字段映射不出来
		System.out.println("------list----->"+list);
	}

}
