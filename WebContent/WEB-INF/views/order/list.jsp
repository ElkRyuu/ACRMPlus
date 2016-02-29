<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/commons/common.jsp" %>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="true">
  <head>
    <title>查看历史订单</title>
  </head>  
  <body>
  	
  
  	<div class="page_title">查看历史订单</div>
  	<div class="button_bar">
		<button class="common_button" onclick="javascript:history.go(-1);">返回</button>  
	</div><br />
	
	<c:if test="${!empty requestScope.page.content }">
		<table class="data_list_table" border="0" cellPadding="3" cellSpacing="0">
			<tr>
				<th>订单编号</th>
				<th>日期</th>
				<th>送货地址</th>
				<th>状态</th>
				<th>操作</th>
			</tr>
			
			<c:forEach items="${requestScope.page.content }" var="order">
				<tr>
					<td class="list_data_number">${order.no }</td>
					<td class="list_data_text"><fmt:formatDate value="${order.date }" pattern="yyyy-MM-dd"/></td>
					<td class="list_data_ltext">${order.address }</td>
					<td class="list_data_text">${order.status }</td>
					<td class="list_data_op">
						<img onclick="window.location.href='${ctp}/customer/order/details?id=${order.id }'" 
							title="查看明细" src="${ctp}/static/images/bt_detail.gif" class="op_button" />
					</td>
				</tr>
			</c:forEach>			
		</table>

		<div style="text-align:right; padding:6px 6px 0 0;">
			共 ${page.totalElements } 条记录 &nbsp;&nbsp;
			当前第 ${page.number + 1 } 页/共 ${page.totalPages } 页&nbsp;&nbsp;
			
			<c:if test="${!page.firstPage }">
				<a href='?pageNo=1'>首页</a>&nbsp;&nbsp;
				<a href='?pageNo=${page.number }'>上一页</a>&nbsp;&nbsp;
			</c:if>
			<c:if test="${!page.lastPage }">
				<a href='?pageNo=${page.number + 2 }'>下一页</a>&nbsp;&nbsp;
				<a href='?pageNo=${page.totalPages }'>末页</a>&nbsp;&nbsp;
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
					
					window.location.href = window.location.pathname+ "?pageNo=" + pageNo2;
				});
			})
		</script>
	</c:if>
	<c:if test="${empty requestScope.page.content }">暂无任何记录~</c:if>	
	
  </body>
</html>