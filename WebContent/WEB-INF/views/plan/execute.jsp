<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/commons/common.jsp" %>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>执行计划</title>
    <script type="text/javascript">
    	$(function() {
    		$("button[id^='save-']").click(function() {
    			var id=this.id;
				id=id.split("-")[1];
				
				var result=$(this).prev(":input").val();
				result=$.trim(result);
				if(result=="") {
					$(this).prev(":input").val("");
					alert("请输入有效内容!");
				}
				
				$.ajax({
					type:"PUT",
					url:"${ctp}/plan/make",
					data:"id="+id+"&result="+result,
					success:function(args) {
						$("#result-"+ id).val(args.result).attr("disabled","disabled");
						alert("保存成功!");
					}
				});
    			
				return false;
			});
    		
    		$("button[id^='stop-']").click(function() {
    			var id=this.id;
				id=id.split("-")[1];
				
				if(!confirm("确认执行此操作?")) {
					return false;
				}
				
				window.location.href="${ctp}/chance/stop/"+id;
				/* var url="${ctp}/chance/stop/"+id;
				var args={_method:"PUT",time:new Date()};
				$.post(url,args); */
				return false;
    		});
    	})
    </script>
  </head>

  <body class="main">
	<span class="page_title">执行计划</span>
	<div class="button_bar">
		<button class="common_button" id="stop-${chance.id }" >终止开发</button>
		<button class="common_button" onclick="window.location.href='${ctp}/plan/make/${chance.id }'">制定计划</button>
		<button class="common_button" onclick="javascript:history.go(-1);">返回</button>			
		<button class="common_button" onclick="window.location.href='${ctp}/chance/finish/${chance.id }'">开发成功</button>
	</div>
  	<form action="${ctp}/plan/execute" method="post">
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
				<th>计划</th>
				<th>执行效果</th>
			</tr>
			
			<c:forEach items="${chance.salesPlans }" var="plan">
				<tr>
					<td class="list_data_text"><fmt:formatDate value="${plan.date }" pattern="yyyy-MM-dd"/>&nbsp;</td>
					<td class="list_data_ltext">${plan.todo }&nbsp;</td>
					<td>
						<c:if test="${plan.result==null }">
							<input class="result" id="result-${plan.id }" type="text" size="50" />
							<button class="common_button" id="save-${plan.id }">保存</button>
						</c:if>
						<c:if test="${plan.result!=null }">
							<input class="result" id="result-${plan.id }" type="text" size="50" value="${plan.result }" disabled="disabled" />
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>	
  	</form>
  </body>
</html>