package cn.hlj.crm.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;

import cn.hlj.crm.entity.CustomerService;

public interface CusServMapper {

	@Insert("INSERT INTO customer_services(id,service_type,service_title,customer_id,service_state,service_request,created_id,create_date) "
			+ "VALUES(crm_seq.nextval,#{serviceType},#{serviceTitle},#{customer.id},#{serviceState},#{serviceRequest},#{createdby.id},#{createDate})")
	void save(CustomerService customerService);

	long getTotalElements(Map<String, Object> params);

	List<CustomerService> getContent(Map<String, Object> params);

	void update(CustomerService customerService);

	//@Select("SELECT id FROM customer_services WHERE id=#{id}")
	CustomerService get(@Param("id") Long id);
	
	@Delete("DELETE FROM customer_services WHERE id=#{id}")
	void delete(@Param("id") Long id);
}
