package cn.hlj.crm.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.hlj.crm.dao.CustomerDrainMapper;
import cn.hlj.crm.entity.CustomerDrain;
import cn.hlj.crm.orm.Page;
import cn.hlj.crm.orm.PropertyFilter;
import cn.hlj.crm.util.ParamsUtils;

@Service
public class CustomerDrainService {

	@Autowired
	private CustomerDrainMapper customerDrainMapper;

	@Transactional
	public void add() {
		customerDrainMapper.callCheckDrainProcedure();
	}

	@Transactional(readOnly = true)
	public Page<CustomerDrain> getPage(Page<CustomerDrain> page, Map<String, Object> params) {
		// 1. 把 params 转为 PropertyFilter 的集合
		List<PropertyFilter> filters = PropertyFilter.parseParamsToPropertyFilters(params);

		// 2. 再把 PropertyFilter 的集合转为 mybatis 可以用的 Map.
		Map<String, Object> mybatisParams = ParamsUtils.parsePropertyFiltersToMybatisParams(filters);

		long totalElements = customerDrainMapper.getTotalElements(mybatisParams);
		page.setTotalElements(totalElements);

		int fromIndex = (page.getPageNo() - 1) * page.getPageSize() + 1;
		int endIndex = fromIndex + page.getPageSize();
		mybatisParams.put("firstIndex", fromIndex);
		mybatisParams.put("endIndex", endIndex);

		List<CustomerDrain> content = customerDrainMapper.getContent(mybatisParams);
		page.setContent(content);

		return page;
	}

	@Transactional(readOnly = true)
	public CustomerDrain getById(Long id) {
		return customerDrainMapper.getById(id);
	}

	@Transactional
	public void updateDrain(CustomerDrain drain) {
		customerDrainMapper.updateDrain(drain);
	}

}
