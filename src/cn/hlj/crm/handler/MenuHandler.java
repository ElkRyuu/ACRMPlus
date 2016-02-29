package cn.hlj.crm.handler;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.hlj.crm.entity.Authority;
import cn.hlj.crm.entity.User;
import net.sf.navigator.menu.MenuComponent;
import net.sf.navigator.menu.MenuRepository;

@Controller
public class MenuHandler {

	@RequestMapping("/menu-list")
	public String menuList(HttpServletRequest request) {
		// 1. 获取当前登录用户的信息
		User user = (User) request.getSession().getAttribute("user");

		ServletContext servletContext = request.getSession().getServletContext();
		String contextPath = servletContext.getContextPath();

		// 存放 StrutsMenu 的容器
		MenuRepository repository = new MenuRepository();
		MenuRepository defaultRepository = (MenuRepository) servletContext
				.getAttribute(MenuRepository.MENU_REPOSITORY_KEY);
		repository.setDisplayers(defaultRepository.getDisplayers());

		// 实际的 Menu
		MenuComponent mc = new MenuComponent();
		// 为 MenuComponent 的 name 属性赋值
		mc.setName("crmMenu");
		// 为 MenuComponent 设置 title 属性
		mc.setTitle("CRM");
		// 若当前 Menu 为父 Menu, 则不需要 设置 location 属性
		// mc.setLocation("http://www.hlj.cn");

		Map<String, MenuComponent> pms = new HashMap<String, MenuComponent>();
		for (Authority authority : user.getRole().getAuthorities()) {
			MenuComponent m = new MenuComponent();
			m.setName(authority.getName());
			m.setTitle(authority.getDisplayName());
			m.setLocation(contextPath + authority.getUrl());

			// 获取当前 Menu 的父 Menu
			Authority parentAuthority = authority.getParentAuthority();
			String key = parentAuthority.getId() + "";
			MenuComponent pm = pms.get(key);
			if (pm == null) {
				pm = new MenuComponent();
				pm.setName(key);
				pm.setTitle(parentAuthority.getDisplayName());
				pm.setParent(mc);

				pms.put(key, pm);
			}

			m.setParent(pm);
		}

		// 把 Menu 放到 repository 中
		repository.addMenu(mc);

		request.setAttribute("repository", repository);

		// return "forward:/test/menu.jsp";
		return "home/menu";
	}
}
