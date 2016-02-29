package cn.hlj.crm.handler;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.hlj.crm.entity.Contact;
import cn.hlj.crm.entity.Customer;
import cn.hlj.crm.service.ContactService;

@Controller
@RequestMapping("/contact")
public class ContactHandler {

	private List<String> genders = null;

	{
		genders = new ArrayList<>();
		genders.add("男");
		genders.add("女");
	}

	@Autowired
	private ContactService contactService;

	// 跳转到 新建联系人 的页面
	@RequestMapping(value = "/create/{customerId}", method = RequestMethod.GET)
	public String toAddPage(@PathVariable("customerId") String customerId, Map<String, Object> map) {
		Contact contact = new Contact();

		Customer customer = new Customer();
		customer.setId(Long.parseLong(customerId));
		contact.setCustomer(customer);

		map.put("contact", contact);
		map.put("genders", genders);
		return "contact/input";
	}

	// 保存联系人
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String saveContact(Contact contact) {
		if (contact.getPosition() != null && contact.getPosition().trim() != "" && contact.getTel() != null
				&& contact.getTel() != "") {
			contactService.save(contact);
			return "redirect:/customer/contact/list/" + contact.getCustomer().getId();
		}

		return "home/error";
	}

	// 跳转到 修改联系人 的页面
	@RequestMapping(value = "/update/{customerId}/{id}", method = RequestMethod.GET)
	public String toUpdatePage(@PathVariable("customerId") String customerId, @PathVariable("id") String idStr,
			Map<String, Object> map) {
		Long id = -1L;

		try {
			id = Long.parseLong(idStr);

			Contact contact = contactService.getContactById(id);
			if (contact != null) {
				Customer customer = new Customer();
				customer.setId(Long.parseLong(customerId));
				contact.setCustomer(customer);

				map.put("contact", contact);
				map.put("genders", genders);
				return "contact/input";
			}
		} catch (NumberFormatException e) {
		}

		return "home/error";
	}

	// 更新联系人
	@RequestMapping(value = "/create", method = RequestMethod.PUT)
	public String updateContact(Contact contact) {
		contactService.updateContact(contact);

		return "redirect:/customer/contact/list/" + contact.getCustomer().getId();
	}

	// 删除联系人
	@RequestMapping(value = "/delete/{customerId}/{id}", method = RequestMethod.DELETE)
	public String deleteContact(@PathVariable("customerId") String customerId, @PathVariable("id") String idStr) {
		Long id = -1L;

		try {
			id = Long.parseLong(idStr);

			contactService.deleteContact(id);
			return "redirect:/customer/contact/list/" + customerId;
		} catch (NumberFormatException e) {
		}

		return "home/error";
	}
}
