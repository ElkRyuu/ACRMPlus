package cn.hlj.crm.test;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PiePlot3D;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.data.general.PieDataset;
import org.jfree.util.Rotation;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.AbstractView;

@Component
public class CustomView extends AbstractView {

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		PieDataset paramPieDataset = createDataset(model);
		JFreeChart chart = createChart(paramPieDataset);

		// 直接把结果输出到输出流中
		ChartUtilities.writeChartAsJPEG(response.getOutputStream(), chart, 500, 270);

//		String fileName = ServletUtilities.saveChartAsPNG(chart, 500, 270, request.getSession());
//		String url = request.getContextPath() + "/DisplayChart/show?filename=" + fileName;
//
//		request.getSession().setAttribute("imgUrl", url);
		
		//上面这种方式需要在 web.xml 中配置
//		<!-- 在JSP页面中显示 JFreeChart 生成的图 -->
//		<servlet>
//			<servlet-name>DisplayChart</servlet-name>
//			<servlet-class>org.jfree.chart.servlet.DisplayChart</servlet-class>
//		</servlet>
//		<servlet-mapping>
//			<servlet-name>DisplayChart</servlet-name>
//			<url-pattern>/DisplayChart/show</url-pattern>
//		</servlet-mapping>
		
	}

	private PieDataset createDataset(Map<String, Object> map) {
		DefaultPieDataset localDefaultPieDataset = new DefaultPieDataset();

		for (Map.Entry<String, Object> entry : map.entrySet()) {
			localDefaultPieDataset.setValue(entry.getKey(), (int) entry.getValue());
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
		return localJFreeChart;
	}
}
