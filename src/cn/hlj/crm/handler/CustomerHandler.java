package cn.hlj.crm.handler;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import cn.hlj.crm.entity.Customer;
import cn.hlj.crm.entity.CustomerActivity;
import cn.hlj.crm.entity.Order;
import cn.hlj.crm.orm.Page;
import cn.hlj.crm.service.ContactService;
import cn.hlj.crm.service.CustomerServiceServ;
import cn.hlj.crm.service.jpa.CustomerActivityService;
import cn.hlj.crm.service.jpa.DictService;
import cn.hlj.crm.service.jpa.OrderService;
import cn.hlj.crm.util.ParamsUtils;

@Controller
@RequestMapping("/customer")
public class CustomerHandler {

	@Autowired
	private CustomerServiceServ customerServiceServ;

	@Autowired
	private DictService dictService;

	@Autowired
	private ContactService contactService;

	@Autowired
	private CustomerActivityService customerActivityService;

	@Autowired
	private OrderService orderService;

	// 跳转到当前客户的 联系人管理 的页面
	@RequestMapping(value = "/contact/list/{id}", method = RequestMethod.GET)
	public String cusWithContacts(@PathVariable("id") String idStr, Map<String, Object> map) {
		Long id = -1L;

		try {
			id = Long.parseLong(idStr);

			Customer customer = customerServiceServ.getWithContacts(id);
			if (customer != null) {
				map.put("customer", customer);
				return "contact/list";
			}
		} catch (NumberFormatException e) {
		}

		return "home/error";
	}

	// 跳转到 客户信息管理 的页面
	@RequestMapping("/list")
	public String list(@RequestParam(value = "pageNo", required = false, defaultValue = "1") String pageNoStr,
			Map<String, Object> map, HttpServletRequest request) throws IOException {
		Page<Customer> page = new Page<>();

		int pageNo = 1;
		try {
			pageNo = Integer.parseInt(pageNoStr);
		} catch (Exception e) {
		}

		page.setPageNo(pageNo);

		// 1. 获取 search_ 开头的请求参数的 Map
		Map<String, Object> params = WebUtils.getParametersStartingWith(request, "search_");

		// 2. 把 params 再序列化为一个查询字符串
		String queryString = ParamsUtils.encodeParamsToQueryString(params);

		// 3. 把查询字符串传回到页面
		map.put("queryString", queryString);

		page = customerServiceServ.getPage(page, params);
		map.put("page", page);

		map.put("regions", dictService.getItemsByType("地区"));
		map.put("levels", dictService.getItemsByType("客户等级"));

		return "customer/list";
	}

	// 跳转到客户信息修改的页面
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String toUpdatePage(@PathVariable("id") String idStr, Map<String, Object> map) {
		Long id = -1L;

		try {
			id = Long.parseLong(idStr);

			Customer customer = customerServiceServ.get(id);
			if (customer != null) {
				map.put("customer", customer);
				map.put("regions", dictService.getItemsByType("地区"));
				map.put("levels", dictService.getItemsByType("客户等级"));
				map.put("satifies", dictService.getItemsByType("满意度"));
				map.put("credits", dictService.getItemsByType("信用度"));

				map.put("contacts", contactService.getContactsByCusId(customer.getId()));

				return "customer/input";
			}
		} catch (NumberFormatException e) {
		}

		return "home/error";
	}

	// 修改客户信息
	@RequestMapping(value = "/", method = RequestMethod.PUT)
	public String update(Customer customer) {
		if (customer != null) {
			customerServiceServ.update(customer);
			return "redirect:/customer/list";
		}

		return "home/error";
	}

	// 跳转到 交往记录 页面
	@RequestMapping(value = "/activity/{customerId}")
	public String activityList(@PathVariable("customerId") Long customerId, Map<String, Object> map) {

		Customer customer = customerServiceServ.get(customerId);
		if (customer != null) {
			map.put("customer", customer);

			List<CustomerActivity> activities = customerActivityService.getByCustomerId(customerId);
			map.put("activities", activities);

			return "activity/list";
		}

		return "home/error";
	}

	// 跳转到 新建交往记录 的页面
	@RequestMapping(value = "/activity/create")
	public String createActivity(@RequestParam(value = "customerId", required = true) Long customerId,
			Map<String, Object> map) {
		CustomerActivity activity = new CustomerActivity();
		Customer customer = new Customer();
		customer.setId(customerId);
		activity.setCustomer(customer);
		map.put("activity", activity);

		return "activity/input";
	}

	// 保存
	@RequestMapping(value = "/activity/save")
	public String saveActivity(CustomerActivity customerActivity) {
		if (customerActivity != null) {
			customerActivityService.save(customerActivity);

			return "redirect:/customer/activity/" + customerActivity.getCustomer().getId();
		}

		return "home/error";
	}

	// 跳转到 修改交往记录 的页面
	@RequestMapping(value = "/activity/edit")
	public String editActivity(@RequestParam(value = "id", required = true) Long id, Map<String, Object> map) {
		CustomerActivity activity = customerActivityService.get(id);
		if (activity != null) {
			map.put("activity", activity);

			return "activity/input";
		}

		return "home/error";

	}

	// 删除 交往记录
	@RequestMapping(value = "/activity/delete")
	public String delActivity(@RequestParam(value = "id", required = true) Long id,
			@RequestParam(value = "customerId", required = true) Long customerId) {
		customerActivityService.delete(id);
		return "redirect:/customer/activity/" + customerId;
	}

	// 跳转到 历史订单 的页面
	@RequestMapping(value = "/order/list/{customerId}", method = RequestMethod.GET)
	public String orderList(@PathVariable("customerId") Long customerId,
			@RequestParam(value = "pageNo", required = false, defaultValue = "1") String pageNoStr,
			Map<String, Object> map) {

		int pageNo = 0;
		try {
			pageNo = Integer.parseInt(pageNoStr) - 1;
		} catch (Exception e) {
		}

		int pageSize = 3;

		org.springframework.data.domain.Page<Order> page = orderService.getPage(pageNo, pageSize, customerId);

		map.put("page", page);

		return "order/list";
	}

	// 跳转到 历史订单明细 的页面
	@RequestMapping(value = "/order/details", method = RequestMethod.GET)
	public String orderDetails(@RequestParam(value = "id", required = true) Long id, Map<String, Object> map) {
		Order order = orderService.getById(id);
		if (order != null) {
			map.put("order", order);

			return "order/detail";
		}

		return "home/error";
	}

	// 删除 客户记录
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE)
	@ResponseBody
	public int deleteCust(@PathVariable("id") String idStr) {
		Long id = -1L;

		try {
			id = Long.parseLong(idStr);

			Customer customer = new Customer();
			customer.setId(id);
			customer.setState("删除");
			customerServiceServ.update(customer);

			return 1;
		} catch (NumberFormatException e) {
		}

		return 0;
	}
}
