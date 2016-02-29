package cn.hlj.crm.service.jpa;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.hlj.crm.entity.Dict;
import cn.hlj.crm.repository.DictRepository;

@Service
public class DictService extends BaseService<Dict, Long> {

	@Autowired
	private DictRepository dictRepository;

	public List<String> getItemsByType(String type) {
		return dictRepository.getItemsByType(type);
	}
}
