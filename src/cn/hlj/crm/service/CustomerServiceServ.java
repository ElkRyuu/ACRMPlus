package cn.hlj.crm.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.hlj.crm.dao.CustomerMapper;
import cn.hlj.crm.entity.Customer;
import cn.hlj.crm.orm.Page;
import cn.hlj.crm.orm.PropertyFilter;
import cn.hlj.crm.util.ParamsUtils;

@Service
public class CustomerServiceServ {

	@Autowired
	private CustomerMapper customerMapper;

	@Transactional
	public void save(Customer customer) {
		customerMapper.save(customer);
	}

	@Transactional(readOnly = true)
	public Customer getWithContacts(Long id) {
		return customerMapper.getWithContacts(id);
	}

	@Transactional(readOnly = true)
	public List<Customer> getAll() {
		return customerMapper.getAll();
	}

	@Transactional(readOnly = true)
	public Page<Customer> getPage(Page<Customer> page, Map<String, Object> params) {
		// 1. 把 params 转为 PropertyFilter 的集合
		List<PropertyFilter> filters = PropertyFilter.parseParamsToPropertyFilters(params);

		// 2. 再把 PropertyFilter 的集合转为 mybatis 可以用的 Map.
		Map<String, Object> mybatisParams = ParamsUtils.parsePropertyFiltersToMybatisParams(filters);

		long totalElements = customerMapper.getTotalElements(mybatisParams);
		page.setTotalElements(totalElements);

		int fromIndex = (page.getPageNo() - 1) * page.getPageSize() + 1;
		int endIndex = fromIndex + page.getPageSize();
		mybatisParams.put("firstIndex", fromIndex);
		mybatisParams.put("endIndex", endIndex);

		List<Customer> content = customerMapper.getContent(mybatisParams);
		page.setContent(content);

		return page;
	}

	@Transactional(readOnly = true)
	public Customer get(Long id) {
		return customerMapper.get(id);
	}

	@Transactional
	public void update(Customer customer) {
		customerMapper.update(customer);
	}
}
