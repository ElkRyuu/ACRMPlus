<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/commons/common.jsp" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>制定计划</title>
	<script type="text/javascript">
		$(function(){
			
			$("#plan_new").click(function() {
				var id=$("[name='chance.id']").val();

				var url="${ctp}/plan/make/"+id;
				var args={date:$("#date").val(),todo:$("#todo").val()};
				
				$.post(url,args,function(data) {
					if(!data) {
						alert("输入内容有误!");
						return;
					}
					
					var id=data.id;
					
					var d=new Date();
					d.setTime(data.date);
					var date=d.format("yyyy-MM-dd");
					
					var todo=data.todo;
					
					var $tr=$("<tr id='plan-"+ id +"'></tr>");
					$tr.append("<td class='list_data_text'>"+ date +"</td>");
					
					var $td=$("<td class='list_data_ltext'></td>");
					$td.append("<input type='text' size='50' value='"+ todo +"' id='todo-"+ id +"'/>");
					
					$td.append("&nbsp;<button class='common_button' id='save-"+ id +"'>保存</button>&nbsp;");
					$td.find("button[id^='save-']").click(function() {
						savePlan(this);
						return false;
					});
					$td.append("<button class='common_button' id='delete-"+ id +"'>删除</button>");
					$td.find("button[id^='delete-']").click(function() {
						deletePlan(this);
						return false;
					});
					
					$tr.append($td);
					$("table[class='data_list_table']").append($tr);
					$("#todo").val("");
					alert("新建成功!");
				});
				
				return false;
			});
			
			function savePlan(saveButton) {
				var id=saveButton.id;
				id=id.split("-")[1];
				
				var prevTodo=$("#prevTodo").val();
				var todo=$(saveButton).prev(":input").val();
				if(todo==prevTodo) {
					alert("内容未做任何修改~");
					return false;
				}
				
				$.ajax({
					type:"PUT",
					url:"${ctp}/plan/make",
					data:"id="+id+"&todo="+todo,
					success:function(args) {
						$("#todo-"+ id).val(args.todo);
						alert("修改成功!");
					}
				});
			}
			
			$("button[id^='save-']").click(function() {
				savePlan(this);
				return false;
			});
			
			function deletePlan(deleteButton) {
				var id=deleteButton.id;
				id=id.split("-")[1];
				
				$.ajax({
					type:"DELETE",
					url:"${ctp}/plan/make/"+id,
					success:function(data) {
						if(data==1) {
							$("#plan-"+ id).remove();
							alert("删除成功!");
						} else {
							alert("删除失败!");
						}
					}
				});
			}
			
			$("button[id^='delete-']").click(function() {
				deletePlan(this);
				return false;
			});
			
		})
	</script>
</head>

<body class="main">
	<span class="page_title">制定计划</span>
	<div class="button_bar">
		<button class="common_button" id="execute" onclick="window.location.href='${ctp}/plan/execute/${chance.id }'">执行计划</button>
		<button class="common_button" onclick="javascript:history.go(-1);">返回</button>
	</div>
	
	<form action="${ctp}/plan/make" method="post">
		<table class="query_form_table" border="0" cellPadding="3" cellSpacing="0">
			<tr>
				<th>编号</th>
				<td>${chance.id }</td>
				<th>机会来源</th>
				<td>${chance.source }</td>
			</tr>
			<tr>
				<th>客户名称</th>
				<td>${chance.custName }</td>
				<th>成功机率（%）</th>
				<td>${chance.rate }</td>
			</tr>
			<tr>
				<th>概要</th>
				<td colspan="3">${chance.title }</td>
			</tr>
			<tr>
				<th>联系人</th>
				<td>${chance.contact }</td>
				<th>联系人电话</th>
				<td>${chance.contactTel }</td>
			</tr>
			<tr>
				<th>机会描述</th>
				<td colspan="3">${chance.description }</td>
			</tr>
			<tr>
				<th>创建人</th>
				<td>${chance.createBy.name }</td>
				<th>创建时间</th>
				<td><fmt:formatDate value="${chance.createDate }" pattern="yyyy-MM-dd"/></td>
			</tr>
			<tr>
				<th>指派给</th>
				<td colspan="3">${chance.designee.name }</td>
			</tr>
		</table><br />
		
		<table class="data_list_table" border="0" cellPadding="3" cellSpacing="0">
			<tr>
				<th width="200px">日期</th>
				<th>计划项</th>
			</tr>
			
			<c:forEach items="${chance.salesPlans }" var="plan">
				<tr id="plan-${plan.id }">
					<td class="list_data_text">
						<fmt:formatDate value="${plan.date }" pattern="yyyy-MM-dd"/>&nbsp;
					</td>
					<td class="list_data_ltext">
						<c:if test="${plan.result!=null && plan.result!='' }">
								<input type="text" size="50" value="${plan.todo }" readonly="readonly"/>
								<input type="text" size="50" value="${plan.result }" readonly="readonly"/>
						</c:if>
						<c:if test="${plan.result==null || plan.result=='' }">
								<input type="hidden" id="prevTodo" value="${plan.todo }" />
								<input type="text" size="50" value="${plan.todo }" id="todo-${plan.id }"/>
								<button class="common_button" id="save-${plan.id }">保存</button>
								<button class="common_button" id="delete-${plan.id }">删除</button>
						</c:if>
					</td>
				</tr>
			</c:forEach>
			
		</table><br />
		
		<table class="query_form_table" border="0" cellPadding="3" cellSpacing="0">
			<tr>
				<th>日期<br />(格式: yyyy-mm-dd)</th>
				<td><input type="text" name="date" id="date" />&nbsp;</td>
				<th>计划项</th>
				<td><input type="text" name="todo" size="50" id="todo" />&nbsp;
					<button class="common_button" id="plan_new">新建</button>
				</td>
			</tr>
		</table>
		<input type="hidden" name="chance.id" value="${chance.id }" />
		
	</form>
</body>
</html>
