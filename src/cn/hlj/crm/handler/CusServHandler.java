package cn.hlj.crm.handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.WebUtils;

import cn.hlj.crm.entity.CustomerService;
import cn.hlj.crm.entity.User;
import cn.hlj.crm.orm.Page;
import cn.hlj.crm.service.CusServService;
import cn.hlj.crm.service.CustomerServiceServ;
import cn.hlj.crm.service.UserService;
import cn.hlj.crm.util.ParamsUtils;

@Controller
@RequestMapping("/service")
public class CusServHandler {

	private static List<String> serviceTypes = null;

	static {
		serviceTypes = new ArrayList<>();
		serviceTypes.add("咨询");
		serviceTypes.add("投诉");
		serviceTypes.add("建议");
	}

	@Autowired
	private CustomerServiceServ customerServiceServ;

	@Autowired
	private CusServService cusServService;

	@Autowired
	private UserService userService;

	// 跳转到 新建客户服务 页面
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String toNewServPage(Map<String, Object> map) {
		map.put("serviceTypes", serviceTypes);
		// 将所有 customer 放到map里
		map.put("customers", customerServiceServ.getAll());
		map.put("customerService", new CustomerService());
		return "service/input";
	}

	// 保存 新建的客户服务
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String saveServ(CustomerService customerService) {
		cusServService.save(customerService);

		return "redirect:/service/allot/list";
	}

	@RequestMapping(value = "/{pageStr}/list")
	public String list(@RequestParam(value = "pageNo", required = false, defaultValue = "1") String pageNoStr,
			Map<String, Object> map, HttpServletRequest request, @PathVariable("pageStr") String pageStr)
					throws IOException {
		Page<CustomerService> page = new Page<>();
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

		Map<String, Object> conditions = new HashMap<>();
		conditions.put("matchPageStr", pageStr);
		page = cusServService.getPage(page, params, conditions);

		map.put("page", page);
		map.put("matchPageStr", pageStr);
		if ("allot".equals(pageStr)) {
			map.put("users", userService.getAll());
		}
		return "service/list";
	}

	// 更新 服务 的信息
	@RequestMapping(value = "/update/{pageStr}")
	public String update(@RequestParam(value = "id", required = true) String idStr,
			@PathVariable("pageStr") String pageStr,
			@RequestParam(value = "allotToId", required = false) Long allotToId,
			@RequestParam(value = "serviceDeal", required = false) String serviceDeal,
			@RequestParam(value = "dealResult", required = false) String dealResult,
			@RequestParam(value = "satisfy", required = false) String satisfy) {
		Long id = -1L;

		try {
			id = Long.parseLong(idStr);

			if (cusServService.get(id) != null) {
				CustomerService customerService = new CustomerService();
				customerService.setId(id);

				// 服务分配
				if ("allot".equals(pageStr)) {
					customerService.setAllotDate(new Date());
					User allotTo = new User();
					allotTo.setId(allotToId);
					customerService.setAllotTo(allotTo);
					customerService.setServiceState("已分配");
				}

				// 服务处理
				if ("deal".equals(pageStr)) {
					customerService.setServiceDeal(serviceDeal);
					customerService.setDealDate(new Date());
					customerService.setServiceState("已处理");
				}

				// 服务反馈
				if ("feedback".equals(pageStr)) {
					customerService.setDealResult(dealResult);
					customerService.setSatisfy(satisfy);
					customerService.setServiceState("已归档");
				}

				if (customerService.getServiceState() != "") {
					cusServService.update(customerService);

					return "redirect:/service/" + pageStr + "/list";
				}
			}

		} catch (NumberFormatException e) {
		}

		return "home/error";
	}

	// 服务分配页面 删除服务
	@RequestMapping(value = "/delete")
	public String delete(@RequestParam(value = "id", required = true) String idStr) {
		Long id = -1L;

		try {
			id = Long.parseLong(idStr);

			cusServService.delete(id);

			return "redirect:/service/allot/list";
		} catch (NumberFormatException e) {
		}

		return "home/error";
	}

	// 跳转到 编辑服务信息 的页面
	@RequestMapping(value = "/operation/{pageStr}")
	public String deal(@RequestParam(value = "id", required = true) String idStr, Map<String, Object> map,
			@PathVariable("pageStr") String pageStr) {
		Long id = -1L;

		try {
			id = Long.parseLong(idStr);

			CustomerService customerService = cusServService.get(id);
			if (customerService != null) {
				map.put("customerService", customerService);
				map.put("matchPageStr", pageStr);

				return "service/operation";
			}
		} catch (NumberFormatException e) {
		}

		return "home/error";
	}

}
