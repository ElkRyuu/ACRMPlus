package cn.hlj.crm.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.hlj.crm.dao.SalesChanceMapper;
import cn.hlj.crm.dao.SalesPlanMapper;
import cn.hlj.crm.entity.SalesChance;
import cn.hlj.crm.entity.SalesPlan;
import cn.hlj.crm.orm.Page;
import cn.hlj.crm.orm.PropertyFilter;
import cn.hlj.crm.util.ParamsUtils;

@Service
public class SalesPlanService {

	@Autowired
	private SalesChanceMapper salesChanceMapper;

	@Autowired
	private SalesPlanMapper salesPlanMapper;

	@Transactional(readOnly = true)
	public Page<SalesChance> getPage(Page<SalesChance> page, Map<String, Object> params,
			Map<String, Object> conditions) {
		// 1. 把 params 转为 PropertyFilter 的集合
		List<PropertyFilter> filters = PropertyFilter.parseParamsToPropertyFilters(params);

		// 2. 再把 PropertyFilter 的集合转为 mybatis 可以用的 Map.
		Map<String, Object> mybatisParams = ParamsUtils.parsePropertyFiltersToMybatisParams(filters);

		if (conditions.get("status") != null) {
			mybatisParams.put("status", conditions.get("status"));
		}

		if (conditions.get("designeeId") != null) {
			mybatisParams.put("designeeId", conditions.get("designeeId"));
		}

		long totalElements = salesChanceMapper.getTotalElementsWithConditions(mybatisParams);
		page.setTotalElements(totalElements);

		int fromIndex = (page.getPageNo() - 1) * page.getPageSize() + 1;
		int endIndex = fromIndex + page.getPageSize();
		mybatisParams.put("firstIndex", fromIndex);
		mybatisParams.put("endIndex", endIndex);

		List<SalesChance> content = salesChanceMapper.getContentWithConditions(mybatisParams);
		page.setContent(content);

		return page;
	}

	@Transactional(readOnly = true)
	public List<SalesPlan> getByChance(SalesChance chance) {
		return salesPlanMapper.getByChance(chance);
	}

	@Transactional
	public void save(SalesPlan salesPlan) {
		salesPlanMapper.save(salesPlan);
	}

	@Transactional
	public void update(SalesPlan salesPlan) {
		salesPlanMapper.update(salesPlan);
	}

	@Transactional
	public void delete(Long id) {
		salesPlanMapper.delete(id);
	}
}
