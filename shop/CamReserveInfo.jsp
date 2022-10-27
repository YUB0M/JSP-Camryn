<%@page import="campDB.RentalDAO"%>
<%@page import="campDB.CampListBean"%>
<%@page import="java.util.Vector"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
    <link rel="stylesheet" href="../fonts/icomoon/style.css">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/magnific-popup.css">
    <link rel="stylesheet" href="../css/jquery-ui.css">
    <link rel="stylesheet" href="../css/owl.carousel.min.css">
    <link rel="stylesheet" href="../css/owl.theme.default.min.css">
    <link rel="stylesheet" href="../css/aos.css">
    <link rel="stylesheet" href="../css/style.css">
  </head>
  <!-- header.jsp -->
  <jsp:include page="../include/header.jsp" />
 <body>
<% 
	int no = Integer.parseInt(request.getParameter("no"));
	
	RentalDAO rdao = new RentalDAO();
	CampListBean bean = rdao.getOneCamp(no);
%>

<Center>
<form action="CampingMain.jsp?center=CampingOptionSelect.jsp">
<table width="1000">
	<tr height="100">
	<td align="center" colspan="3">
	<font size="6" color="gray"><%=bean.getName()%>제품선택</font></td>
	</tr>
	<tr>
		<td rowspan="6" width="500" align="center">
		<img alt="alt" src="../images/<%=bean.getImg()%>" width="450"></td>
	</tr>
	<tr>
		<td width="250" align="center"> 수량 </td>
		<td width="250" align="center"> <select name="qty">
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
										</select></td>
	</tr>
	<tr>
		<td width="250" align="center">  소개 </td>
		<td width="250" align="center"> <%=bean.getInfo() %></td>
	</tr>
	<tr>
		<td width="250" align="center">  가격 </td>
		<td width="250" align="center"> <%=bean.getPrice() %></td>
	</tr>
	<tr>
		<td width="250" align="center">  브랜드 </td>
		<td width="250" align="center"> <%=bean.getCompany() %></td>
	</tr>
		<td><input type="submit" value="구매하기"></td>
		<br><br><br>
		<font></font>
</table>
</form>
</Center>




 
 </body>
<!-- footer.jsp -->
  <jsp:include page="../include/footer.jsp"/>
  <script src="js/jquery-3.3.1.min.js"></script>
  <script src="js/jquery-ui.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>
  <script src="js/main.js"></script>
</html>
