<%@page import="memberDB.memdao"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="boardDB.boarddao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	// 한글 처리
	request.setCharacterEncoding("UTF-8"); 	
	String pageNum = request.getParameter("pageNum");
	/* int num = Integer.parseInt(request.getParameter("num")); */
	
%>
	<jsp:useBean id="bbean" class="boardDB.boardbean"/>
	<jsp:setProperty property="*" name="bbean"/>
<%

	boarddao bdao = new boarddao();

	int check = bdao.boardupdate(bbean);
	
	if(check == 1){
%>
		<script type="text/javascript">
			alert("수정성공");
			location.href = "board.jsp";
		</script>
<% 
	} else {
%>
		<script type="text/javascript">
			alert("수정실패");
			history.back();
		</script>
<%		
	}
%>
