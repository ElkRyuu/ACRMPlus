<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/commons/common.jsp" %>   
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>编辑交往记录</title>
  </head>

  <body class="main">
  
 	<span class="page_title">编辑交往记录</span>
	<div class="button_bar">
		<button class="common_button" onclick="javascript:history.go(-1);">返回</button>
		<button class="common_button" onclick="document.forms[0].submit();">保存</button>
	</div>
  
  	<form:form action="${ctp}/customer/activity/save" method="POST" modelAttribute="activity">
  		<form:hidden path="id"/>
  		<form:hidden path="customer.id"/>
  		
		<table class="query_form_table" border="0" cellPadding="3" cellSpacing="0">
			<tr>
				<th>时间</th>
				<td><form:input path="date"/><span class="red_star">*</span></td>
				<th>地点</th>
				<td><form:input path="place"/><span class="red_star">*</span></td>
			</tr>
			<tr>
				<th>概要</th>
				<td colspan="3"><form:input path="title"/><span class="red_star">*</span></td>
			</tr>
			<tr>		
				<th>详细信息</th>
				<td colspan="3"><form:textarea path="description"/></td>
			</tr>
		</table>
  	</form:form>
  </body>
</html>
