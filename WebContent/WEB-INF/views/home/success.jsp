<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/common.jsp"%>

<title>CRM</title>

<frameset rows="85,*,40" frameborder="NO" noresize Borders="NO"
	framespacing="0">

	<frame name="topFrame" frameborder="NO" scrolling="NO" noresize
		Borders="NO" src="${ctp}/header" marginwidth="value"
		marginheight="value">

	<frameset rows="*" cols="180,*" border="0" noresize framespacing="2">

		<frame name="menu" src="${ctp}/menu-list" border="0" scrolling="auto"
			marginwidth="0" leftmargin="0" marginheight="0" APPLICATION="yes">

		<frame name="content" src="${ctp}/welcome" frameborder="no"
			marginwidth="0" marginheight="0" APPLICATION="yes">

	</frameset>

	<frame src="${ctp}/footer" name="#" frameborder="NO" scrolling="NO"
		noresize marginwidth="0" marginheight="0" Borders="NO">

</frameset>