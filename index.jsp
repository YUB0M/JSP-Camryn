<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>캠린이 : 캠핑초보 커뮤니티 </title>
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
	<!-- css script-->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
    <link rel="stylesheet" href="fonts/icomoon/style.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/jquery-ui.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/aos.css">
    <link rel="stylesheet" href="css/style.css">
    <script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>
</head>
<body>
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
									<a href="#" class="dropdown-toggle"
										data-toggle="dropdown" role="button" aria-haspopup="true"
										aria-expanded="false"><%=userid %><span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="<%=request.getContextPath() %>/member/joinUpdate.jsp"><b>회원정보수정</b></a></li>
										<li><a href="<%=request.getContextPath() %>/member/joinDelete.jsp"><b>회원탈퇴</b></a></li>
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
							<a href="index.jsp" class="js-logo-clone">CAMPRYN</a><br>
						</div>
					</div>
					<div class="main-nav d-none d-lg-block">
						<nav class="site-navigation text-right text-md-center" role="navigation">
							<ul class="site-menu js-clone-nav d-none d-lg-block">
								<li class="has-children active">
								<a href="http://localhost:<%=request.getServerPort() %><%=request.getContextPath() %>/index.jsp"><b>전체 카테고리</b></a>
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
						<a href="cart.jsp" class="icons-btn d-inline-block bag">
							<span class="icon-shopping-bag"></span>
						</a>
						<a href="#" class="site-menu-toggle js-menu-toggle ml-3 d-inline-block d-lg-none"><span class="icon-menu"></span></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
    <div class="site-blocks-cover" data-aos="fade">
      <div class="container">
        <div class="row">
          <div class="col-md-6 ml-auto order-md-2 align-self-start">
            <div class="site-block-cover-content">
            <h2 class="sub-title">#New Summer 2020</h2>
            <h1>함께하면 더 좋은<br>여름 캠핑</h1>
            <p><a href="http://localhost:<%=request.getServerPort() %><%=request.getContextPath()%>/board/board.jsp"" class="btn btn-black rounded-0">캠핑후기 남기기</a></p>
            </div>
          </div>
          <div class="col-md-6 order-1 align-self-end">
            <img src="images/model_3.png" alt="Image" class="img-fluid">
          </div>
        </div>
      </div>
    </div>
  
   
	<footer class="site-footer custom-border-top">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-lg-3 mb-4 mb-lg-0">
					<h3 class="footer-heading mb-4">프로모션</h3>
					<a href="#" class="block-6">
						<img src="images/tid338t000042_n_l.jpg" alt="Image placeholder" class="img-fluid rounded mb-4">
						<h3 class="font-weight-light  mb-0">애견동반 캠핑장 OPEN</h3>
						<p>Promo from  July 15 &mdash; 25, 2020</p>
					</a>
				</div>
			<div class="col-lg-5 ml-auto mb-5 mb-lg-0">
				<div class="row">
					<div class="col-md-12">
						<h3 class="footer-heading mb-4">퀵링크</h3>
					</div>
					<div class="col-md-6 col-lg-4">
						<ul class="list-unstyled">
							<li><a href="#">Sell online</a></li>
							<li><a href="#">Features</a></li>
							<li><a href="cart.jsp">Shopping cart</a></li>
							<li><a href="#">Store builder</a></li>
						</ul>
					</div>
					<div class="col-md-6 col-lg-4">
						<ul class="list-unstyled">
							<li><a href="#">Mobile commerce</a></li>
							<li><a href="#">Dropshipping</a></li>
							<li><a href="#">Website development</a></li>
						</ul>
					</div>
					<div class="col-md-6 col-lg-4">
						<ul class="list-unstyled">
							<li><a href="#">Point of sale</a></li>
							<li><a href="#">Hardware</a></li>
							<li><a href="#">Software</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-md-6 col-lg-3">
				<div class="block-5 mb-5">
				<h3 class="footer-heading mb-4">인포메이션</h3>
					<ul class="list-unstyled">
						<li class="address">203 Fake St. Mountain View, San Francisco, California, USA</li>
						<li class="phone"><a href="tel://23923929210">+2 392 3929 210</a></li>
						<li class="email">emailaddress@domain.com</li>
					</ul>
				</div>
	
			</div>
		</div>
			<div class="row pt-5 mt-5 text-center">
				<div class="col-md-12">
					<p>
					Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved </a>
					</p>
				</div>
			</div>
		</div>  
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
 	<script src="js/jquery-ui.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/aos.js"></script>
	<script src="js/main.js"></script>
    
  </body>
</html>