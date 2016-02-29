package cn.hlj.crm.test;

import java.util.Date;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.data.domain.Page;

import cn.hlj.crm.entity.Authority;
import cn.hlj.crm.entity.Contact;
import cn.hlj.crm.entity.Customer;
import cn.hlj.crm.entity.CustomerActivity;
import cn.hlj.crm.entity.Order;
import cn.hlj.crm.entity.OrderItem;
import cn.hlj.crm.entity.Role;
import cn.hlj.crm.entity.User;
import cn.hlj.crm.service.CustomerServiceServ;
import cn.hlj.crm.service.UserService;
import cn.hlj.crm.service.jpa.CustomerActivityService;
import cn.hlj.crm.service.jpa.OrderService;

public class ApplicationContextTest4 {

	private ApplicationContext ctx = null;

	private CustomerServiceServ customerServiceServ = null;

	private CustomerActivityService customerActivityService = null;

	private OrderService orderService = null;

	private UserService userService = null;

	@Before
	public void init() {
		ctx = new ClassPathXmlApplicationContext("applicationContext.xml");

		customerServiceServ = ctx.getBean(CustomerServiceServ.class);

		customerActivityService = ctx.getBean(CustomerActivityService.class);

		orderService = ctx.getBean(OrderService.class);

		userService = ctx.getBean(UserService.class);
	}

	@Test
	public void testCustomerServiceServGet() {
		Customer customer = customerServiceServ.get(141L);

		System.out.println("客户编号 ： " + customer.getNo());
		System.out.println("地区 ： " + customer.getRegion());
		System.out.println("客户经理 ： " + customer.getManager().getId() + "---" + customer.getManager().getName());

		System.out.println("电话 ： " + customer.getTel());

		System.out.println("营业执照注册号 ： " + customer.getLicenceNo());
		System.out.println("国税登记号 ： " + customer.getNationalTaxNo());
	}

	@Test
	public void testCustomerServiceServUpdate() {
		Customer customer = new Customer();
		customer.setId(141L);

		customer.setName("Lenovo移动");

		Contact contact = new Contact();
		contact.setId(142L);
		customer.setManager(contact);
		customer.setCredit("☆☆");

		customer.setState("正常");
		customer.setWebsit("www.hlj.cn");
		customer.setLocalTaxNo("DS-67Y666");
		customer.setNationalTaxNo("GS-78X00YY");

		customerServiceServ.update(customer);
	}

	@Test
	public void testCustomerActivityServiceGetByCustomerId() {
		List<CustomerActivity> list = customerActivityService.getByCustomerId(154L);
		for (CustomerActivity customerActivity : list) {
			System.out.println(customerActivity.getId() + "---" + customerActivity.getDescription());
			System.out
					.println(customerActivity.getCustomer().getNo() + "--" + customerActivity.getCustomer().getName());

			System.out.println();
		}
	}

	@Test
	public void testCustomerActivityServiceSave() {
		CustomerActivity customerActivity = new CustomerActivity();
		customerActivity.setId(378L);

		customerActivity.setDate(new Date());
		customerActivity.setPlace("上海");
		customerActivity.setTitle("看电影");
		customerActivity.setDescription("开心~~~");

		Customer customer = new Customer();
		customer.setId(154L);
		customerActivity.setCustomer(customer);

		customerActivityService.save(customerActivity);
	}

	@Test
	public void testOrderServiceGetPage() {
		int pageNo = 0;
		int pageSize = 5;
		Long customerId = 4L;
		Page<Order> page = orderService.getPage(pageNo, pageSize, customerId);

		System.out.println(page.getTotalElements());
		System.out.println(page.getTotalPages());

		List<Order> content = page.getContent();
		for (Order order : content) {
			System.out.println(order.getNo() + "---" + order.getAddress());
		}
	}

	@Test
	public void testUserServiceGetByName() {
		User user = userService.getByName("bcde");
		System.out.println(user.getName());

		Role role = user.getRole();
		System.out.println(role.getName());

		List<Authority> authorities = role.getAuthorities();
		for (Authority authority : authorities) {
			System.out.println(authority.getName());

			System.out.println(authority.getParentAuthority().getDisplayName());
		}
	}

	@Test
	public void testOrderServiceGetById() {
		Order order = orderService.getById(1L);

		System.out.println(order.getAddress() + "--" + order.getStatus());

		for (OrderItem item : order.getItems()) {
			System.out.println(item.getProduct().getName() + "--" + item.getCount());
		}
	}

}
