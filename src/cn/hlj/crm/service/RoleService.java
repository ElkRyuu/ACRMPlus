package cn.hlj.crm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.hlj.crm.dao.RoleMapper;
import cn.hlj.crm.entity.Role;

@Service
public class RoleService {

	@Autowired
	private RoleMapper roleMapper;

	@Transactional(readOnly = true)
	public List<Role> getAll() {
		return roleMapper.getAll();
	}
}
