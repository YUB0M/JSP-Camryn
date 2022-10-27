<%@page import="memberDB.memdao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- <%
request.setCharacterEncoding("utf-8");

String userid = request.getParameter("userid");
memdao mdao = new memdao();
boolean check = mdao.chkuserid(userid);
out.println(check);
%>

--%>

   <%
   //한글처리
   request.setCharacterEncoding("UTF-8");
   
   String userid = request.getParameter("userid");
   memdao mdao = new memdao();
   int check = mdao.idCheck(userid); 
   %>
   <%=check%>