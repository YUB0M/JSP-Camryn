<%@page import="boardDB.boardbean"%>
<%@page import="boardDB.boarddao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String userid = (String)session.getAttribute("userid");
	if(userid == null){
		response.sendRedirect("../member.login.jsp");
	}
	
	request.setCharacterEncoding("UTF-8");
	
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	
	boarddao bdao = new boarddao();
	boardbean bbean = bdao.numboard(num);
	
	int DBnum = bbean.getNum(); 			
	String DBName = bbean.getName(); 		
	String DBSubject = bbean.getSubject(); 	
	String DBContent = ""; 
	
	if(bbean.getContent() != null){ 
		DBContent = bbean.getContent().replace("\r\n", "<br>");
	}
	
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 수정</title>
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
	
	<!-- include libraries(jQuery, bootstrap) -->
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	<!-- include summernote css/js -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	
	<script>
	$(document).ready(function() {
		  $('#summernote').summernote({
			  height: 600, 
			  minHeight: null, 
			  maxHeight: null,  
			  focus: true  
		  });
		});
	</script>
	
	
<title>게시글 수정</title>
</head>

<body>
  	<!-- header.jsp -->
	<jsp:include page="../include/header.jsp"/>
	<div class="custom-border-bottom py-3">
		<div class="container">
			<div class="row">
				<div class="col-md-12 mb-0">
					<a href="http://localhost:<%=request.getServerPort() %><%=request.getContextPath()%>">Home</a> 
					<span class="mx-2 mb-0">/</span> 
					<strong class="text-black">일반게시판</strong>
					<span class="mx-2 mb-0">/</span> 
					<strong class="text-black">글수정</strong>
				</div>
			</div>
		</div>
	</div>
	
	<article>
		<form action="updatePro.jsp?pageNum=<%=pageNum%>" method="post">
		<input type="hidden" name="num" value=<%=num %>>
			<div class="container">
				<div class="row">
					<table class="table table-striped" style="table-align: center; border: 1px solid #dddddd">
						<thead>
							<tr>
								<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시글 수정</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><%=session.getAttribute("userid") %></td>
							</tr>
							<tr>
								<td><input type="password" class="form-control" value="<%=bbean.getPassword() %>" placeholder="비밀번호" name="password" maxlength="50"/></td>
							</tr>
							<tr>
								<td><input type="text" class="form-control" value="<%=bbean.getSubject() %>" placeholder="글 제목" name="subject" maxlength="50"/></td>
							</tr>
							<tr>
								<td><textarea type="text" class="form-control" value="<%=bbean.getContent() %>" name="content" maxlength="2048" style="height: 350px"><%=bbean.getContent() %></textarea></td>
							</tr>
						</tbody>
					</table>
					<div id="table_search"> 
						<input type="submit" value="글수정" class="btn btn-primary">
						<input type="reset" value="다시작성" class="btn btn-warning">
						<input type="button" value="글목록" class="btn btn-primary pull-right" onclick="location.href='board.jsp?pageNum=<%=pageNum%>'">
					</div>
				</div>
			</div>
		</form>
	
	
	</article>
	
	<!-- footer.jsp -->
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>