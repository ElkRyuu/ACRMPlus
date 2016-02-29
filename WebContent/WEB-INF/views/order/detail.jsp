<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/commons/common.jsp" %>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>查看历史订单明细</title>
  </head>  
  <body>
  
  	<div class="page_title">查看历史订单明细</div>
  	<div class="button_bar">
		<button class="common_button" onclick="javascript:history.go(-1);">返回</button>  
	</div><br />
	
	<table class="query_form_table" border="0" cellPadding="3" cellSpacing="0">
		<tr>
			<th>订单编号</th>
			<td>${order.id }</td>
			<th>日期</th>
			<td><fmt:formatDate value="${order.date }" pattern="yyyy-MM-dd"/></td>
		</tr>
		<tr>
			<th>送货地址</th>
			<td>${order.address }</td>
			<th>状态</th>
			<td>${order.status }</td>
		</tr>
	</table><br />
	
	<c:if test="${!empty order.items }">
		<table class="data_list_table" border="0" cellPadding="3" cellSpacing="0">
			<tr>
				<th>商品</th>
				<th>数量</th>
				<th>单位</th>
				<th>金额（元）</th>
			</tr>
			
			<c:forEach items="${order.items }" var="orderItem">
				<tr>
					<td class="list_data_ltext">${orderItem.product.name }</td>
					<td class="list_data_number">${orderItem.count }</td>
					<td class="list_data_text">${orderItem.product.unit }</td>
					<td class="list_data_number">${orderItem.money }</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	<c:if test="${empty order.items }">暂无任何记录</c:if>
  </body>
</html>