<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/commons/common.jsp" %>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>客户流失分析</title>
</head>
<body>

	<div class="page_title">客户流失分析</div>
	<div class="button_bar">
		<button class="common_button" onclick="document.forms[0].submit();">查询</button>
	</div>
	
	<form action="${ctp}/report/drain"> 
		<table class="query_form_table" border="0" cellPadding="3" cellSpacing="0">
			<tr>
				<th>客户名称</th>
				<td><input type="text" name="search_LIKES_customerName" /></td>
				<th>客户经理</th>
				<td><input type="text" name="search_LIKES_managerName" /></td>
				<th>&nbsp;</th>
				<td>&nbsp;</td>
			</tr>
		</table><br />
		
		<c:if test="${!empty requestScope.page.content }">
			<table class="data_list_table" border="0" cellPadding="3" cellSpacing="0">
				<tr>
					<th>序号</th>
					<th>客户名称</th>
					<th>客户经理</th>
					<th>确认流失时间</th>
					<th>流失原因</th>
				</tr>
				
				<c:forEach items="${requestScope.page.content }" var="drain" begin="0" varStatus="vs">
					<tr>
						<td class="list_data_number">${vs.index+1 }</td>
						<td class="list_data_ltext">${drain.customer.name }</td>
						<td class="list_data_text">${drain.customer.manager.name }</td>
						<td class="list_data_text">
							<fmt:formatDate value="${drain.drainDate }" pattern="yyyy-MM-dd"/>
						</td>
						<td class="list_data_ltext">${drain.reason }</td>
					</tr>
				</c:forEach>
			</table>
			
			<div style="text-align:right; padding:6px 6px 0 0;">
				共 ${page.totalElements } 条记录 &nbsp;&nbsp;
				当前第 ${page.pageNo } 页/共 ${page.totalPages } 页&nbsp;&nbsp;
				
				<c:if test="${page.hasPrev }">
					<a href='?pageNo=1&${queryString}'>首页</a>&nbsp;&nbsp;
					<a href='?pageNo=${page.prev }&${queryString}'>上一页</a>&nbsp;&nbsp;
				</c:if>
				<c:if test="${page.hasNext }">
					<a href='?pageNo=${page.next }&${queryString}'>下一页</a>&nbsp;&nbsp;
					<a href='?pageNo=${page.totalPages }&${queryString}'>末页</a>&nbsp;&nbsp;
				</c:if>
				
				转到 <input id="pageNo" size='1'/> 页&nbsp;&nbsp;
			</div>

			<script type="text/javascript" src="${ctp}/static/jquery/jquery-1.9.1.min.js"></script>
			<script type="text/javascript">
				$(function(){
					$("#pageNo").change(function(){
						
						var pageNo = $(this).val();
						var reg = /^\d+$/;
						if(!reg.test(pageNo)){
							$(this).val("");
							alert("输入的页码不合法");
							return;
						}
						
						var pageNo2 = parseInt(pageNo);
						if(pageNo2 < 1 || pageNo2 > parseInt(${page.totalPages})){
							$(this).val("");
							alert("输入的页码不合法");
							return;
						}
						window.location.href = window.location.pathname + "?pageNo=" + pageNo2+"&${queryString}";
					});
				})
			</script>
		</c:if>
		<c:if test="${empty requestScope.page.content }">暂无任何记录~</c:if>
		
		
	</form>
</body>
</html>

