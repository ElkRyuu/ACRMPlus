package cn.hlj.crm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import cn.hlj.crm.entity.Role;

public interface RoleMapper {
	
	@Select("SELECT id,description,enabled,name FROM roles")
	List<Role> getAll();
}
