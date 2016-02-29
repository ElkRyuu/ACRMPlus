package cn.hlj.crm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import cn.hlj.crm.entity.SalesChance;
import cn.hlj.crm.entity.SalesPlan;

public interface SalesPlanMapper {

	@Select("SELECT id,plan_date \"date\",plan_result \"result\",todo,chance_id as \"chance.id\" " + "FROM sales_plan "
			+ "WHERE chance_id=#{id}")
	List<SalesPlan> getByChance(SalesChance chance);

	void save(SalesPlan salesPlan);

	//@Update("UPDATE sales_plan SET todo=#{todo} WHERE id=#{id}")
	void update(SalesPlan salesPlan);

	@Delete("DELETE FROM sales_plan WHERE id=#{id}")
	void delete(@Param("id") Long id);
}
