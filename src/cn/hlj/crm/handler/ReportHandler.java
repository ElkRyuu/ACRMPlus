package cn.hlj.crm.handler;

import java.awt.Font;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PiePlot;
import org.jfree.chart.plot.PiePlot3D;
import org.jfree.chart.servlet.ServletUtilities;
import org.jfree.chart.title.TextTitle;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.data.general.PieDataset;
import org.jfree.util.Rotation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.WebUtils;

import cn.hlj.crm.entity.Customer;
import cn.hlj.crm.entity.CustomerDrain;
import cn.hlj.crm.service.CustomerDrainService;
import cn.hlj.crm.service.jpa.ReportService;
import cn.hlj.crm.util.ParamsUtils;

@Controller
@RequestMapping("/report")
public class ReportHandler {

	@Autowired
	private ReportService reportService;

	@Autowired
	private CustomerDrainService customerDrainService;

	// 跳转到 客户贡献分析 页面
	@RequestMapping(value = "/pay", method = RequestMethod.GET)
	public String toPayPage(@RequestParam(value = "pageNo", required = false, defaultValue = "1") String pageNoStr,
			HttpServletRequest request, Map<String, Object> map) throws IOException {

		int pageNo = 0;
		try {
			pageNo = Integer.parseInt(pageNoStr) - 1;
		} catch (Exception e) {
		}

		int pageSize = 3;

		// 1. 获取 search_ 开头的请求参数的 Map
		Map<String, Object> params = WebUtils.getParametersStartingWith(request, "search_");

		// 2. 把 params 再序列化为一个查询字符串
		String queryString = ParamsUtils.encodeParamsToQueryString(params);

		// 3. 把查询字符串传回到页面
		map.put("queryString", queryString);

		Page<Customer> page = reportService.getPayPage(pageNo, pageSize, params);
		map.put("page", page);

		Map<String, Object> data = new HashMap<>();
		for (Customer customer : page.getContent()) {
			data.put(customer.getName(), customer.getOrderMoney());
		}
		String imgUrl = createChartImg(data, request);
		map.put("imgUrl", imgUrl);

		return "report/pay";
	}

	// 跳转到 客户构成分析 的页面
	@RequestMapping(value = "/consist", method = RequestMethod.GET)
	public String toConsistPage(@RequestParam(value = "pageNo", required = false, defaultValue = "1") String pageNoStr,
			HttpServletRequest request, Map<String, Object> map) throws IOException {

		int pageNo = 0;
		try {
			pageNo = Integer.parseInt(pageNoStr) - 1;
		} catch (Exception e) {
		}

		int pageSize = 2;

		// 1. 获取 search_ 开头的请求参数的 Map
		Map<String, Object> params = WebUtils.getParametersStartingWith(request, "search_");

		// 2. 把 params 再序列化为一个查询字符串
		String queryString = ParamsUtils.encodeParamsToQueryString(params);

		// 3. 把查询字符串传回到页面
		map.put("queryString", queryString);

		String type = (String) params.get("type");
		if (type == null) {
			type = "level";
		}
		Page<Object[]> page = reportService.getConsistPage(pageNo, pageSize, type);
		map.put("page", page);

		Map<String, Object> data = new HashMap<>();
		for (Object[] objects : page.getContent()) {
			data.put((String) objects[0], objects[1]);
		}
		String imgUrl = createChartImg(data, request);
		map.put("imgUrl", imgUrl);

		return "report/consist";
	}

	// 跳转到 客户服务分析 的页面
	@RequestMapping(value = "/service", method = RequestMethod.GET)
	public String toServicePage(@RequestParam(value = "pageNo", required = false, defaultValue = "1") String pageNoStr,
			HttpServletRequest request, Map<String, Object> map) throws IOException {

		int pageNo = 0;
		try {
			pageNo = Integer.parseInt(pageNoStr) - 1;
		} catch (Exception e) {
		}

		int pageSize = 2;

		// 1. 获取 search_ 开头的请求参数的 Map
		Map<String, Object> params = WebUtils.getParametersStartingWith(request, "search_");

		// 2. 把 params 再序列化为一个查询字符串
		String queryString = ParamsUtils.encodeParamsToQueryString(params);

		// 3. 把查询字符串传回到页面
		map.put("queryString", queryString);

		Page<Object[]> page = reportService.getServicePage(pageNo, pageSize, params);
		map.put("page", page);

		Map<String, Object> data = new HashMap<>();
		for (Object[] objects : page.getContent()) {
			data.put((String) objects[0], objects[1]);
		}
		String imgUrl = createChartImg(data, request);
		map.put("imgUrl", imgUrl);

		return "report/service";
	}

	// 跳转到 客户流失分析 的页面
	@RequestMapping(value = "/drain", method = RequestMethod.GET)
	public String toDrainPage(@RequestParam(value = "pageNo", required = false, defaultValue = "1") String pageNoStr,
			HttpServletRequest request, Map<String, Object> map) {
		cn.hlj.crm.orm.Page<CustomerDrain> page = new cn.hlj.crm.orm.Page<>();

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

		page = customerDrainService.getPage(page, params);
		map.put("page", page);

		return "report/drain";
	}

	// ============================================================================================================

	private String createChartImg(Map<String, Object> map, HttpServletRequest request) throws IOException {
		PieDataset paramPieDataset = createDataset(map);
		JFreeChart chart = createChart(paramPieDataset);

		String fileName = ServletUtilities.saveChartAsPNG(chart, 500, 270, request.getSession());
		String url = request.getContextPath() + "/DisplayChart/show?filename=" + fileName;

		return url;
	}

	private PieDataset createDataset(Map<String, Object> map) {
		DefaultPieDataset localDefaultPieDataset = new DefaultPieDataset();

		for (Map.Entry<String, Object> entry : map.entrySet()) {
			if (entry.getKey() == null || entry.getKey().trim() == "") {
				localDefaultPieDataset.setValue("", (long) entry.getValue());
			} else {
				localDefaultPieDataset.setValue(entry.getKey(), (long) entry.getValue());
			}
		}

		return localDefaultPieDataset;
	}

	private JFreeChart createChart(PieDataset paramPieDataset) {
		JFreeChart localJFreeChart = ChartFactory.createPieChart3D("Pie Chart 3D", paramPieDataset, true, true, false);
		PiePlot3D localPiePlot3D = (PiePlot3D) localJFreeChart.getPlot();
		localPiePlot3D.setDarkerSides(true);
		localPiePlot3D.setStartAngle(290.0D);
		localPiePlot3D.setDirection(Rotation.CLOCKWISE);
		localPiePlot3D.setForegroundAlpha(0.5F);
		localPiePlot3D.setNoDataMessage("No data to display");

		// 解决乱码需要置换字体
		Font font = new Font("微软雅黑", Font.PLAIN, 14);
		TextTitle txtTitle = null;
		txtTitle = localJFreeChart.getTitle();
		txtTitle.setFont(font);
		PiePlot pieplot = (PiePlot) localJFreeChart.getPlot();
		pieplot.setLabelFont(font);

		localJFreeChart.getLegend().setItemFont(font);
		return localJFreeChart;
	}
}
