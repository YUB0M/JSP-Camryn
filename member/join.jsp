<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
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
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
	
	<!-- 다음 postcode API -->
	 function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("sample6_extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("sample6_extraAddress").value = '';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('zipcode').value = data.zonecode;
	                document.getElementById("addr").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("addr2").focus();
	            }
	        }).open();
	    }
	
	 
		// 정규표현식
		var idReg = /^[A-za-z0-9]{5,12}$/g;			// 아이디 
		var pwdReg = /^[A-za-z0-9!@#$%]{8,16}$/g;	// 비밀번호 
		var nameReg = /^[가-힣ㄱ-ㅎㅏ-ㅣ]{2,10}$/g;	// 이름 
		var emailReg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; //이메일 
		var phoneReg = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/; // 휴대폰 
		var birthReg = /^(19[0-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/; // 생일 
		
		
		// 아이디 
		function idChk() {
			if($("#userid").val() != ""){
				if(!idReg.test($("#userid").val())) {
					$("#id_msg").css("color", "red");
					$("#id_msg").text("5~10자의 영문 소문자, 숫자만 사용 가능합니다.");
					return false;
				}else{
					$("#id_msg").text("");
					return true;
				}
			}else{
				$("#id_msg").html("&nbsp;");
			}
		}		
		
		// 아이디 중복체크 
		var check = 0; // 중복=0, 중복x=1
	    function idCheck() { 
	    	var userid = $("#userid").val();
	        $.ajax({
	        	async : true,
	        	type : 'POST',
		        data : {userid:userid},
		        url: "id_check.jsp",
		        dataType : "text",
		        success:function(data,textStatus){
		        	console.log(data);
					if(data == 1){
							alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
							$("#userid").focus();
						}else{
							alert("사용가능한 아이디입니다.");
						}
					},
					error:function(){
						alert("에러가 발생했습니다." + error);
					}
	          });
	     };
		
		
		// 비밀번호 
		function pwdChk() {
			 if($("#password").val() != ""){
				 if(!pwdReg.test($("#password").val())){
						$("#pwd_msg").css("color","red");
						$("#pwd_msg").text("최소8자, 최대16자의 문자,숫자,특수문자!@#$%만 사용이 가능합니다."); 
						$("#password").focus();
						return false;
				 }else{	
					$("#pwd_msg").text("");
					return true;
				 }
			}else{
				$("#pwd_msg").html("&nbsp;");
			}
		}
			 
		// 비밀번호 확인 
		function pwd2Chk(){ 
			if($("#passwordChk").val() != ""){
				if($("#password").val() != $("#passwordChk").val()){
					$("#pwd2_msg").css("color","red");
					$("#pwd2_msg").text("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
					$("#passwordChk").focus();
					return false;
				} else {
					$("#pwd2_msg").text("");
					return true;
				} 	
			}else{
				$("#pwd2_msg").html("&nbsp;");
			}
		}
		
		// 이름 확인 
		function nameChk() {
			if($("#name").val() != ""){
				if(!nameReg.test($("#name").val())){
					$("#name_msg").css("color","red");
					$("#name_msg").text("이름을 올바르게 입력하세요.");
					$("#name").focus;
					return false;
				} else {
					$("#name_msg").text("");
					return true;
				} 
			} else {
				$("#name_msg").html("&nbsp;");
			}
		}

		function phChk() {
			if($("#phone").val != ""){
				if(!phoneReg.test($("#phone").val())){
					$("#ph_msg").css("color","red");
					$("#ph_msg").text("휴대폰번호를 정확히 입력하세요.");
					$("#phone").focus();
					ph_Check = false;
					return;
				}else{
					$("#ph_msg").text("");
					$("#phone").focus();
					ph_Check = true;
					return;
				} 	
			} else {
				$("#ph_msg").html("&nbsp;");
			}
		}
		
		function bthChk() {
			if($("#birth").val() != ""){
				if(!birthReg.test($("#birth").val())){
					$("#bth_msg").css("color","red");
					$("#bth_msg").text("생년월일을 정확히 (예:1994-01-01) 입력하세요.");
					$("#birth").focus;
					return false;
				}else{
					$("#bth_msg").text("");
					return true;
				} 
			}else {
				$("#bth_msg").html("&nbsp;");
			}
		}
		
		
		 function joinSubmit(){
			if($("#userid").val() == ""){
				alert("아이디를 입력하세요.");
				$("#userid").focus();
				return false;
			}
			
			if($("#password").val() == ""){
				alert("비밀번호를 입력하세요.");
				$("#password").focus();
				return false;
			}
			
			if($("#passwordChk").val() == ""){
				alert("비밀번호 확인을 입력하세요.");
				$("#passwordChk").focus();
				return false;
			}
			
			if($("#zipcode").val() == ""){
				alert("주소를 입력하세요.");
				$("#zipcode").focus();
				return false;
			}
			
			if($("#phone").val() == ""){
				alert("휴대폰 번호를 입력하세요.");
				$("#phone").focus();
				return false;
			}
			
			if($("#birth").val() == ""){
				alert("생년월일을 입력하세요.");
				$("#birth").focus();
				return false;
			
			}
		}
		 
		
			
		
</script>

</head>
<body>
  	<!-- header.jsp -->
	<jsp:include page="../include/header.jsp"/>
	<div class="custom-border-bottom py-3">
		<div class="container">
			<div class="row">
				<div class="col-md-12 mb-0"><a href="http://localhost:<%=request.getServerPort() %><%=request.getContextPath()%>">Home</a> <span class="mx-2 mb-0">/</span> 
				<strong class="text-black">회원가입</strong></div>
			</div>
		</div>
	</div>
	<div id="_container" class="mainContainer" align="center">
		<div class="container_inner">
			<div id="_contents" class="contents_wrap ">
				<div id="_contentsMember" class="content_wide member" data-pageType="general">
					<div class="member_wrap">
						<article class="container">
							<div class="page-header">
								<div class="col-md-6 col-md-offset-3">
									<h4 class="subListname">회원가입</h4>
								</div>
							</div>
							<div class="col-sm-6 col-md-offset-3">
								<form role="form" action="joinPro.jsp" method="post" onsubmit="return joinSubmit()">
									<div class="form-group">
										<label for="InputUserid">아이디</label>
										<div class="idcheck">
											<input type="text" class="form-control" id="userid" name="userid" placeholder="아이디를 입력해주세요" onkeyup="idChk();">
											<input type="button" class="btn btn-danger" id="useridChk" onclick="idCheck();" value="중복확인">
											<span class="inpt_er_text" id="id_msg">&nbsp</span>
										</div>
										<div class="clear"></div>
									</div>
									<div class="form-group">
										<label for="inputPassword">비밀번호</label>
										<input type="password" class="form-control" id="password" name="password" placeholder="비밀번호를 입력해주세요" onkeyup="pwdChk();">
										<span class="inpt_er_text" id="pwd_msg">&nbsp</span>
									</div>
									<div class="form-group">
										<label for="inputPasswordCheck">비밀번호 확인</label>
										<input type="password" class="form-control" id="passwordChk" name="password" placeholder="비밀번호 확인을 위해 다시한번 입력 해 주세요" onkeyup="pwd2Chk();">
										<span class="inpt_er_text" id="pwd2_msg">&nbsp</span>
									</div>
									<div class="form-group">
										<label for="inputName">성명</label>
										<input type="text" class="form-control" id="name" name="name" placeholder="이름을 입력해 주세요" onkeyup="nameChk();">
										<span class="inpt_er_text" id="name_msg">&nbsp</span>
									</div>
									<div class="form-group">
										<label for="inputAddr" class="lbl_type">주소</label>
										<div class="input_area">
										<i class="ico ico_inp_addr"></i>
										<p>
											<input type="text" id="zipcode" name="zipcode" class="inpt_default" placeholder="우편번호" onkeyup="zipChk();">
											<input type="button" class="btns_sys red_big_xb" onclick="sample6_execDaumPostcode()" value="우편번호 찾기&nbsp"><br>
											<input type="text" id="addr" name="addr" class="inpt_default" placeholder="주소" style="width:380px;"><br>
											<input type="text" id="addr2" name="addr2" class="inpt_default" placeholder="상세주소" style="width:380px;">
											<input type="hidden" id="sample6_extraAddress" class="input_default" placeholder="참고항목" style="width:380px;">
										</p>
										<span class="inpt_er_text" id="addr_msg">&nbsp</span>
										</div>
									</div>
									<div class="form-group">
										<label for="inputMobile">휴대폰 번호</label>
										<input type="phone" class="form-control" id="phone" name="phone" placeholder="휴대폰번호를 입력해 주세요" onkeyup="phChk();">
										<span class="inpt_er_text" id="ph_msg">&nbsp</span>
									</div>
									<div class="form-group">
										<label for="InputBirth">생년월일</label>
										<input type="birth" class="form-control" id="birth" name="birth" placeholder="생년월일(ex.1994-01-01)을 입력해주세요" onkeyup="bthChk();">
										<span class="inpt_er_text" id="bth_msg">&nbsp</span>
									</div>
				
									<div class="form-group text-center">
										<button type="submit" id="join-submit" class="btn btn-primary" >
											회원가입<i class="fa fa-check spaceLeft"></i>
										</button>
										<button type="submit" class="btn btn-warning" onclick="history.back();">
											가입취소<i class="fa fa-times spaceLeft"></i>
										</button>
									</div>
								</form>
							</div>
						</article>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- footer.jsp -->
	<jsp:include page="../include/footer.jsp"/>
	
	
</body>
</html>