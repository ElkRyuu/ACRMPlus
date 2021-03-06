package cn.hlj.crm.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.hlj.crm.dao.SalesChanceMapper;
import cn.hlj.crm.entity.SalesChance;
import cn.hlj.crm.orm.Page;
import cn.hlj.crm.orm.PropertyFilter;
import cn.hlj.crm.util.ParamsUtils;

@Service
public class SalesChanceService {

	@Autowired
	private SalesChanceMapper salesChanceMapper;

	@Transactional(readOnly = true)
	public Page<SalesChance> getPage(Page<SalesChance> page) {
		long totalElements = salesChanceMapper.getTotalElements();
		page.setTotalElements(totalElements);

		int fromIndex = (page.getPageNo() - 1) * page.getPageSize() + 1;
		int endIndex = fromIndex + page.getPageSize();

		List<SalesChance> content = salesChanceMapper.getContent(fromIndex, endIndex);
		page.setContent(content);

		return page;
	}

	@Transactional
	public void save(SalesChance salesChance) {
		salesChanceMapper.save(salesChance);
	}

	@Transactional
	public void delete(Long id) {
		salesChanceMapper.delete(id);
	}

	@Transactional(readOnly = true)
	public SalesChance get(Long id) {
		return salesChanceMapper.get(id);
	}

	@Transactional
	public void update(SalesChance salesChance) {
		salesChanceMapper.update(salesChance);
	}

	@Transactional(readOnly = true)
	public Page<SalesChance> getPage(Page<SalesChance> page, Map<String, Object> params) {
		// 1. 把 params 转为 PropertyFilter 的集合
		List<PropertyFilter> filters = PropertyFilter.parseParamsToPropertyFilters(params);

		// 2. 再把 PropertyFilter 的集合转为 mybatis 可以用的 Map.
		Map<String, Object> mybatisParams = ParamsUtils.parsePropertyFiltersToMybatisParams(filters);

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
	public SalesChance getWithPlans(Long id) {
		return salesChanceMapper.getWithPlans(id);
	}

}
