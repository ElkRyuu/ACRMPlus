package cn.hlj.crm.handler;

import java.io.IOException;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.WebUtils;

import cn.hlj.crm.entity.Contact;
import cn.hlj.crm.entity.Customer;
import cn.hlj.crm.entity.SalesChance;
import cn.hlj.crm.orm.Page;
import cn.hlj.crm.service.ContactService;
import cn.hlj.crm.service.CustomerServiceServ;
import cn.hlj.crm.service.SalesChanceService;
import cn.hlj.crm.service.UserService;
import cn.hlj.crm.util.ParamsUtils;

@Controller
@RequestMapping("/chance")
public class SalesChanceHandler {

	@Autowired
	private SalesChanceService salesChanceService;

	@Autowired
	private UserService userService;

	@Autowired
	private CustomerServiceServ customerServiceServ;

	@Autowired
	private ContactService contactService;

	@RequestMapping("/list")
	public String list(@RequestParam(value = "pageNo", required = false, defaultValue = "1") String pageNoStr,
			Map<String, Object> map, HttpServletRequest request) throws IOException {
		Page<SalesChance> page = new Page<>();

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

		page = salesChanceService.getPage(page, params);
		map.put("page", page);
		return "chance/list";
	}

	// 跳转到 新建销售机会 页面
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String create(Map<String, Object> map) {
		map.put("chance", new SalesChance());
		return "chance/input";
	}

	// 保存 销售机会
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String create(SalesChance salesChance) {
		salesChanceService.save(salesChance);
		return "redirect:/chance/list";
	}

	// 删除 销售机会
	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	public String delete(@PathVariable("id") String idStr) {
		Long id = -1L;

		try {
			id = Long.parseLong(idStr);

			salesChanceService.delete(id);
		} catch (NumberFormatException e) {
		}
		return "redirect:/chance/list";
	}

	// 跳转到 修改销售机会 页面
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String edit(@PathVariable("id") String idStr, Map<String, Object> map) {
		Long id = -1L;

		try {
			id = Long.parseLong(idStr);

			SalesChance chance = salesChanceService.get(id);
			if (chance != null) {
				map.put("chance", chance);
				return "chance/input";
			}
		} catch (NumberFormatException e) {
		}

		return "home/error";
	}

	// 更新
	@RequestMapping(value = "/", method = RequestMethod.PUT)
	public String update(SalesChance salesChance) {
		salesChanceService.update(salesChance);
		return "redirect:/chance/list";
	}

	// 跳转到 指派销售机会 的页面
	@RequestMapping(value = "/dispatch/{id}", method = RequestMethod.GET)
	public String dispatch(@PathVariable("id") String idStr, Map<String, Object> map) {
		Long id = -1L;

		try {
			id = Long.parseLong(idStr);

			SalesChance chance = salesChanceService.get(id);
			if (chance != null) {
				map.put("chance", chance);
				map.put("users", userService.getAll());
				return "chance/dispatch";
			}
		} catch (NumberFormatException e) {
		}

		return "home/error";
	}

	// 更新 销售机会的指派
	@RequestMapping(value = "/dispatch/{id}", method = RequestMethod.PUT)
	public String dispatch(SalesChance salesChance) {
		salesChanceService.update(salesChance);
		return "redirect:/chance/list";
	}

	// 客户开发成功
	@RequestMapping(value = "/finish/{id}", method = RequestMethod.PUT)
	public String finish(@PathVariable("id") String idStr) {
		Long id = -1L;

		try {
			id = Long.parseLong(idStr);

			SalesChance chance = salesChanceService.get(id);
			if (chance != null) {
				// 将 SALES_CHANCES 表的 status 字段置为3
				SalesChance tempChance = new SalesChance();
				tempChance.setId(id);
				tempChance.setStatus(3);
				salesChanceService.update(tempChance);

				// 向 CUSTOMERS 表中插入一条新的记录
				Customer customer = new Customer();
				customer.setName(chance.getTitle());
				customer.setNo(UUID.randomUUID().toString());
				customer.setState("正常");
				customerServiceServ.save(customer);

				// 向 CONTACTS 表中插入一条新的记录
				Contact contact = new Contact();
				contact.setName(chance.getContact());
				contact.setTel(chance.getContactTel());
				Customer tempCustomer = new Customer();
				tempCustomer.setId(customer.getId());
				contact.setCustomer(tempCustomer);
				contactService.save(contact);

				return "redirect:/plan/list";
			}
		} catch (NumberFormatException e) {
		}
		return "home/error";
	}

	// 客户开发失败
	@RequestMapping(value = "/stop/{id}", method = RequestMethod.GET)
	public String stop(@PathVariable("id") String idStr) {
		Long id = -1L;

		try {
			id = Long.parseLong(idStr);

			SalesChance chance = salesChanceService.get(id);
			if (chance != null) {
				// 将 SALES_CHANCES 表的 status 字段置为4
				SalesChance tempChance = new SalesChance();
				tempChance.setId(id);
				tempChance.setStatus(4);
				salesChanceService.update(tempChance);

				return "redirect:/plan/list";
			}
		} catch (NumberFormatException e) {
		}
		return "home/error";
	}
}
