package cn.hlj.crm.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.hlj.crm.entity.CustomerDrain;
import cn.hlj.crm.orm.Page;
import cn.hlj.crm.service.CustomerDrainService;

public class ApplicationContextTest5 {

	private ApplicationContext ctx = null;

	private CustomerDrainService customerDrainService = null;

	@Before
	public void init() {
		ctx = new ClassPathXmlApplicationContext("applicationContext.xml");

		customerDrainService = ctx.getBean(CustomerDrainService.class);
	}

	@Test
	public void testCustomerDrainServiceGetPage() {
		Page<CustomerDrain> p = new Page<>();
		p.setPageNo(1);

		Map<String, Object> params = new HashMap<>();
		// params.put("LIKES_customerName", "移动");
		params.put("LIKES_managerName", "杨");

		Page<CustomerDrain> page = customerDrainService.getPage(p, params);

		System.out.println(page.getTotalElements());

		List<CustomerDrain> content = page.getContent();
		for (CustomerDrain customerDrain : content) {
			System.out.println(customerDrain.getId() + "--" + customerDrain.getCustomer().getName() + "--"
					+ customerDrain.getCustomer().getManager().getName());

			System.out.println(customerDrain.getReason());
		}
	}

	@Test
	public void testCustomerDrainServiceGetById() {
		CustomerDrain customerDrain = customerDrainService.getById(396L);

		System.out.println(customerDrain.getId() + "--" + customerDrain.getCustomer().getName() + "--"
				+ customerDrain.getCustomer().getManager().getName() + customerDrain.getLastOrderDate());
	}

}
