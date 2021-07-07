<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Jeju Guseok Guseok</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Travelix Project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/jejuguseok/styles/bootstrap4/bootstrap.min.css">
<link href="/jejuguseok/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/jejuguseok/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="/jejuguseok/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="/jejuguseok/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="/jejuguseok/styles/main_styles.css">
<link rel="stylesheet" type="text/css" href="/jejuguseok/styles/responsive.css">
<!-- 추가 css --> <link rel="stylesheet" type="text/css" href="/jejuguseok/styles/bootstrap.min.css">
</head>


<!-- 회원 가입 폼! -->

<script language="JavaScript">
    
    function checkIt() {
        var userinput = eval("document.userinput");
        if(!userinput.id.value) {
            alert("ID를 입력하세요");
            return false;
        }
        
        if(!userinput.passwd.value ) {
            alert("비밀번호를 입력하세요");
            return false;
        }
        if(userinput.passwd.value != userinput.passwd2.value)
        {
            alert("비밀번호를 동일하게 입력하세요");
            return false;
        }
       
        if(!userinput.username.value) {
            alert("사용자 이름을 입력하세요");
            return false;
        }
        if(!userinput.jumin1.value  || !userinput.jumin2.value )
        {
            alert("주민등록번호를 입력하세요");
            return false;
        }
    }

    // 아이디 중복 여부를 판단
    function openConfirmid(userinput) {
        // 아이디를 입력했는지 검사
        if (userinput.id.value == "") {
            alert("아이디를 입력하세요");
            return;
        }
        // url과 사용자 입력 id를 조합합니다.
        url = "/userpage/login/confirmId.do?id="+userinput.id.value ;
        
        // 새로운 윈도우를 엽니다.
        open(url, "confirm",  "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200");
    }
</script>

<body>

<div class="super_container">
		<!-- Header -->

	<header class="header">

		<!-- Main Navigation -->

		<nav class="main_nav">
			<div class="container">
				<div class="row">
					<div class="col main_nav_col d-flex flex-row align-items-center justify-content-start">
						<div class="logo_container">
							<div class="logo"><a href="#"><img src="/jejuguseok/images/logo_jeju3.png" alt=""></a></div>
						</div>
						<div class="main_nav_container ml-auto">
							<ul class="main_nav_list">
								<li class="main_nav_item"><a href="#">home</a></li>
								<li class="main_nav_item"><a href="about.html">여행일정 만들기</a></li>
								<li class="main_nav_item"><a href="offers.html">나의 여행</a></li>
								<li class="main_nav_item"><a href="blog.html">관광지</a></li>
								<li class="main_nav_item"><a href="blog.html">숙박</a></li>
								<li class="main_nav_item"><a href="blog.html">장소 추천</a></li>
								<li class="main_nav_item"><a href="contact.html">contact</a></li>
							</ul>
						</div>
						
						
						
						<form id="search_form" class="search_form bez_1">
							<input type="search" class="search_content_input bez_1">
						</form>

						<div class="hamburger">
							<i class="fa fa-bars trans_200"></i>
						</div>
					</div>
				</div>
			</div>	
		</nav>

	</header>

	<div class="menu trans_500">
		<div class="menu_content d-flex flex-column align-items-center justify-content-center text-center">
			<div class="menu_close_container"><div class="menu_close"></div></div>
			<div class="logo menu_logo"><a href="#"><img src="images/logo.png" alt=""></a></div>
			<ul>
				<li class="menu_item"><a href="#">home</a></li>
				<li class="menu_item"><a href="about.html">about us</a></li>
				<li class="menu_item"><a href="offers.html">offers</a></li>
				<li class="menu_item"><a href="blog.html">news</a></li>
				<li class="menu_item"><a href="contact.html">contact</a></li>
			</ul>
		</div>
	</div>



<!-- 회원 가입 폼! -->

<div>
<div style=" width:50%;" >
		
	 <br /> <br /> <br /> <br /> <br /> <br /> <h2> 회원가입 </h2>

