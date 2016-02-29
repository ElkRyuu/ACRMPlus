package cn.hlj.crm.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.hlj.crm.orm.PropertyFilter;
import cn.hlj.crm.orm.PropertyFilter.MatchType;

public class ParamsUtils {

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static Map<String, Object> parsePropertyFiltersToMybatisParams(List<PropertyFilter> filters) {
		// 把 PropertyFilter 的 List 转为一个 myBatis 可用的 Map
		Map<String, Object> params = new HashMap<String, Object>();

		for (PropertyFilter filter : filters) {
			String propertyName = filter.getPropertyName();
			Object propertyVal = filter.getPropertyVal();

			if (propertyVal == null || propertyVal.toString().trim().equals("")) {
				continue;
			}

			// 1. 把页面传过来的字符串转为实际的目标类型.
			Class propertyType = filter.getPropertyType();
			propertyVal = ReflectionUtils.convertValue(propertyVal, propertyType);

			// 2. 若比较方式为LIKE, 则再 value 前后添加 %.
			MatchType matchType = filter.getMatchType();
			if (matchType.equals(MatchType.LIKE)) {
				propertyVal = "%" + propertyVal + "%";
			}

			params.put(propertyName, propertyVal);
		}

		return params;
	}

	public static String encodeParamsToQueryString(Map<String, Object> params) {
		StringBuilder result = new StringBuilder();

		for (Map.Entry<String, Object> param : params.entrySet()) {
			String key = param.getKey();
			Object val = param.getValue();

			if ("".equals(val)) {
				continue;
			}

			result.append("search_").append(key).append("=").append(val).append("&");
		}

		if (result.length() > 0) {
			result.replace(result.length() - 1, result.length(), "");
		}
		return result.toString();
	}
}
