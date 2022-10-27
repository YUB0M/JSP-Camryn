<%@page import="memberDB.membean"%>
<%@page import="memberDB.memdao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
	String userid = (String)session.getAttribute("userid");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 작성</title>
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
	
<title>게시글 작성</title>
</head>

<body>
  	<!-- header.jsp -->
	<jsp:include page="../include/header.jsp"/>
	<div class="custom-border-bottom py-3">
		<div class="container">
			<div class="row">
				<div class="col-md-12 mb-0"><a href="http://localhost:<%=request.getServerPort() %><%=request.getContextPath()%>">Home</a> <span class="mx-2 mb-0">/</span> 
				<strong class="text-black">글쓰기</strong></div>
			</div>
		</div>
	</div>
	<article>
		<form action="writePro.jsp" method="post">
			<div class="container">
				<div class="row">
					<table class="table table-striped" style="table-align: center; border: 1px solid #dddddd">
						<thead>
							<tr>
								<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글쓰기 양식</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input type="text" class="form-control" value="<%=userid%>" name="name" maxlength="50" readonly/></td>
							</tr>
							<tr>
								<td><input type="password" class="form-control" placeholder="비밀번호" name="password" maxlength="50"/></td>
							</tr>
							<tr>
								<td><input type="text" class="form-control" placeholder="글 제목" name="subject" maxlength="50"/></td>
							</tr>
							<tr>
								<td><input type="text" class="form-control" placeholder="글 내용" name="content" maxlength="2048" style="height: 350px"/></td>
							</tr>
						</tbody>
					</table>
					<div id="table_search" class="text-right"> 
						<input type="submit" value="글쓰기" class="btn btn-primary">
						<input type="reset" value="다시작성" class="btn btn-warning">
						<input type="button" value="글목록" class="btn btn-primary pull-right" onclick="location.href='board.jsp'">
					</div>
				</div>
			</div>
		</form>
	</article>
	<!-- footer.jsp -->
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>