<form  name="userinput"  action="/jejuguseok/userpage/login/registerPro.do" onSubmit="return checkIt()">
 <fieldset> 
    
     <div class="form-group">
      <label for="exampleInputPassword1" class="form-label mt-4">이름</label>
      <input type="text" class="form-control" id="name" placeholder="이름 입력 ">
    </div>
    
         <div class="form-group">
      <label for="exampleInputPassword1" class="form-label mt-4">아이디</label>
      <input type="text" class="form-control" id="id" placeholder="아이디 입력"> 
      <input type="button" name="confirm_id" value="ID 중복확인" 
        							OnClick="openConfirmid(this.form)">
    </div>
         <div class="form-group">
      <label for="exampleInputPassword1" class="form-label mt-4">비밀번호</label>
      <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
    </div>
    
    
    <div class="form-group">
      <label for="exampleInputEmail1" class="form-label mt-4">이메일</label>
      <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
      <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
    </div>
 
    <div class="form-group">
      <label for="exampleSelect1" class="form-label mt-4">태어난 년도</label>
      <select class="form-select" id="exampleSelect1">
        <option>1990</option><option>1991</option>
        <option>1992</option><option>1993</option><option>1994</option><option>1995</option>
        <option>1996</option><option>1997</option><option>1998</option> <option>1999</option>
        <option>2000</option><option>2001</option><option>2002</option><option>2003</option>

      </select>
    </div>
    
      <fieldset class="form-group">
      <legend class="mt-4"> 성별 </legend>
      <div class="form-check">
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="optionsRadios" id="male" value="male" checked="">
          남성
        </label>
      </div>
      <div class="form-check">
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="optionsRadios" id="female" value="female">
          여성
        </label>
      </div>
    </fieldset>
    
    <div class="form-group">
      <label for="exampleSelect1" class="form-label mt-4">거주 지역</label>
      <select class="form-select" id="exampleSelect1">
        <option>서울</option><option>경기</option>
        <option>인천</option><option>광주/전라</option><option>강원</option>
        <option>대전/충청/세종</option><option>부산/대구/경상</option>
      </select>
    </div>
    
    
    
   
    <button type="submit" class="btn btn-primary">Submit</button>
  </fieldset>
</form> <br /> <br /> 	
	

	</div>
</div>




<!-- 2  -->
<form method="post" action="/spring/member/inputPro.do" name="userinput" onSubmit="return checkIt()">
  <table width="600" border="1" cellspacing="0" cellpadding="3" align="center" >
    <tr> 
    <td colspan="2" height="39" align="center" bgcolor="${value_c}" >
       <font size="+1" ><b>회원가입</b></font></td>
    </tr>
    <tr> 
      <td width="200" bgcolor="${value_c}"><b>아이디 입력</b></td>
      <td width="400" bgcolor="${value_c}">&nbsp;</td>
    </tr>  

    <tr> 
      <td width="200"> 사용자 ID</td>
      <td width="400"> 
        <input type="text" name="id" size="10" maxlength="12">
        <input type="button" name="confirm_id" value="ID중복확인" 
        							OnClick="openConfirmid(this.form)">
      </td>
    </tr>
    <tr> 
      <td width="200"> 비밀번호</td>
      <td width="400" > 
        <input type="password" name="passwd" size="15" maxlength="12">
      </td>
    <tr>  
      <td width="200">비밀번호 확인</td>
      <td width="400"> 
        <input type="password" name="passwd2" size="15" maxlength="12">
      </td>
    </tr>
    
    <tr> 
      <td width="200" bgcolor="${value_c}"><b>개인정보 입력</b></td>
      <td width="400" bgcolor="${value_c}">&nbsp;</td>
    <tr>  
    <tr> 
      <td width="200">사용자 이름</td>
      <td width="400"> 
        <input type="text" name="name" size="15" maxlength="10">
      </td>
    </tr>
    <tr> 
      <td width="200">주민등록번호</td>
      <td width="400"> 
        <input type="text" name="jumin1" size="7" maxlength="6">
        -<input type="text" name="jumin2" size="7" maxlength="7">
      </td>
    </tr>
    <tr> 
      <td width="200">E-Mail</td>
      <td width="400"> 
        <input type="text" name="email" size="40" maxlength="30">
      </td>
    </tr>
    <tr> 
      <td width="200"> Blog</td>
      <td width="400"> 
        <input type="text" name="blog" size="60" maxlength="50">
      </td>
    </tr>
    <tr> 
      <td colspan="2" align="center" bgcolor="${value_c}"> 
          <input type="submit" name="confirm" value="등   록" >
          <input type="reset" name="reset" value="다시입력">
          <input type="button" value="가입안함" onclick="javascript:window.location='/spring/member/main.do'">
      </td>
    </tr>
  </table>
</form>



<script src="js/jquery-3.2.1.min.js"></script>
<script src="styles/bootstrap4/popper.js"></script>
<script src="styles/bootstrap4/bootstrap.min.js"></script>
<script src="plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="plugins/easing/easing.js"></script>
<script src="js/custom.js"></script>

</body>

</html>
