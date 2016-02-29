package cn.hlj.crm.repository;

import java.util.List;

import cn.hlj.crm.entity.CustomerActivity;

public interface CustomerActivityRepository extends BaseRepository<CustomerActivity, Long> {

	List<CustomerActivity> getByCustomerId(Long customerId);

}
