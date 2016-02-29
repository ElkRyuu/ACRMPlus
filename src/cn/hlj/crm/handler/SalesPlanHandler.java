package cn.hlj.crm.handler;

import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import cn.hlj.crm.entity.SalesChance;
import cn.hlj.crm.entity.SalesPlan;
import cn.hlj.crm.entity.User;
import cn.hlj.crm.orm.Page;
import cn.hlj.crm.service.SalesChanceService;
import cn.hlj.crm.service.SalesPlanService;
import cn.hlj.crm.service.UserService;
import cn.hlj.crm.util.ParamsUtils;

@Controller
@RequestMapping("/plan")
public class SalesPlanHandler {

	@Autowired
	private SalesPlanService salesPlanService;

	@Autowired
	private SalesChanceService salesChanceService;

	@Autowired
	private UserService userService;

	// 客户开发计划 的列表
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(@RequestParam(value = "pageNo", required = false, defaultValue = "1") String pageNoStr,
			Map<String, Object> map, HttpServletRequest request, HttpSession session) throws IOException {
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

		Map<String, Object> conditions = new HashMap<>();
		conditions.put("status", 1);
		Object user = session.getAttribute("user");
		if (user != null) {
			conditions.put("designeeId", ((User) user).getId());
			page = salesPlanService.getPage(page, params, conditions);
		}

		map.put("page", page);
		return "plan/list";
	}

	// 跳转到 制定销售计划 的页面
	@RequestMapping(value = "/make/{id}", method = RequestMethod.GET)
	public String make(@PathVariable("id") String idStr, Map<String, Object> map) {
		Long id = -1L;

		try {
			id = Long.parseLong(idStr);

			// 获取 销售机会的信息
			SalesChance chance = salesChanceService.get(id);
			if (chance != null) {
				// 将指派人信息设置到SalesChance里
				User designee = chance.getDesignee();
				designee.setName(userService.get(designee.getId()).getName());
				chance.setDesignee(designee);
				// 将销售计划设置到SalesChance里
				chance.setSalesPlans(new LinkedHashSet<>(salesPlanService.getByChance(chance)));
				map.put("chance", chance);
			}

			return "plan/make";
		} catch (NumberFormatException e) {
		}

		return "home/error";

	}

	// 新建 销售计划
	@RequestMapping(value = "/make/{id}", method = RequestMethod.POST)
	@ResponseBody
	public SalesPlan newPlan(@PathVariable("id") String idStr, SalesPlan salesPlan) {
		SalesChance chance = new SalesChance();
		chance.setId(Long.parseLong(idStr));
		salesPlan.setChance(chance);

		try {
			salesPlanService.save(salesPlan);
			return salesPlan;
		} catch (Exception e) {
		}

		return null;
	}

	// 更新 销售计划
	@RequestMapping(value = "/make", method = RequestMethod.PUT)
	@ResponseBody
	public SalesPlan updatePlan(@RequestBody MultiValueMap<String, String> valueMap) {
		SalesPlan salesPlan = new SalesPlan();

		String idStr = valueMap.get("id").get(0);
		Long id = Long.parseLong(idStr);
		salesPlan.setId(id);

		if (valueMap.get("todo") != null) {
			String todo = valueMap.get("todo").get(0);
			salesPlan.setTodo(todo);
		}

		if (valueMap.get("result") != null) {
			String result = valueMap.get("result").get(0);
			salesPlan.setResult(result);
		}

		salesPlanService.update(salesPlan);
		return salesPlan;
	}

	// 删除销售计划
	@RequestMapping(value = "/make/{id}", method = RequestMethod.DELETE)
	@ResponseBody
	public int deletePlan(@PathVariable("id") String idStr) {
		Long id = -1L;

		try {
			id = Long.parseLong(idStr);

			salesPlanService.delete(id);
			return 1;
		} catch (NumberFormatException e) {
		}

		return 0;
	}

	// 跳转到 执行销售计划 的页面
	@RequestMapping(value = "/execute/{chanceId}", method = RequestMethod.GET)
	public String execute(@PathVariable("chanceId") String idStr, Map<String, Object> map) {
		Long id = -1L;

		try {
			id = Long.parseLong(idStr);

			// 获取 销售机会的信息
			SalesChance chance = salesChanceService.get(id);
			if (chance != null) {
				// 将指派人信息设置到SalesChance里
				User designee = chance.getDesignee();
				designee.setName(userService.get(designee.getId()).getName());
				chance.setDesignee(designee);
				// 将销售计划设置到SalesChance里
				chance.setSalesPlans(new LinkedHashSet<>(salesPlanService.getByChance(chance)));
				map.put("chance", chance);
			}

			return "plan/execute";
		} catch (NumberFormatException e) {
		}

		return "home/error";
	}

	// 开发成功或失败查看其详细信息
	@RequestMapping(value = "/detail/{chanceId}")
	public String detail(@PathVariable("chanceId") String idStr, Map<String, Object> map) {
		Long id = -1L;

		try {
			id = Long.parseLong(idStr);

			// 获取 SalesChance
			SalesChance chance = salesChanceService.getWithPlans(id);
			if (chance != null) {
				map.put("chance", chance);

				return "plan/detail";
			}
		} catch (NumberFormatException e) {
		}

		return "home/error";
	}
}
