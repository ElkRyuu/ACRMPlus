package cn.hlj.crm.handler;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import cn.hlj.crm.entity.User;
import cn.hlj.crm.orm.Page;
import cn.hlj.crm.service.RoleService;
import cn.hlj.crm.service.UserService;
import cn.hlj.crm.util.ParamsUtils;

@Controller
@RequestMapping("/user")
public class UserHandler {

	@Autowired
	private UserService userService;

	@Autowired
	private RoleService roleService;

	@Autowired
	private ResourceBundleMessageSource messageSource;

	@SuppressWarnings({ "rawtypes", "unchecked" })
	private static Map<Integer, String> statuses = new HashMap();

	{
		statuses.put(1, "有效");
		statuses.put(0, "无效");
	}

	@RequestMapping("/shiro-login")
	public String shiroLogin(@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "password", required = false) String password, RedirectAttributes attributes,
			Locale locale, HttpSession session) {

		Subject currentUser = SecurityUtils.getSubject();

		if (!currentUser.isAuthenticated()) {
			UsernamePasswordToken token = new UsernamePasswordToken(username, password);
			token.setRememberMe(true);

			try {
				currentUser.login(token);

				// 如何能够访问到已经在 Realm 中获取到的 User 的实例.
				Object principal = SecurityUtils.getSubject().getPrincipals().getPrimaryPrincipal();
				session.setAttribute("user", principal);
			} catch (AuthenticationException e) {
				attributes.addFlashAttribute("message", messageSource.getMessage("error.crm.user.login", null, locale));
				// 重定向的页面必须是由 SpringMVC 映射过的页面. 而不能直接是目标页面
				// return "redirect:/index.jsp";
				return "redirect:/index";
			}
		}

		return "home/success";
	}

	// 登录
	@RequestMapping("/login")
	public String login(@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "password", required = false) String password, RedirectAttributes attributes,
			Locale locale, HttpSession session) {

		User user = userService.login(username, password);

		if (user == null) {
			attributes.addFlashAttribute("message", messageSource.getMessage("error.crm.user.login", null, locale));
			// 重定向的页面必须是由 SpringMVC 映射过的页面. 而不能直接是目标页面
			// return "redirect:/index.jsp";
			return "redirect:/index";
		}

		// 把user放到 Session 中
		session.setAttribute("user", user);
		return "home/success";
	}

	@RequestMapping("/list")
	public String list(@RequestParam(value = "pageNo", required = false, defaultValue = "1") String pageNoStr,
			Map<String, Object> map, HttpServletRequest request) {
		Page<User> page = new Page<>();

		int pageNo = 1;
		try {
			pageNo = Integer.parseInt(pageNoStr);
		} catch (Exception e) {
		}

		page.setPageNo(pageNo);

		// 1. 获取 search_ 开头的请求参数的 Map
		Map<String, Object> params = WebUtils.getParametersStartingWith(request, "search_");

		// 2. 把 params 再序列化为一个查询字符串
		String queryString = ParamsUtils.encodeParamsToQueryString(params);

		// 3. 把查询字符串传回到页面
		map.put("queryString", queryString);

		page = userService.getPage(page, params);
		map.put("page", page);
		return "user/list";
	}

	// 跳转到 新建用户 页面
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String create(Map<String, Object> map) {
		map.put("user", new User());
		map.put("roles", roleService.getAll());
		map.put("statuses", statuses);
		return "user/input";
	}

	// 保存
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String create(User user) {
		userService.save(user);
		return "redirect:/user/list";
	}

	// 删除
	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	public String delete(@PathVariable("id") String idStr) {
		Long id = -1L;

		try {
			id = Long.parseLong(idStr);

			userService.delete(id);
		} catch (NumberFormatException e) {
		}
		return "redirect:/user/list";
	}

	// 跳转到 修改页面
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String edit(@PathVariable("id") String idStr, Map<String, Object> map) {
		Long id = -1L;

		try {
			id = Long.parseLong(idStr);

			User user = userService.get(id);
			if (user != null) {
				map.put("user", user);
				map.put("roles", roleService.getAll());
				map.put("statuses", statuses);
				return "user/input";
			}
		} catch (NumberFormatException e) {
		}

		return "home/error";
	}

	// 修改
	@RequestMapping(value = "/", method = RequestMethod.PUT)
	public String update(User user, @RequestParam(value = "password_update", required = false) String password) {
		if ("".equals(user.getPassword())) {
			user.setPassword(password);
		}

		userService.update(user);
		return "redirect:/user/list";
	}
}
