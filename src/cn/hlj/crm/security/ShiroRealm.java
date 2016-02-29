package cn.hlj.crm.security;

import java.util.HashSet;
import java.util.Set;

import javax.annotation.PostConstruct;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import cn.hlj.crm.entity.Authority;
import cn.hlj.crm.entity.User;
import cn.hlj.crm.service.UserService;

@Component("realm")
public class ShiroRealm extends AuthorizingRealm {

	@Autowired
	private UserService userService;

	// 用于授权的方法
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		Object principal = principals.getPrimaryPrincipal();
		User user = (User) principal;

		Set<String> roles = new HashSet<>();
		for (Authority authority : user.getRole().getAuthorities()) {
			roles.add(authority.getName());
		}

		return new SimpleAuthorizationInfo(roles);
	}

	// 用于认证的方法
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		UsernamePasswordToken upt = (UsernamePasswordToken) token;

		// 1. 获取登录名 name
		String name = upt.getUsername();

		// 2. 依据 name 从DB中获取对应的记录
		User user = userService.getByName(name);

		// 3. 把对应的记录封装为 SimpleAuthenticationInfo 对象并返回
		Object principal = user;
		Object hashedCredentials = user.getPassword();
		ByteSource credentialsSalt = ByteSource.Util.bytes(user.getSalt());
		String realmName = getName();

		return new SimpleAuthenticationInfo(principal, hashedCredentials, credentialsSalt, realmName);
	}

	// 配置使用 MD5 盐值加密
	@PostConstruct // 相当于 init-method. 即在构造器执行后执行的方法
	public void initCredentialsMatcher() {
		HashedCredentialsMatcher credentialsMatcher = new HashedCredentialsMatcher();
		credentialsMatcher.setHashAlgorithmName("Md5");
		credentialsMatcher.setHashIterations(1024);

		// 更新当前的 Service 的 CrendialsMatcher 属性
		setCredentialsMatcher(credentialsMatcher);
	}

	public static void main(String[] args) {
		String algorithmName = "MD5";
		String source = "123456";
		ByteSource salt = ByteSource.Util.bytes("e2b87e6eced06509");
		int iterations = 1024;

		SimpleHash result = new SimpleHash(algorithmName, source, salt, iterations);
		System.out.println(result);
	}

}
