package cn.hlj.crm.security;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;

@Component
public class FilterChainDefinitionMapBuilder {

	public Map<String, String> buildFilterChainDefinitionMap() {
		Map<String, String> map = new HashMap<String, String>();

		// 从数据库中读取受保护的资源信息
		System.out.println("<<buildFilterChainDefinitionMap>>");
		map.put("/chance/**", "roles[chance]");

		return map;
	}
}
