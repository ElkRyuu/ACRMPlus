package cn.hlj.crm.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.hlj.crm.dao.CusServMapper;
import cn.hlj.crm.entity.CustomerService;
import cn.hlj.crm.orm.Page;
import cn.hlj.crm.orm.PropertyFilter;
import cn.hlj.crm.util.ParamsUtils;

@Service
public class CusServService {

	@Autowired
	private CusServMapper cusServMapper;

	@Transactional
	public void save(CustomerService customerService) {
		cusServMapper.save(customerService);
	}

	@Transactional(readOnly = true)
	public Page<CustomerService> getPage(Page<CustomerService> page, Map<String, Object> params,
			Map<String, Object> conditions) {
		// 1. 把 params 转为 PropertyFilter 的集合
		List<PropertyFilter> filters = PropertyFilter.parseParamsToPropertyFilters(params);

		// 2. 再把 PropertyFilter 的集合转为 mybatis 可以用的 Map.
		Map<String, Object> mybatisParams = ParamsUtils.parsePropertyFiltersToMybatisParams(filters);

		if (conditions.get("matchPageStr") != null) {
			mybatisParams.put("matchPageStr", conditions.get("matchPageStr"));
		}

		long totalElements = cusServMapper.getTotalElements(mybatisParams);
		page.setTotalElements(totalElements);

		int fromIndex = (page.getPageNo() - 1) * page.getPageSize() + 1;
		int endIndex = fromIndex + page.getPageSize();
		mybatisParams.put("firstIndex", fromIndex);
		mybatisParams.put("endIndex", endIndex);

		List<CustomerService> content = cusServMapper.getContent(mybatisParams);
		page.setContent(content);

		return page;
	}

	@Transactional
	public void update(CustomerService customerService) {
		cusServMapper.update(customerService);
	}

	@Transactional(readOnly = true)
	public CustomerService get(Long id) {
		return cusServMapper.get(id);
	}

	@Transactional
	public void delete(Long id) {
		cusServMapper.delete(id);
	}
}
