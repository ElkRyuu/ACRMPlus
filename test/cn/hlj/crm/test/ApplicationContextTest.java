package cn.hlj.crm.test;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.sql.DataSource;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.hlj.crm.entity.Contact;
import cn.hlj.crm.entity.Customer;
import cn.hlj.crm.entity.Role;
import cn.hlj.crm.entity.SalesChance;
import cn.hlj.crm.entity.SalesPlan;
import cn.hlj.crm.entity.User;
import cn.hlj.crm.orm.Page;
import cn.hlj.crm.service.ContactService;
import cn.hlj.crm.service.CustomerServiceServ;
import cn.hlj.crm.service.RoleService;
import cn.hlj.crm.service.SalesChanceService;
import cn.hlj.crm.service.SalesPlanService;
import cn.hlj.crm.service.UserService;

public class ApplicationContextTest {

	private ApplicationContext ctx = null;
	private UserService userService = null;
	private SalesChanceService salesChanceService = null;
	private RoleService roleService = null;
	private ContactService contactService = null;
	private CustomerServiceServ customerServiceServ = null;
	private SalesPlanService salesPlanService = null;

	@Before
	public void init() {
		ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
		userService = ctx.getBean(UserService.class);
		salesChanceService = ctx.getBean(SalesChanceService.class);
		roleService = ctx.getBean(RoleService.class);
		contactService = ctx.getBean(ContactService.class);
		customerServiceServ = ctx.getBean(CustomerServiceServ.class);
		salesPlanService = ctx.getBean(SalesPlanService.class);
	}

	@Test
	public void testDataSource() throws SQLException {
		DataSource dataSource = ctx.getBean(DataSource.class);
		System.out.println(dataSource.getConnection());
	}

	@Test
	public void testLogin() {
		User user = userService.login("bcde", "4f6ed9e4ab25a6dac05933a8a0c5822ada8177e5");
		System.out.println(user);
	}

	@Test
	public void testGetPage() {
		Page<SalesChance> page = new Page<>();
		page.setPageNo(1);
		page.setPageSize(2);

		page = salesChanceService.getPage(page);

		System.out.println(page.getTotalElements());
		System.out.println(page.getContent());
	}

	@Test
	public void testUserGetPage() {
		Page<User> page = new Page<>();
		page.setPageNo(1);
		page.setPageSize(2);

		page = userService.getPage(page);

		System.out.println(page.getTotalElements());
		System.out.println(page.getContent());
	}

	@Test
	public void testRoleGetAll() {
		List<Role> list = roleService.getAll();
		for (Role role : list) {
			System.out.println(role.getId() + "--" + role.getDescription() + "--" + role.getName());
		}
	}

	@Test
	public void testUserGet() {
		User user = userService.get(21L);
		System.out.println(user.getName());
		System.out.println(user.getRole().getId());
	}

	@Test
	public void testSalesChanceGet() {
		SalesChance chance = salesChanceService.get(1L);

		System.out.println(chance.getSource());
		System.out.println(chance.getCreateBy().getName());
		System.out.println(chance.getCreateBy().getRole().getName());
	}

	@Test
	public void testSalesChanceUpdate() {
		SalesChance salesChance = new SalesChance();
		salesChance.setId(203L);
		salesChance.setDesignee(userService.get(24L));
		salesChance.setDesigneeDate(new Date());

		salesChanceService.update(salesChance);
	}

	@Test
	public void testContactSave() {
		Contact contact = new Contact();
		contact.setName("黄先生4");
		contact.setTel("51571522");
		Customer customer = new Customer();
		customer.setId(213L);
		contact.setCustomer(customer);

		contactService.save(contact);
	}

	@Test
	public void testCustomerSave() {
		Customer customer = new Customer();
		customer.setName("IPHONE6PLUSPLUS 直销");
		customer.setNo(UUID.randomUUID().toString());
		customer.setState("正常");

		customerServiceServ.save(customer);
		System.out.println(customer.getId());
	}

	@Test
	public void testSalesPlanGetByChance() {
		SalesChance salesChance = new SalesChance();
		salesChance.setId(208L);

		List<SalesPlan> list = salesPlanService.getByChance(salesChance);

		for (SalesPlan salesPlan : list) {
			System.out.println(salesPlan.getTodo());
			System.out.println(salesPlan.getDate());
			System.out.println(salesPlan.getResult());

			System.out.println("--------------------------");
		}
	}

	@Test
	public void testSalesChanceGet2() {
		SalesChance salesChance = salesChanceService.get(208L);
		System.out.println(salesChance.getDesignee().getId());
	}

	@Test
	public void testSalesPlanSave() {
		SalesPlan salesPlan = new SalesPlan();
		salesPlan.setDate(new Date());
		salesPlan.setTodo("SingPlusPlus");
		SalesChance salesChance = new SalesChance();
		salesChance.setId(208L);
		salesPlan.setChance(salesChance);

		salesPlanService.save(salesPlan);

		System.out.println(salesPlan.getId());
	}

	@Test
	public void testSalesPlanUpdate() {
		SalesPlan salesPlan = new SalesPlan();
		salesPlan.setId(267L);
		salesPlan.setTodo("HELLOWORLD");

		salesPlanService.update(salesPlan);
	}
}
