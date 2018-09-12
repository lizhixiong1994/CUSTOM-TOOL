package ssm;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.tedu.store.controller.UserController;

public class Test {
	@org.junit.Test
	public void test() {
		AbstractApplicationContext ac = new ClassPathXmlApplicationContext("spring/*-mvc.xml");
		ac.getBean("userController", UserController.class);
	}
}
