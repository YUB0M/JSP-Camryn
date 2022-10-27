<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="boardDB.boarddao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	// 한글 처리
	request.setCharacterEncoding("UTF-8"); 
	String pageNum = request.getParameter("pageNum");

%>
	<jsp:useBean id="bbean" class="boardDB.boardbean"/>
	<jsp:setProperty name="bbean" property="*"/>
<%
	bbean.setDate(new Timestamp(System.currentTimeMillis()));
	bbean.setIp(request.getRemoteAddr());
	
 	boarddao bdao = new boarddao();
	bdao.BoardWrite(bbean);
	response.sendRedirect("board.jsp");
%>
<%-- 	<script>
		location.href="content.jsp?num=<%=num%>&pageNum=<%=pageNum%>";
	</script> --%>
