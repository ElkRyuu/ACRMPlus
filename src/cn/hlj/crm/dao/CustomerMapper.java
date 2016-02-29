package cn.hlj.crm.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import cn.hlj.crm.entity.Customer;

public interface CustomerMapper {

	// @Insert("INSERT INTO customers(id,name,no,state) " +
	// "VALUES(crm_seq.nextval,#{name},#{no},#{state})")
	void save(Customer customer);

	@Select("SELECT id,no,name FROM customers WHERE id=#{id}")
	@Results({ @Result(id = true, property = "id", column = "id"), @Result(property = "no", column = "no"),
			@Result(property = "name", column = "name"),
			@Result(property = "contacts", column = "id", many = @Many(select = "cn.hlj.crm.dao.ContactMapper.getContactsByCusId") ) })
	Customer getWithContacts(Long id);

	@Select("SELECT id,name FROM customers")
	List<Customer> getAll();

	long getTotalElements(Map<String, Object> params);

	List<Customer> getContent(Map<String, Object> params);

	Customer get(@Param("id") Long id);

	void update(Customer customer);
}
