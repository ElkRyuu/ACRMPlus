package cn.hlj.crm.handler;

import java.io.IOException;
import java.util.Date;
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
import cn.hlj.crm.entity.CustomerDrain;
import cn.hlj.crm.orm.Page;
import cn.hlj.crm.service.CustomerDrainService;
import cn.hlj.crm.service.CustomerServiceServ;
import cn.hlj.crm.util.ParamsUtils;

@Controller
@RequestMapping("/drain")
public class DrainHandler {

	@Autowired
	private CustomerDrainService customerDrainService;

	@Autowired
	private CustomerServiceServ customerServiceServ;

	// 跳转到 客户流失管理 的页面
	@RequestMapping("/list")
	public String list(@RequestParam(value = "pageNo", required = false, defaultValue = "1") String pageNoStr,
			Map<String, Object> map, HttpServletRequest request) throws IOException {
		Page<CustomerDrain> page = new Page<>();

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

		page = customerDrainService.getPage(page, params);
		map.put("page", page);

		return "drain/list";
	}

	// 跳转到 暂缓流失/确认流失 的页面
	@RequestMapping(value = "/{type}/edit", method = RequestMethod.GET)
	public String edit(@PathVariable("type") String type, @RequestParam(value = "id", required = true) String idStr,
			Map<String, Object> map) {
		Long id = -1L;

		try {
			id = Long.parseLong(idStr);
			CustomerDrain drain = customerDrainService.getById(id);
			if (drain != null) {
				map.put("drain", drain);

				if ("delay".equals(type)) {
					map.put("saveType", "delay");
				} else if ("confirm".equals(type)) {
					map.put("saveType", "confirm");
				}

				return "drain/input";
			}

		} catch (NumberFormatException e) {
		}

		return "home/error";
	}

	// 保存 暂缓措施
	@RequestMapping(value = "/delay", method = RequestMethod.POST)
	@ResponseBody
	public String updateDrainDelay(CustomerDrain drain) {
		CustomerDrain customerDrain = customerDrainService.getById(drain.getId());
		if (customerDrain != null) {
			String delay = customerDrain.getDelay();
			delay = (delay == null) ? "" : (delay + "`");

			String newDelay = drain.getDelay();
			drain.setDelay(delay + newDelay);

			customerDrainService.updateDrain(drain);

			return newDelay;
		}

		return null;
	}

	// 保存 流失原因
	@RequestMapping(value = "/confirm", method = RequestMethod.POST)
	public String updateDrainReason(CustomerDrain drain) {

		drain.setDrainDate(new Date());
		drain.setStatus("流失");
		customerDrainService.updateDrain(drain);

		Customer customer = new Customer();
		customer.setId(drain.getCustomer().getId());
		customer.setState("流失");
		customerServiceServ.update(customer);

		return "redirect:/drain/list";
	}
}
