<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/commons/common.jsp" %>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>客户服务管理</title>
	<script type="text/javascript">
		$(function() {
			$(".allotTo").change(function() {
				var allotToId=this.value;
				if(allotToId=="" || !confirm("确认分配吗?")) {
					return;
				}
				
				var id=$(this).prev(":hidden").val();
				
				var pageStr=$("#matchPageStr").val();
				
				window.location.href="${ctp}/service/update/"+pageStr+"?id="+id+"&allotToId="+allotToId;
			});
		})
	</script>
</head>
<body>
	<input type="hidden" id="matchPageStr" value="${matchPageStr }"/>
	
	<div class="page_title">
		<c:choose>
			<c:when test="${matchPageStr=='allot' }">服务分配</c:when>
			<c:when test="${matchPageStr=='deal' }">服务处理</c:when>
			<c:when test="${matchPageStr=='feedback' }">服务反馈</c:when>
			<c:otherwise>服务归档</c:otherwise>
		</c:choose>
	</div>
	<div class="button_bar">
		<button class="common_button" onclick="window.location.href='${ctp}/service/create'">新建</button>
		<button class="common_button" onclick="document.forms[0].submit();">查询</button>
	</div>
	
	<form action="" method="POST">
		<table class="query_form_table" border="0" cellPadding="3" cellSpacing="0">
			<tr>
				<th>服务类型</th>
				<td><input type="text" name="search_LIKES_serviceType" /></td>
				<th>概要</th>
				<td><input type="text" name="search_LIKES_serviceTitle" /></td>
			</tr>
			<tr>
				<th>客户</th>
				<td><input type="text" name="search_EQS_customerName" /></td>
				<th>创建时间</th>
				<td>
					<input type="text" name="search_GTED_fromDate" size="10" />
					-
					<input type="text" name="search_LTED_endDate" size="10" />
				</td>
			</tr>
		</table><br />
		
		<c:if test="${empty requestScope.page.content }">暂无任何记录</c:if>
		<c:if test="${!empty requestScope.page.content }">
			<table class="data_list_table" border="0" cellPadding="3"
				cellSpacing="0">
				<tr>
					<th>编号</th>
					<th>服务类型</th>
					<th>概要</th>
					<th>客户</th>
					<th>创建人</th>
					<th>创建时间</th>
					<c:if test="${matchPageStr=='allot' }">
						<th>分配给</th>
					</c:if>
					<th>操作</th>
				</tr>
				
				<c:forEach items="${page.content }" var="item">
					<tr>
						<td class="list_data_number">${item.id }</td>
						<td class="list_data_text">${item.serviceType }</td>
						<td class="list_data_ltext">${item.serviceTitle }</td>
						<td class="list_data_text">${item.customer.name }</td>
						<td class="list_data_text">${item.createdby.name }</td>
						<td class="list_data_text">
							<fmt:formatDate value="${item.createDate }" pattern="yyyy-MM-dd"/>
						</td>
						
						<c:if test="${matchPageStr=='allot' }">
							<td class="list_data_text">
								<input type="hidden" name="id" value="${item.id }"/>
								<select name="allotTo" class="allotTo">
									<option value="">未指定</option>
									
									<c:forEach items="${users }" var="itemU">
										<option value="${itemU.id }">${itemU.name }</option>
									</c:forEach>
								</select>
							</td>
						</c:if>
						
						<td class="list_data_op">
							<c:if test="${matchPageStr=='allot' }">
								<img onclick="window.location.href='${ctp}/service/delete?id=${item.id }'" 
									title="删除" src="${ctp}/static/images/bt_del.gif" class="op_button" />
							</c:if>
							<c:if test="${matchPageStr=='deal' }">
								<img onclick="window.location.href='${ctp}/service/operation/${matchPageStr }?id=${item.id }'" 
									title="处理" src="${ctp}/static/images/bt_deal.gif" class="op_button" />
							</c:if>
							<c:if test="${matchPageStr=='feedback' }">
								<img onclick="window.location.href='${ctp}/service/operation/${matchPageStr }?id=${item.id }'" 
									title="反馈" src="${ctp}/static/images/bt_feedback.gif" class="op_button" />
							</c:if>
							<c:if test="${matchPageStr=='archive' }">
								<img onclick="window.location.href='${ctp}/service/operation/${matchPageStr }?id=${item.id }'" 
									 title="查看" src="${ctp}/static/images/bt_detail.gif" class="op_button" />
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
	</form>
</body>
</html>