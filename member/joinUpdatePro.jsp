<%@page import="memberDB.memdao"%>
<%@page import="memberDB.membean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%
	request.setCharacterEncoding("UTF-8");
	
	%>
	<jsp:useBean id="mbean" class="memberDB.membean"/>
	<jsp:setProperty name="mbean" property="*"/>
	<%
	String userid = (String)session.getAttribute("userid");
	mbean.setUserid(userid);
	
	memdao mdao = new memdao();
	mdao.getUser(userid);
	mdao.updateMember(mbean);
	%>
	
	<script type="text/javascript">
		alert("회원정보 수정이 완료되었습니다.");
		location.href="../index.jsp";
	</script>
