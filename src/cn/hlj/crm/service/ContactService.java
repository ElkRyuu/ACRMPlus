package cn.hlj.crm.service;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.hlj.crm.dao.ContactMapper;
import cn.hlj.crm.entity.Contact;

@Service
public class ContactService {

	@Autowired
	private ContactMapper contactMapper;

	@Transactional
	public void save(Contact contact) {
		contactMapper.save(contact);
	}

	@Transactional(readOnly = true)
	public Contact getContactById(Long id) {
		return contactMapper.getContactById(id);
	}

	@Transactional
	public void updateContact(Contact contact) {
		contactMapper.updateContact(contact);
	}

	@Transactional
	public void deleteContact(Long id) {
		contactMapper.deleteContact(id);
	}

	@Transactional(readOnly = true)
	public Set<Contact> getContactsByCusId(Long customerId) {
		return contactMapper.getContactsByCusId(customerId);
	}
}
