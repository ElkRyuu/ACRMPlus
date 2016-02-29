package cn.hlj.crm.service.jpa;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import cn.hlj.crm.entity.Customer;
import cn.hlj.crm.repository.ReportRepository;

@Service
public class ReportService {

	@Autowired
	private ReportRepository reportRepository;

	public Page<Customer> getPayPage(int pageNo, int pageSize, Map<String, Object> params) {
		return reportRepository.getPayPage(pageNo, pageSize, params);
	}

	public Page<Object[]> getConsistPage(int pageNo, int pageSize, String type) {
		return reportRepository.getConsistPage(pageNo, pageSize, type);
	}

	public Page<Object[]> getServicePage(int pageNo, int pageSize, Map<String, Object> params) {
		return reportRepository.getServicePage(pageNo, pageSize, params);
	}
}
