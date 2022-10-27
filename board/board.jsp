<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList" %>
<%@page import="boardDB.boardbean"%>
<%@page import="boardDB.boarddao"%>
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
	boarddao bdao = new boarddao();
	// 전체 글 개수 조회 메서드 getBoardCount() 
	int count = bdao.BoardCount();
	int pageSize = 10;
	
	// 페이지 번호 
	String pageNum = request.getParameter("pageNum");
	
	if(pageNum == null){
		pageNum = "1";
	}
	
	int currentPage = Integer.parseInt(pageNum);
	
	int startRow = (currentPage-1)*pageSize;
	int endRow = currentPage * pageSize;
	
	List<boardbean> list = null;
	if(count>0){
		list = bdao.BoardList(startRow, pageSize);
		System.out.println(list.size()); 
	}

%>

<body>
  	<!-- header.jsp -->
	<jsp:include page="../include/header.jsp" />
 	<div class="custom-border-bottom py-3">
		<div class="container">
			<div class="row">
				<div class="col-md-12 mb-0"><a href="http://localhost:<%=request.getServerPort() %><%=request.getContextPath()%>">Home</a><span class="mx-2 mb-0">/</span> 
				<strong class="text-black">후기게시판</strong></div>
			</div>
		</div>
	</div> 
		<div class="container">
			<table class="table table-hover" style="table-align: center; border: 1px solid #dddddd">
				<tr>
					<td style="background-color:  #eeeeee; text-align: center; align: left; width:10%;">번호</td>
					<td style="background-color:  #eeeeee; text-align: center;">제목</td>
					<td style="background-color:  #eeeeee; text-align: center; align: right; width:10%;">작성자</td>
					<td style="background-color:  #eeeeee; text-align: center; align: right; width:15%;">작성일</td>
					<td style="background-color:  #eeeeee; text-align: center; align: right; width:10%;">조회수</td>
				</tr>
				<% 
					if(count>0){
						for(int i=0; i<list.size(); i++){
							boardbean bbean = list.get(i);
				%>
					<tr align="center" onclick="location.href='content.jsp?num=<%=bbean.getNum()%>&pageNum=<%=pageNum%>'">
						<td><%=bbean.getNum() %></td>
						<td class="left" align="left">
				<%
							int wid = 0; //답변글에 대한 들여쓰기 값 저장
							
							//답변글에 대한 들여쓰기 값이 0보다 크므로
							//답변글이라면? 
							if(bbean.getRe_lev() > 0){
								//들여쓰기 값 처리
								wid = bbean.getRe_lev() * 10;	
				%>	
						<img src="../images/level.gif" width="<%=wid%>" height="15">
						<img src="../images/re.gif">
				<%
					}
				%>
						<%=bbean.getSubject()%>
						</td>
						<td><%=bbean.getName() %></td>
						<td><%=new SimpleDateFormat("yyyy-MM-dd").format(bbean.getDate())%></td>
						<td><%=bbean.getReadcount() %></td>
					</tr>
				<% 			
						}
					}else{
				%>
					<tr>
						<td colspan="5" align="center">게시판 글 없음</td>
					</tr>
				<% 
					}
				%>
			</table>
			<% 
				String userid = (String)session.getAttribute("userid");
				if(userid != null){
			%>
				<div class="text-right">
					<input type="button" value="글쓰기" class="btn btn-default pull-right" onclick="location.href='write.jsp'" align="right">
				</div>
			<% 
				}
			%>	
		<div class="text-center">
			<tr class="pagination">
				<td colspan="6" align="center">
					<%	
						if(count > 0){
							int pageCount = count / pageSize + (count%pageSize == 0 ? 0 : 1);
							int pageBlock = 10;
							int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
							int endPage = startPage + pageBlock - 1;
							
							if(endPage > pageCount){
								endPage = pageCount;
							}
							if(startPage > pageBlock){ 
					%>
								<a href="board.jsp?pageNum=<%=startPage - 10%>">[이전]
					<%			
							}
							
							for(int i=startPage; i <= endPage; i++){ 
								if(i == currentPage){ 
					%>
									[<%=i %>]
					<%									
								}else{ 
					%>
									<a href="board.jsp?pageNum=<%=i%>">[<%=i %>]</a>
					<%	
								}
							} 
							
							if(endPage < pageCount){ 
					%>
								<a href="board.jsp?pageNum=<%=startPage + 10 %>">[다음]</a>
					<%			
							}
						}
					%>
				</td>
			</tr>
		</div>
		<form id="_dataForm" method="post" action="/user/join/complete">
			<input type="hidden" id="_formName" name="name"><br>
			<input type="hidden" id="_formId" name="userid"><br>
			<input type="hidden" id="_formType" name="usertype">
		</form>
		</div>
	</div>

	<!-- footer.jsp -->
	<jsp:include page="../include/footer.jsp"/>
	
	
</body>
</html>