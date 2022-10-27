<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
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
<body>
  	<!-- header.jsp -->
	<jsp:include page="../include/header.jsp" />
 	<div class="custom-border-bottom py-3">
		<div class="container">
			<div class="row">
				<div class="col-md-12 mb-0"><a href="http://localhost:<%=request.getServerPort() %><%=request.getContextPath()%>">Home</a><span class="mx-2 mb-0">/</span> 
				<strong class="text-black">로그인</strong></div>
			</div>
		</div>
	</div> 
	<div id="_container" class="mainContainer" align="center" ">
		<div class="container_inner">
			<div id="_contents" class="contents_wrap ">
				<div id="_contentsMember" class="content_wide member" data-pageType="general">
					<div class="member_wrap">
						<article class="container">
							<div class="page-header">
								<div class="col-md-6 col-md-offset-3">
									<h4 class="subListname">로그인</h4>
								</div>
							</div>
								<form action="loginPro.jsp" method="post" id="loginform" style="max-width: 453px;">
									<div class="card-body">
										<form class="form-login" method="POST" onSubmit="logincall();return false">
											<label for="inputEmail" class="sr-only">Your ID</label>
											<input type="text" id="uid" name="userid" class="form-control" placeholder="아이디를 입력하세요."/><br>
											<label for="inputPassword" class="sr-only">Password</label>
											<input type="password" id="upw" name="password" class="form-control" placeholder="비밀번호를 입력하세요."/><br>
										<label><a href="join.jsp" value="회원가입"/>회원가입</a></label>
										<button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit"/>로 그 인</button>
										</form>
									</div>
								</form>
						</article>
					</div>
				</div>
			</div>
    	    
			<form id="_dataForm" method="post" action="/user/join/complete">
				<input type="hidden" id="_formName" name="userName"><br>
				<input type="hidden" id="_formId" name="userId"><br>
				<input type="hidden" id="_formType" name="userType">
			</form>
		</div>
	</div>

	<!-- footer.jsp -->
	<jsp:include page="../include/footer.jsp"/>
	
	
</body>
</html>