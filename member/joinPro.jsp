<%@page import="memberDB.memdao"%>
<%@page import="memberDB.membean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%
	request.setCharacterEncoding("UTF-8");
	
	String userid = request.getParameter("userid");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String zipcode= request.getParameter("zipcode");
	String addr = request.getParameter("addr");
	String addr2 = request.getParameter("addr2");
	String phone = request.getParameter("phone");
	String birth = request.getParameter("birth");
	
	membean bbean = new membean();
	bbean.setUserid(userid);
	bbean.setPassword(password);
	bbean.setName(name);
	bbean.setZipcode(zipcode);
	bbean.setAddr(addr);
	bbean.setAddr2(addr2);
	bbean.setPhone(phone);
	bbean.setBirth(birth);
	
	memdao ddao = new memdao();
	ddao.insertMember(bbean);
	response.sendRedirect("login.jsp");
	%>
	
