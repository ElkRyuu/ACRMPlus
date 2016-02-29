package cn.hlj.crm.service.jpa;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.hlj.crm.entity.CustomerActivity;
import cn.hlj.crm.repository.CustomerActivityRepository;

@Service
public class CustomerActivityService {

	@Autowired
	private CustomerActivityRepository activityRepository;

	public List<CustomerActivity> getByCustomerId(Long customerId) {
		return activityRepository.getByCustomerId(customerId);
	}

	public void save(CustomerActivity customerActivity) {
		activityRepository.saveAndFlush(customerActivity);
	}

	public CustomerActivity get(Long id) {
		return activityRepository.findOne(id);
	}

	public void delete(Long id) {
		activityRepository.delete(id);
	}
}
