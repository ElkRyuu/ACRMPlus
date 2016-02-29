<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/commons/common.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>
    	<c:if test="${requestScope.saveType == 'delay' }">暂缓流失</c:if>
    	<c:if test="${requestScope.saveType == 'confirm' }">确认流失</c:if>
    </title>
    <script type="text/javascript">
    	$(function() {
    		$("#save").click(function() {
    			if($("#saveType").val() == "delay") {
    				var url="${ctp}/drain/delay";
    				
    				var idStr=$(":hidden[name='id']").val();
    				var delayStr=$("[name='delay']").val();
    				var params={id:idStr,delay:delayStr};
    				
    				$.post(url,params,function(data) {
    					if(data!=null) {
    						var index=parseInt($("#no").val()) + 1;
    						var $newTr=$("<tr><th>暂缓措施-"+index+"</th><td colspan='3'>"+data+"</td></tr>");
    						$newTr.insertBefore($(".delay"));
    						$("#no").attr("value",index);
    						$("[name='delay']").val("");
    						alert("保存成功");
    					}
    				});
    			}
    			
    			if($("#saveType").val() == "confirm") {
    				document.forms[0].submit();
    			}
    		});
    	})
    </script>
  </head>

  <span class="page_title">
  	<c:if test="${requestScope.saveType == 'delay' }">暂缓流失</c:if>
  	<c:if test="${requestScope.saveType == 'confirm' }">确认流失</c:if>
  </span>
  <div class="button_bar">
	<button class="common_button" onclick="javascript:history.go(-1);">返回</button>
	<c:if test="${requestScope.saveType == 'delay' }">
		<button class="common_button" onclick="window.location.href='${ctp}/drain/confirm/edit?id=${drain.id }'">确认流失</button>
	</c:if>
	<button class="common_button" id="save">保存</button>
  </div>
	
  <body class="main">
	  <form action="${ctp}/drain/confirm" method="post">
			<input type="hidden" id="saveType" value="${requestScope.saveType }"/>	  
		  	<input type="hidden" name="id" value="${drain.id }"/>
			<table class="query_form_table" border="0" cellPadding="3" cellSpacing="0">
				<tr>
					<th>编号</th>
					<td>${drain.id }</td>
					<th>客户名称</th>
					<td>${drain.customer.name }</td>
				</tr>
				<tr>
					<th>客户经理</th>
					<td>${drain.customer.manager.name }</td>
					<th>最后一次下单时间</th>
					<td><fmt:formatDate value="${drain.lastOrderDate }" pattern="yyyy-MM-dd"/></td>
				</tr>
				
				<c:if test="${!empty drain.delay }">
					<c:set var="delays" value="${fn:split(drain.delay,'`') }" />
					<c:forEach items="${delays }" var="delay" begin="0" varStatus="vs">
						<tr>
							<th>暂缓措施-${vs.index+1 }</th>
							<td colspan="3">${delay }</td>
						</tr>
					</c:forEach>
					<input type="hidden" id="no" value="${fn:length(delays) }" />
				</c:if>
				<c:if test="${empty drain.delay }">
					<input type="hidden" id="no" value="0" />
				</c:if>
				
				<c:if test="${requestScope.saveType == 'delay' }">
					<tr class="delay">
						<th>追加暂缓措施</th>
						<td colspan="3"><textarea name="delay" cols="50" rows="6"></textarea>&nbsp;</td>
					</tr>
				</c:if>
				
				<c:if test="${requestScope.saveType == 'confirm' }">
					<input type="hidden" name="customer.id" value="${drain.customer.id }" />
					<tr>
						<th>流失原因</th>
						<td colspan="3"><textarea name="reason" cols="50" rows="6"></textarea>&nbsp;</td>
					</tr>
				</c:if>
				
			</table>
	   </form>	
  </body>
</html>