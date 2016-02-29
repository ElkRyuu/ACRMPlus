<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/commons/common.jsp" %>
<%@ taglib uri="http://struts-menu.sf.net/tag" prefix="menu" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" media="screen" href="${ctp }/styles/global.css" />
<script type="text/javascript" src="${ctp }/scripts/cookies.js"></script>
</head>
<body>
	
<table cellpadding=0 cellspacing=0>
	<tr valign=top>
	 <td>
	    <menu:useMenuDisplayer name="DropDown" repository="repository">
	    <table cellpadding=0 cellspacing=0>
	      <tr>
	        <td>
	        	<menu:displayMenu name="crmMenu" target="content"/>
	        </td>
	      </tr>
	    </table>
	    </menu:useMenuDisplayer>
	 </td>
	</tr>
</table>
	
</body>
</html>