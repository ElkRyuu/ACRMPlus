<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/commons/common.jsp" %>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>客户服务分析</title>
  <body>
	<div class="page_title">客户服务分析</div>
	<div class="button_bar">
		<button class="common_button" onclick="document.forms[0].submit();">查询</button>  
	</div>
  	<form action="${ctp}/report/service">
		<div id="listView" style="display:block;">
			<table class="query_form_table" border="0" cellPadding="3" cellSpacing="0">
				<tr>
					<th>日期</th>
					<td>
						<input type="text" name="search_minOrderDate" size="10" />
						-
						<input type="text" name="search_maxOrderDate" size="10" />
					</td>
					<th>&nbsp;</th>
					<td>&nbsp;</td>
				</tr>
			</table><br />
			
			<c:if test="${!empty requestScope.page.content }">
				<table class="data_list_table" border="0" cellPadding="3" cellSpacing="0">
					<tr>
						<th>序号</th>
						<th>服务类型</th>
						<th>客户数量</th>
					</tr>
					
					<%
						int i=1;
					%>
					
					<c:forEach items="${page.content }" var="item">
						<tr align="center">
							<td class="list_data_number"><%=i++ %></td>
							<td class="list_data_ltext">${item[0] }</td>
							<td class="list_data_number">${item[1] }</td>
						</tr>
					</c:forEach>
				</table>
			
				<div style="text-align:right; padding:6px 6px 0 0;">
					共 ${page.totalElements } 条记录 &nbsp;&nbsp;
					当前第 ${page.number + 1 } 页/共 ${page.totalPages } 页&nbsp;&nbsp;
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
		</div>
	</form>	
	
	<c:if test="${!empty requestScope.page.content }">
		<div align="center">
			<img alt="" src="${imgUrl }">
		</div>
	</c:if>
  </body>
</html>