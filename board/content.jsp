<%@page import="boardDB.boardbean"%>
<%@page import="boardDB.boarddao"%>
<%@page import="boardDB.filebean"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Vector"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!-- css 및 script -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
    <link rel="stylesheet" href="../fonts/icomoon/style.css">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/magnific-popup.css">
    <link rel="stylesheet" href="../css/jquery-ui.css">
    <link rel="stylesheet" href="../css/owl.carousel.min.css">
    <link rel="stylesheet" href="../css/owl.theme.default.min.css">
    <link rel="stylesheet" href="../css/aos.css">
    <link rel="stylesheet" href="../css/style.css">
	<link rel="stylesheet" href="../css/motion.css">
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
</head>
<% 
	// num, pageNum
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	// 글 검색을 위해 가져오기 
	boarddao bdao = new boarddao();
	
	bdao.updatercnt(num); 
	
	boardbean bbean = bdao.numboard(num);
	
	int cnum = bbean.getNum();	
	String cname = bbean.getName();
	int creadcount = bbean.getReadcount();
	// 날짜 형식 
	SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	Timestamp cdate = bbean.getDate();
	String newdate = f.format(cdate);
	// 글 내용 조작 	
	String ccontent = "";
	if(bbean.getContent() != null){
		ccontent = bbean.getContent().replace("\r\n","<br/>").replaceAll(" ", "&nbsp;")
									 .replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");}
	// 조회 값 
	String csubject = bbean.getSubject();
	int cre_ref = bbean.getRe_ref();
	int cre_lev = bbean.getRe_lev();
	int cre_seq = bbean.getRe_seq();
	
%>

<body>
  	<!-- header.jsp -->
	<jsp:include page="../include/header.jsp" />
 	<div class="custom-border-bottom py-3">
		<div class="container">
			<div class="row">
				<div class="col-md-12 mb-0"><a href="http://localhost:<%=request.getServerPort() %><%=request.getContextPath()%>">Home</a><span class="mx-2 mb-0">/</span> 
			</div>
		</div>
	</div> 
		<div class="container">
		<div class="row">
			<table class="table table-striped" style="table-align: center; border: 1px solid #dddddd">
				<tr>
					<td>글번호</td>
					<td><%=cnum %></td>
					<td>조회수</td>
					<td><%=creadcount %></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><%out.print(cname);%></td>
					<td>작성일</td>
					<td><%out.print(newdate);%></td>
				</tr>
				<tr>
					<td>글제목</td>
					<td colspan="3"><%=csubject %></td>
				</tr>
				<tr>
					<td>내용</td>
					<td colspan="3" height="600"><%=ccontent %></td>
				</tr>
				<% 
				String userid = (String)session.getAttribute("userid");
				if(userid != null){
				%>
				
			</table>
	</div>
				<div class="text-right">
					<input type="button" value="글수정" class="btn btn-default pull-right" 
						   onclick="location.href='update.jsp?num=<%=num%>&pageNum=<%=pageNum%>'"/>
					<input type="button" value="글삭제" class="btn btn-default pull-right" 
						   onclick="location.href='delete.jsp?num=<%=num%>&pageNum=<%=pageNum%>'"/>
					<input type="button" value="답글쓰기" class="btn btn-default pull-right" 
						   onclick="location.href='rewrite.jsp?num=<%=num%>&re_ref=<%=cre_ref%>&re_lev=<%=cre_lev%>&re_seq=<%=cre_seq%>'"/>
					<input type="button" value="목록보기" class="btn btn-default pull-right" 
						   onclick="location.href='board.jsp?num=<%=num%>&pageNum=<%=pageNum%>'">
				</div>
</div>			

			<%
			}
			%>
	</div>

	<!-- footer.jsp -->
	<jsp:include page="../include/footer.jsp"/>
		<%
		{
			
		}
		%>
	
</body>
</html>