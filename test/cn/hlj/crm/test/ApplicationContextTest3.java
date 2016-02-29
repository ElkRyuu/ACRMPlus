package cn.hlj.crm.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.data.domain.Page;

import cn.hlj.crm.entity.Customer;
import cn.hlj.crm.entity.SalesChance;
import cn.hlj.crm.entity.SalesPlan;
import cn.hlj.crm.repository.ReportRepository;
import cn.hlj.crm.service.SalesChanceService;
import cn.hlj.crm.service.jpa.CustomerService;
import cn.hlj.crm.service.jpa.DictService;

public class ApplicationContextTest3 {

	private ApplicationContext ctx = null;

	private CustomerService customerService = null;
	private ReportRepository reportRepository = null;

	private SalesChanceService salesChanceService = null;

	private DictService dictService = null;

	@Before
	public void init() {
		ctx = new ClassPathXmlApplicationContext("applicationContext.xml");

		customerService = ctx.getBean(CustomerService.class);
		reportRepository = ctx.getBean(ReportRepository.class);

		salesChanceService = ctx.getBean(SalesChanceService.class);
		dictService = ctx.getBean(DictService.class);

	}

	@Test
	public void testCustomerServiceGetPage() {
		int pageNo = 0;
		int pageSize = 10;

		Map<String, Object> params = new HashMap<String, Object>();
		// 添加直接属性的条件. OK
		// params.put("LIKES_name", "IPHONE6");
		// 添加 n-1 关联关系属性的条件
		params.put("LIKES_manager.name", "杨");
		// 添加 1-n 关联关系集合元素中的属性. NO!!!!!
		// params.put("LIKES_orders.address", "a");

		Page<Customer> page = customerService.getPage(pageNo, pageSize, params);

		System.out.println(page.getTotalElements());
		System.out.println(page.getTotalPages());
		System.out.println(page.getContent());
	}

	@Test
	public void testReportRepositoryGetPayPage() {
		int pageNo = 0;
		int pageSize = 10;
		Map<String, Object> params = new HashMap<String, Object>();
		// params.put("name", "");
		// params.put("maxOrderDate", "2016-1-1");

		Page<Customer> page = reportRepository.getPayPage(pageNo, pageSize, params);

		System.out.println(page.getTotalElements());
		System.out.println(page.getTotalPages());
		System.out.println(page.getContent());
	}

	@Test
	public void testReportRepositoryGetConsistPage() {
		int pageNo = 0;
		int pageSize = 10;
		String type = "level";

		Page<Object[]> page = reportRepository.getConsistPage(pageNo, pageSize, type);
		System.out.println(page.getTotalElements());
		System.out.println(page.getTotalPages());

		List<Object[]> content = page.getContent();
		for (Object[] objects : content) {
			System.out.println(objects[0] + "---" + objects[1]);
		}
	}

	@Test
	public void testSalesChanceServiceGetWithPlans() {
		SalesChance salesChance = salesChanceService.getWithPlans(150L);

		System.out.println(salesChance.getId());
		System.out.println(salesChance.getTitle());
		System.out.println(salesChance.getContactTel());

		System.out.println(salesChance.getCreateBy().getName());
		System.out.println(salesChance.getDesignee().getName());

		Set<SalesPlan> salesPlans = salesChance.getSalesPlans();
		for (SalesPlan salesPlan : salesPlans) {
			System.out.println(salesPlan.getDate() + "---" + salesPlan.getTodo() + "---" + salesPlan.getResult());
		}
	}

	@Test
	public void testDictServiceGetItemsByType() {
		List<String> list = dictService.getItemsByType("客户等级");
		for (String string : list) {
			System.out.println(string);
		}
	}

	@Test
	public void testReportRepositoryGetServicePage() {
		int pageNo = 0;
		int pageSize = 2;
		Map<String, Object> params = new HashMap<String, Object>();
		// params.put("maxOrderDate", "2016-1-1");

		Page<Object[]> page = reportRepository.getServicePage(pageNo, pageSize, params);
		System.out.println(page.getTotalElements());
		System.out.println(page.getTotalPages());

		List<Object[]> content = page.getContent();
		for (Object[] objects : content) {
			System.out.println(objects[0] + "---" + objects[1]);
		}
	}

}
