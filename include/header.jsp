<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<header>
	<script>
	function login() {
		var width = 480;
		var height = 500;
		var winL = (screen.width - width) / 2;
		var winT = (screen.height - height) / 2;
		var property = "width=" + width + "," + "height=" + height + "," 
						+ "left=" + winL + "," + "top=" + winT + " menubar=no";
		
		window.open("http://localhost:<%=request.getServerPort() %><%=request.getContextPath() %>/member/login.jsp", "Login Page", property);
	}
	</script>
	<!-- 뷰포트 -->
	<meta name="viewport" content="width=device-width" initial-scale="1">
	<!-- 스타일시트 참조  -->
	<link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
    <link rel="stylesheet" href="../fonts/icomoon/style.css">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/magnific-popup.css">
    <link rel="stylesheet" href="../css/jquery-ui.css">
    <link rel="stylesheet" href="../css/owl.carousel.min.css">
    <link rel="stylesheet" href="../css/owl.theme.default.min.css">
    <link rel="stylesheet" href="../css/aos.css"">
    <link rel="stylesheet" href="../css/style.css">
	<link rel="stylesheet" href="../css/motion.css">
	<div class="site-wrap">
		<div class="site-navbar bg-white py-2">
			<div class="search-wrap">
				<div class="container">
					<a href="#" class="search-close js-search-close"><span class="icon-close2"></span></a>
					<form action="#" method="post" onsubmit="return checkForm();">
						<input type="text" class="form-control" placeholder="Search keyword and hit enter...">
					</form>  
				</div>
			</div>
			<div class="container">
				<div class="d-flex flex-row-reverse bd-highlight">
						<%
						request.setCharacterEncoding("utf-8");
						// 로그인을 한 회원이라면 해당 ID가 담기게 되고 아니라면 null이 담기게 됨 
						String userid = null;
						if (session.getAttribute("userid") != null) {
							userid = (String)session.getAttribute("userid");
						}
						%>
						<% 
						if(userid == null){
						%>
							<a href="<%=request.getContextPath() %>/member/join.jsp"><b>회원가입</b></a>
							<a> &nbsp;&nbsp;|&nbsp;&nbsp; </a>
							<a href="<%=request.getContextPath() %>/member/login.jsp"><b>로그인</b></a>
						<%
						} else { 
						%>	
							<a href="<%=request.getContextPath() %>/member/logoutPro.jsp"><b>로그아웃</b></a>
							<a> &nbsp;&nbsp;|&nbsp;&nbsp; </a>
							<ul class="nav navbar-nav navbar-right">
								<li class="dropdown">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown" 
										role="button" aria-haspopup="true" aria-expanded="false">
										<%=userid%><span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="<%=request.getContextPath() %>/member/joinUpdate.jsp"><b>회원정보수정</b></b></a></li>
										<li><a href="<%=request.getContextPath() %>/member/joinDelete.jsp"><b>회원탈퇴</b></b></a></li>
									</ul>
								</li>
							</ul>
						<%
						}
						%>
				</div>
				<div class="d-flex align-items-center justify-content-between">
					<div class="logo">
						<div class="site-logo">
							<a href="<%=request.getContextPath()%>/index.jsp" class="js-logo-clone">CAMPRYN</a>
						</div>
					</div>
					<div class="main-nav d-none d-lg-block">
						<nav class="site-navigation text-right text-md-center" role="navigation">
							<ul class="site-menu js-clone-nav d-none d-lg-block">
								<li class="has-children active">
								<a href="<%=request.getContextPath()%>/index.jsp">전체 카테고리</a>		
								<ul class="dropdown">
										<li><a href="#">Menu One</a></li>
										<li><a href="#">Menu Two</a></li>
										<li><a href="#">Menu Three</a></li>
										<li class="has-children">
											<a href="#">Sub Menu</a>
											<ul class="dropdown">
												<li><a href="#">Menu One</a></li>
												<li><a href="#">Menu Two</a></li>
											</ul>
										</li>
									</ul>
								</li>
								<li><a href="<%=request.getContextPath()%>/shop/CamAllList.jsp"><b>캠핑용품</b></a></li>
								<li><a href="<%=request.getContextPath()%>/board2/board.jsp"><b>캠핑뉴스</b></a></li>
								<li><a href="<%=request.getContextPath()%>/board/board.jsp"><b>캠핑후기</b></a></li>
							</ul>
						</nav>
					</div>
					<div class="icons">
						<a href="#" class="icons-btn d-inline-block js-search-open"><span class="icon-search"></span></a>
						<a href="#" class="icons-btn d-inline-block"><span class="icon-heart-o"></span></a>
						<a href="cart.html" class="icons-btn d-inline-block bag">
							<span class="icon-shopping-bag"></span>
						</a>
						<a href="#" class="site-menu-toggle js-menu-toggle ml-3 d-inline-block d-lg-none"><span class="icon-menu"></span></a>
					</div>
				</div>
			</div>
		</div>
	</div>


</header>