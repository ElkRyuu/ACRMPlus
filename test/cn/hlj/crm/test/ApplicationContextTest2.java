package cn.hlj.crm.test;

import java.sql.SQLException;
import java.util.Date;

import javax.sql.DataSource;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.hlj.crm.entity.Contact;
import cn.hlj.crm.entity.Customer;
import cn.hlj.crm.entity.CustomerService;
import cn.hlj.crm.entity.Dict;
import cn.hlj.crm.entity.SalesPlan;
import cn.hlj.crm.entity.User;
import cn.hlj.crm.service.ContactService;
import cn.hlj.crm.service.CusServService;
import cn.hlj.crm.service.CustomerServiceServ;
import cn.hlj.crm.service.SalesPlanService;
import cn.hlj.crm.service.jpa.DictService;

public class ApplicationContextTest2 {

	private ApplicationContext ctx = null;
	private CustomerServiceServ customerServiceServ = null;
	private ContactService contactService = null;
	private SalesPlanService salesPlanService = null;
	private CusServService cusServService = null;
	private DictService dictService = null;

	@Before
	public void init() {
		ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
		customerServiceServ = ctx.getBean(CustomerServiceServ.class);
		contactService = ctx.getBean(ContactService.class);
		salesPlanService = ctx.getBean(SalesPlanService.class);
		cusServService = ctx.getBean(CusServService.class);
		dictService = ctx.getBean(DictService.class);
	}

	@Test
	public void testDataSource() throws SQLException {
		DataSource dataSource = ctx.getBean(DataSource.class);
		System.out.println(dataSource.getConnection());
	}

	@Test
	public void testCustomerServiceServGetWithContacts() {
		Customer customer = customerServiceServ.getWithContacts(213L);
		System.out.println(customer.getNo());
		System.out.println(customer.getName());
		System.out.println(customer.getContacts().size());
	}

	@Test
	public void testContactSave() {
		Contact contact = new Contact();
		contact.setName("TempA2");
		contact.setTel("11341234");
		Customer customer = new Customer();
		customer.setId(213L);
		contact.setCustomer(customer);

		contact.setSex("男");
		contact.setPosition("员工");
		contact.setMobile("124331");
		contact.setMemo("普通联系人");

		contactService.save(contact);
	}

	@Test
	public void testSalesPlanUpdate() {
		SalesPlan salesPlan = new SalesPlan();
		salesPlan.setId(339L);
		salesPlan.setTodo("Sing198237645");

		salesPlan.setResult("GOOD");

		salesPlanService.update(salesPlan);
	}

	@Test
	public void testCusServSave() {
		CustomerService customerService = new CustomerService();
		customerService.setId(363L);
		customerService.setServiceType("咨询");
		customerService.setServiceTitle("AAPLUs4");
		Customer customer = new Customer();
		customer.setId(213L);
		customerService.setCustomer(customer);
		customerService.setServiceState("新创建");
		customerService.setServiceRequest("jhvjhvjjvgjh");
		User createdby = new User();
		createdby.setId(21L);
		customerService.setCreatedby(createdby);
		customerService.setCreateDate(new Date());

		cusServService.save(customerService);
	}

	@Test
	public void testDictSave() {
		Dict dict = new Dict();
		dict.setEditable(false);
		dict.setItem("武汉");
		dict.setType("地区");

		dictService.save(dict);
	}

	@Test
	public void testCusServUpdate() {
		CustomerService customerService = new CustomerService();
		customerService.setId(369L);
		customerService.setAllotDate(new Date());
		customerService.setServiceState("已分配");
		User allotTo = new User();
		allotTo.setId(21L);
		customerService.setAllotTo(allotTo);

		cusServService.update(customerService);
	}

	@Test
	public void testCusServGet() {
		CustomerService customerService = cusServService.get(360L);
		System.out.println(customerService.getServiceTitle());
		System.out.println(customerService.getCreatedby().getName());
		System.out.println(customerService.getAllotTo().getName());
	}

}
