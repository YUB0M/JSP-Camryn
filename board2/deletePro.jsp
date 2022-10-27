<%@page import="memberDB.memdao"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="boardDB.boarddao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	// 한글 처리
	request.setCharacterEncoding("UTF-8"); 	
	String password = request.getParameter("password");
	String pageNum = request.getParameter("pageNum");
	int num = Integer.parseInt(request.getParameter("num"));
	
	boarddao bdao = new boarddao();
	int check = bdao.boarddelete(num, password);
	
	if(check == 1){
%>
		<script type="text/javascript">
			alert("삭제성공");
			location.href="board.jsp?pageNum=<%=pageNum%>"
		</script>
<% 
	} else {
%>
		<script type="text/javascript">
			alert("비밀번호 틀림");
			history.back();
		</script>
<%		
	}
%>
