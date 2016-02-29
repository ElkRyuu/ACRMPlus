package cn.hlj.crm.test;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 通过自定义视图的方式来整合 JFreeChart.
 * 
 * 1. 自定义一个视图对象. 通常需要继承 AbstractView 2. 把自定义的视图配置为 IOC 中的 bean 2. 在 SpringMVC
 * 的配置文件中配置 BeanNameViewResolver 来解析自定义的视图
 * 
 * 注意: 若需要配置多个视图解析器, 则常用的视图解析器应该定义的优先级 低. 即 order 属性值 大!
 * 
 * BeanNameViewResolver 视图解析器解析自定义视图的流程 1. 目标方法返回自定义视图在 IOC 容器中的 id. 2.
 * BeanNameViewResolver 视图解析器从 IOC 容器中获取 id 对应的视图 bean, 并返回 3. SpringMVC 调用 View
 * 的 render 方法, 即调用自定义视图的 renderMergedOutputModel
 */
@Controller
public class JFreeChartTest {

	/**
	 * 把业务方法和视图的具体实现分开. 在编写业务方法和 handler 方法时, 不需要关心具体视图的实现.
	 * 
	 */
	@RequestMapping("/testView")
	public String testView(Map<String, Object> map) {

		// 调用模型方法, 得到模型数据. 把模型数据放入到 Map 中
		map.put("AA", 11);
		map.put("BB", 15);
		map.put("CC", 19);
		map.put("你好DD", 31);
		map.put("EE", 51);

		// 返回视图.
		return "customView";
	}
	
	
	/*@RequestMapping("/testJfreeChart")
	public void testJfreeChart(HttpServletResponse response) throws IOException {
		PieDataset paramPieDataset = createDataset();
		JFreeChart chart = createChart(paramPieDataset);
		
		//直接把结果输出到输出流中
		ChartUtilities.writeChartAsJPEG(response.getOutputStream(), chart, 500, 270);
	}
	
	private PieDataset createDataset() {
		DefaultPieDataset localDefaultPieDataset = new DefaultPieDataset();
		localDefaultPieDataset
				.setValue("Java", new Double(43.200000000000003D));
		localDefaultPieDataset.setValue("Visual Basic", new Double(10.0D));
		localDefaultPieDataset.setValue("C/C++", new Double(17.5D));
		localDefaultPieDataset.setValue("PHP", new Double(32.5D));
		localDefaultPieDataset.setValue("Perl", null);
		return localDefaultPieDataset;
	}

	private JFreeChart createChart(PieDataset paramPieDataset) {
		JFreeChart localJFreeChart = ChartFactory.createPieChart3D(
				"Pie Chart 3D Demo 1", paramPieDataset, true, true, false);
		PiePlot3D localPiePlot3D = (PiePlot3D) localJFreeChart.getPlot();
		localPiePlot3D.setDarkerSides(true);
		localPiePlot3D.setStartAngle(290.0D);
		localPiePlot3D.setDirection(Rotation.CLOCKWISE);
		localPiePlot3D.setForegroundAlpha(0.5F);
		localPiePlot3D.setNoDataMessage("No data to display");
		return localJFreeChart;
	}*/
	

}
