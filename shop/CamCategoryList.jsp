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
 <center>
 <table width="1000">
<% 
	// 카테고리
	int category = Integer.parseInt(request.getParameter("category"));
	
	RentalDAO rdao = new RentalDAO();
	Vector<CampListBean> v = rdao.getCategoryCamp(category);
	
	int j=0;
	for(int i=0;i<v.size();i++){
		CampListBean bean = v.get(i);
		if(j%3==0){
%>
	<tr height="220">
<% }%>				
		<td width="333" align="center">
		<a href="CamMain.jsp?center=CampingReserveInfo.jsp?no=<%=bean.getNo()%>">
		<img alt="" src="../images<%=bean.getImg()%>" width="300" height="200">
		</a><p>
		<font size="3" color="gray"> <b><%=bean.getName()%></b></font></td>
<% 
		j=j+1;
	}
%>	
	</tr>	
 
 </table>
 </center>
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
