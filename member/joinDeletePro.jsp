<%@page import="memberDB.memdao"%>
<%@page import="memberDB.membean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%
	request.setCharacterEncoding("UTF-8");
	
	String userid = (String)session.getAttribute("userid");
	String password = request.getParameter("password");
	
	memdao mdao = new memdao();
	int result = mdao.getUserDel(userid,password);
	if(result == 0 ){
		/* session.invalidate(); */
	%>	
		<script type="text/javascript">
			alert("회원탈퇴에 실패했습니다.");
			history.back(-1);
		</script>
	<% 
	} else if(result == 1) {		
		session.removeAttribute("userid");
	%>		
		<script type="text/javascript">
			alert("회원탈퇴가 완료되었습니다.");
			location.href="../index.jsp";
		</script>
	<% 
	} else {
	%>	
		<script type="text/javascript">
			alert("비밀번호가 일치하지 않습니다.");
			history.back(-1);
		</script>
	<% 
	}
	%>	
		
	
