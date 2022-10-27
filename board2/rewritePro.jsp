<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="boardDB.boarddao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	// 한글 처리
	request.setCharacterEncoding("UTF-8"); 
	int num = Integer.parseInt(request.getParameter("num"));
%>
	<jsp:useBean id="bbean" class="boardDB.boardbean"/>
	<jsp:setProperty name="bbean" property="*"/>
<%
	bbean.setDate(new Timestamp(System.currentTimeMillis()));
	bbean.setIp(request.getRemoteAddr());
	
 	boarddao bdao = new boarddao();
	bdao.writereply(bbean);
	response.sendRedirect("board.jsp");
%>
