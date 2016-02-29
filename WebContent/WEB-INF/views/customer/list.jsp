<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/commons/common.jsp" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>客户基本信息管理</title>
<script type="text/javascript">
	$(function() {
		$("img[id^='delete-']").click(function() {
			var id=this.id;
			id=id.split("-")[1];
			
			var url="${ctp}/customer/delete/"+id;
			var params={_method:"DELETE"};
			$.post(url,params,function(data) {
				if(data == 1) {
					$("#state-"+id).text("删除");
				}
			});
		});
	})
</script>
</head>
<body>
	<div class="page_title">客户基本信息管理</div>
	<div class="button_bar">
		<button class="common_button" onclick="document.forms[0].submit();">查询</button>
	</div>
	
	<form action="${ctp}/customer/list" method="POST">
		<table class="query_form_table" border="0" cellPadding="3" cellSpacing="0">
			<tr>
				<th>客户名称</th>
				<td><input type="text" name="search_LIKES_name"/></td>
				<th>地区</th>
				<td>
					<select name="search_EQS_region">
						<option value="">全部</option>
						<c:forEach items="${regions }" var="region">
							<option value="${region }">${region }</option>
						</c:forEach>
					</select>
				</td>
				<th>&nbsp;</th>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th>客户经理</th>
				<td><input type="text" name="search_LIKES_managerName" /></td>
				
				<th>客户等级</th>
				<td>
					<select name="search_EQS_level">
						<option value="">全部</option>
						
						<c:forEach items="${levels }" var="level">
							<option value="${level }">${level }</option>
						</c:forEach>
					</select>
				</td>
				
				<th>状态</th>
				<td>
					<select name="search_EQS_state">
						<option value="">全部</option>
						<option value="正常">正常</option>
						<option value="流失">流失</option>
						<option value="删除">删除</option>					
					</select>
				</td>
			</tr>
		</table><br />
		
		<c:if test="${!empty requestScope.page.content }">
			<table class="data_list_table" border="0" cellPadding="3" cellSpacing="0">
				<tr>
					<th>客户编号</th>
					<th>客户名称</th>
					<th>地区</th>
					<th>客户经理</th>
					<th>客户等级</th>
					<th>状态</th>
					<th>操作</th>
				</tr>
				
				<c:forEach items="${page.content }" var="cust">
					<tr>
						<td class="list_data_text">${cust.no }&nbsp;</td>
						<td class="list_data_ltext">${cust.name }&nbsp;</td>
						<td class="list_data_text">${cust.region }&nbsp;</td>
						<td class="list_data_text">${cust.manager.name }&nbsp;</td>
						<td class="list_data_text">${cust.level }&nbsp;</td>
						<td class="list_data_text" id="state-${cust.id }">${cust.state }&nbsp;</td>
						<td class="list_data_op">
							<img onclick="window.location.href='${ctp}/customer/${cust.id }'"
								title="编辑" src="${ctp}/static/images/bt_edit.gif" class="op_button" alt="" /> 
							<img onclick="window.location.href='${ctp}/customer/contact/list/${cust.id }'"
								title="联系人" src="${ctp}/static/images/bt_linkman.gif" class="op_button" alt="联系人信息" /> 
							<img onclick="window.location.href='${ctp}/customer/activity/${cust.id }'"
								title="交往记录" src="${ctp}/static/images/bt_acti.gif" class="op_button" alt="交往记录" /> 
							<img onclick="window.location.href='${ctp}/customer/order/list/${cust.id }'"
								title="历史订单" src="${ctp}/static/images/bt_orders.gif" class="op_button" alt="历史订单" />
							<c:if test="${cust.state != '删除' }">
								<img id="delete-${cust.id }" title="删除" src="${ctp}/static/images/bt_del.gif" 
									 class="op_button" alt="删除" />
							</c:if> 
						</td>					
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
		<c:if test="${empty requestScope.page.content }">暂无任何记录</c:if>
	</form>
</body>
</html>
