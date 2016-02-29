package cn.hlj.crm.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

import cn.hlj.crm.entity.CustomerDrain;

public interface CustomerDrainMapper {

	@Update("{call check_drain}")
	void callCheckDrainProcedure();

	long getTotalElements(Map<String, Object> params);

	List<CustomerDrain> getContent(Map<String, Object> params);

	CustomerDrain getById(@Param("id") Long id);

	void updateDrain(CustomerDrain drain);
}
