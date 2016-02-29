<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/commons/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
  <head>
    <title>指派销售机会</title>
    <script type="text/javascript">
	    $(function(){
	    	var val = $("#designeeDate").val();

	    	if(val == null || val == ""){
	    		$("#designeeDate").val(new Date().format("yyyy-MM-dd"));
	    	}
	    	
	    	$("#save").click(function(){
    			$("form")[0].submit();
	    	});
	    })
    </script>
    
  </head>
 <body class="main">
 	<span class="page_title">
		指派销售机会
 	</span>
	<div class="button_bar">
		<button class="common_button" onclick="javascript:history.go(-1);">返回</button>
		<button class="common_button" id="save">保存</button>
	</div>
	
	<form:form id="chance" action="${ctp}/chance/dispatch/${chance.id }" method="POST" modelAttribute="chance">
		<input type="hidden" name="_method" value="PUT" />
	
		<table class="query_form_table" border="0" cellPadding="3" cellSpacing="0">
			<tr>
				<th>编号</th>
				<td>${chance.id }&nbsp;</td>
				<th>机会来源</th>
				<td>${chance.source }</td>
			</tr>
			<tr>
				<th>客户名称</th>
				<td>${chance.custName }</td>
				<th>成功机率%</th>
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
		</table><br /><br>
		
		<table class="query_form_table" border="0" cellPadding="3" cellSpacing="0">				
			<tr>					
				<th>指派给</th>
				<td>
					<form:select path="designee.id" items="${users }" itemValue="id" itemLabel="name" />
					<span class="red_star">*</span>
				</td>
				<th>指派时间</th>
				<td><form:input path="designeeDate" readonly="true"/><span class="red_star">*</span></td>
			</tr>
		</table>
		
	</form:form>
  </body>
</html>