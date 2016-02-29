package cn.hlj.crm.dao;

import java.util.Set;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import cn.hlj.crm.entity.Contact;

public interface ContactMapper {

	// @Insert("INSERT INTO contacts(id,name,tel,customer_id) " +
	// "VALUES(crm_seq.nextval,#{name},#{tel},#{customer.id})")
	void save(Contact contact);

	// cn.hlj.crm.dao.CustomerMapper.getWithContacts(Long) 的辅助方法
	@Select("SELECT id,memo,mobile,name,position,sex,tel FROM contacts WHERE customer_id=#{customerId}")
	Set<Contact> getContactsByCusId(Long customerId);

	@Select("SELECT id,name,sex,position,tel,mobile,memo FROM contacts WHERE id=#{id}")
	Contact getContactById(Long id);

	@Update("UPDATE contacts SET name=#{name},sex=#{sex},position=#{position},tel=#{tel},mobile=#{mobile},memo=#{memo} WHERE id=#{id}")
	void updateContact(Contact contact);

	@Delete("DELETE FROM contacts WHERE id=#{id}")
	void deleteContact(Long id);
}
