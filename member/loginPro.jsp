<%@page import="memberDB.memdao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
   request.setCharacterEncoding("UTF-8");
   
   String userid = request.getParameter("userid");
   String password = request.getParameter("password");
   
	memdao mdao = new memdao();
	
	int check = mdao.userCheck(userid, password);
	
	if(check == 1){
		session.setAttribute("userid", userid);
		response.sendRedirect("../index.jsp");
	} else if (check == 0){
%>
		<script type="text/javascript">
			alert("비밀번호를 다시 확인 해 주십시오.");
			history.back();
		</script>
<%
	}else{
%>
		<script>
			window.alert("아이디가 없습니다.");
			history.go(-1);
		</script>
<%
	}
%>
   
	