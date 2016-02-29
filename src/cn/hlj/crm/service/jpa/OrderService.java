package cn.hlj.crm.service.jpa;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import cn.hlj.crm.entity.Order;
import cn.hlj.crm.repository.OrderRepository;

@Service
public class OrderService {

	@Autowired
	private OrderRepository orderRepository;

	public Page<Order> getPage(int pageNo, int pageSize, final Long customerId) {
		Specification<Order> spec = new Specification<Order>() {

			@Override
			public Predicate toPredicate(Root<Order> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				return cb.equal(root.get("customer").get("id"), customerId);
			}
		};

		Pageable pageable = new PageRequest(pageNo, pageSize);

		return orderRepository.findAll(spec, pageable);
	}

	public Order getById(Long id) {
		return orderRepository.findOne(id);
	}
}
