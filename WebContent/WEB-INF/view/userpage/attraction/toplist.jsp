<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Offers</title> 
<meta charset="utf-8"> 
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Travelix Project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/jejuguseok/styles/bootstrap4/bootstrap.min.css">
<link href="/jejuguseok/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/jejuguseok/styles/offers_styles.css">
<link rel="stylesheet" type="text/css" href="/jejuguseok/styles/offers_responsive.css">
<!-- 추가 css --> <link rel="stylesheet" type="text/css" href="/jejuguseok/styles/bootstrap.min.css">
</head>

<body>
<%@ include file ="/WEB-INF/view/userpage/header.jsp" %>	<!-- Header --> 
<div class="super_container">
	

	<!-- 관광지 추천 페이지   --> 

	<div class="home">
		<div class="home_background parallax-window" data-parallax="scroll" data-image-src="images/beach.jpg"></div>
		<div class="home_content">
			<div class="home_title">  </div>
		</div>
	</div>

	<!-- Offers -->

	<div class="offers">

		<!-- 설명 -->
	
		<h3 align="center">${age}관광지 TOP 10  </h3> <br/>
		<div align="center">      
        <button type="button" class="btn btn-primary "  onclick="location.href=atttoplist.do" >  관광지 </button>      
        <button type="button" class="btn btn-danger "  onclick="location.href='recommend.do';" >  숙 소 </button>
        </div>      				
		<!-- 지역 선택  -->
 <div id=recommend align="center">
 <div class="button book_buttonn"><a href="atttoplist.do">전체</a></div> 

 <div class="button book_buttonn " ><a href="atttoplistsearch.do?search=1">20대</a></div>
 <div class="button book_buttonn  "><a href="atttoplistsearch.do?search=2">30대</a></div>
 <div class="button book_buttonn"><a href="atttoplistsearch.do?search=3">40대</a></div>
 <div class="button book_buttonn"><a href="atttoplistsearch.do?search=4">50대</a></div>

 </div>
 
  
  
 
		<div class="container">
			<div class="row">
				<div class="col-lg-1 temp_col"></div>
				<div class="col-lg-11">
					
					
					<!-- Offers Sorting 카테고리 선택  -->
					<div class="offers_sorting_container">
						
					</div>
				</div>

				<div class="col-lg-12">
				
				
		<!-- Offers Grid : 숙소 리스트  -->

					<div class="offers_grid">
						
						<!-- Offers Item -->
			<c:if test="${count > 0}"> 
					
							<c:forEach var="attCount" items="${attCount}" varStatus="status" >
								
						<div class="offers_item ${attCount.name} "> <!-- ${guesthouse}  -->
						 
							<div class="row"> 
								<div class="col-lg-1 temp_col"></div>
								<div class="col-lg-3 col-1680-4">
									<div class="offers_image_container">
										<!-- Image by https://unsplash.com/@kensuarez -->
										
									<c:if test="${attCount.category == 'healing'}">	
										<div class="offers_image_background" style="background-image:url(images/offer_6.jpg)"></div>
									</c:if>	
									<c:if test="${attCount.category == 'leisure'}">	
										<div class="offers_image_background" style="background-image:url(images/offer_5.jpg)"></div>
									</c:if>		
									<c:if test="${attCount.category == 'nature'}">	
										<div class="offers_image_background" style="background-image:url(images/offer_8.jpg)"></div>
									</c:if>	
									<c:if test="${attCount.category == 'history'}">	
										<div class="offers_image_background" style="background-image:url(images/offer_7.jpg)"></div>
									</c:if>	
									
									<c:if test="${attCount.location == 'jejusi'}">	
										<div class="offer_name"><a href="#">제주시</a></div>
									</c:if>
									<c:if test="${attCount.location == 'seoquiposi'}">	  <!-- seogwiposi  -->
										<div class="offer_name"><a href="#">서귀포시</a></div>
									</c:if>
									<c:if test="${attCount.location == 'jungmun'}">	
										<div class="offer_name"><a href="#">중문</a></div>
									</c:if> 
									<c:if test="${attCount.location == 'jejuairport'}">	
										<div class="offer_name"><a href="#">제주국제공항</a></div>
									</c:if>
									<c:if test="${attCount.location == 'aweol'}">	
										<div class="offer_name"><a href="#">애월/한림/협재</a></div>
									</c:if>	
									<c:if test="${attCount.location == 'pyoseon'}">	
										<div class="offer_name"><a href="#">표선/성산</a></div>
									</c:if>	
									<c:if test="${attCount.location == 'hamduk'}">	
										<div class="offer_name"><a href="#">함덕/김녕/세화</a></div>
									</c:if>	
										
										
									</div>
								</div>
							
								<div class="col-lg-8">
									<h3>TOP${status.index+1}</h3>
									<div class="offers_content">
									
										<div class="offers_price">${attCount.name} <span> ${attCount.location} </span></div>
										<div class="rating_r rating_r_4 offers_rating" data-rating="4">
											관광지 종류 : ${attCount.category}
										</div>
								 
										<p class="offers_text"> ${attCount.content} </p>
										<p class="offers_text"> ${attCount.address} </p>
										<div class="offers_icons">
											<ul class="offers_icons_list">
												<li class="offers_icons_item"><img src="images/post.png" alt=""></li>
												<li class="offers_icons_item"><img src="images/compass.png" alt=""></li>
												<li class="offers_icons_item"><img src="images/bicycle.png" alt=""></li>
												<li class="offers_icons_item"><img src="images/sailboat.png" alt=""></li>
											</ul>
										</div>						
									</div>
								</div>
							</div>
						</div>
						
						<br /> <br />
					
					</c:forEach> 
			</c:if>
			
	</div>
				

				</div>
			</div>
		</div>		
	</div>

	

</div>

<script src="/jejuguseok/js/jquery-3.2.1.min.js"></script>
<script src="/jejuguseok/styles/bootstrap4/popper.js"></script>
<script src="/jejuguseok/styles/bootstrap4/bootstrap.min.js"></script>
<script src="/jejuguseok/plugins/Isotope/isotope.pkgd.min.js"></script>
<script src="/jejuguseok/plugins/easing/easing.js"></script>
<script src="/jejuguseok/plugins/parallax-js-master/parallax.min.js"></script>
<script src="/jejuguseok/js/offers_custom.js"></script>

</body>

</html>