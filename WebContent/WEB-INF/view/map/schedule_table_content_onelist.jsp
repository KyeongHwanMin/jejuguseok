<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html lang="en">
<head>
<title>Blog</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Travelix Project">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css"
	href="styles/bootstrap4/bootstrap.min.css">
<link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="plugins/colorbox/colorbox.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet" type="text/css" href="styles/blog_styles.css">
<link rel="stylesheet" type="text/css" href="styles/blog_responsive.css">

<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<meta http-equiv="X-UA-Compatible" content="ie=edge"> 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

 <style>
  div.fheader {
        width: 100%;
         height:13%;
        display: flex;
        box-sizing: border-box;   
      }
       div.r {
        width: 100%;
         height:87%;
        display: flex;     
      }
      div.left {
     	width:70%;
        height:100%;
        float: left;
        box-sizing: border-box;
        background: #ece6cc;
      }
      div.right {   	
     	width:30%;
     	height:100%;
        float: right;
        box-sizing: border-box;
        background: #ece6cc;
        overflow:auto;  
      }
      div.card {
      margin:5px;
      width:300px;
     height:200px;
     backgroundColor="white";
      box-sizing: border-box;
      }
    </style>
</head>

<body>


<div class="fheader">
<%@ include file="/WEB-INF/view/userpage/header.jsp"%>
</div>
<div class="r">
      <div class="left">
		

		<!-- 아래는 본인들의 내용 작성하기 -->

		<div id="map" style="width:98% ; height: 87vh;"></div>

		<script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=a95cadba8f57feb150276e9f4194f8aa"></script>
		<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(33.433421435965604, 126.51971115454302), // 지도의 중심좌표
		        level: 9, // 지도의 확대 레벨
		        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
		    }; 
		

		// 지도를 생성한다 
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		
		// 지도에 확대 축소 컨트롤을 생성한다
		var zoomControl = new kakao.maps.ZoomControl();

		// 지도의 우측에 확대 축소 컨트롤을 추가한다
		map.addControl(zoomControl, kakao.maps.ControlPosition.BOTTOMRIGHT);
		
		// 데이터
		
			
	
		 <c:forEach var="mylist"  items="${place1}" varStatus="status">
		// 마커 생성 표시
		var marker =  new kakao.maps.Marker({
			position:new kakao.maps.LatLng(${y_list1.get(status.index)}, ${x_list1.get(status.index)}),
			map:map
			});
		
		// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		//var iwContent = '<div style=padding:30px;>${maplist.address}<br><a href="http://localhost:8080/jejuguseok/index.do" style="color:blue" target="_blank">보기&nbsp</a> <a href="http://localhost:8080/jejuguseok/map.do" style="color:blue" target="_blank">&nbsp길찾기</a></div>'; 
		var iwContent =
        '          <div> &nbsp ${maplist.place}</div>' + 
        '               <div> &nbsp <img src="https://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70"></div>' +
		'				<div>&nbsp	${maplist.address} </div>' +	
        '         <div>&nbsp <a href="https://www.kakaocorp.com/main" target="_blank" class="link">클릭</a></div> ' + 
        ' 				<button type="button" style="width:2% padding:0.5px" id="${place1[status.index] },${y_list1[status.index]}, ${x_list1[status.index]}"  class="btn btn-primary" onclick="add1(this.id,1)" title="1일차 일정추가">1일차</button>'+
        ' 				<button type="button" style="width:2% padding:0.5px" id="${place1[status.index] },${y_list1[status.index]}, ${x_list1[status.index]}"  class="btn btn-danger" onclick="add1(this.id,2)" title="2일차 일정추가">2일차</button>'+
        ' 				<button type="button" style="width:2% padding:0.5px" id="${place1[status.index] },${y_list1[status.index]}, ${x_list1[status.index]}"  class="btn btn-success" onclick="add1(this.id,3)" title="3일차 일정추가">3일차</button>'+
        ' 				<button type="button" style="width:2% padding:0.5px" id="${place1[status.index] },${y_list1[status.index]}, ${x_list1[status.index]}"  class="btn btn-warning" onclick="add1(this.id,4)" title="4일차 일정추가">4일차</button>'+
        ' 				<button type="button" style="width:2% padding:0.5px" id="${place1[status.index] },${y_list1[status.index]}, ${x_list1[status.index]}"  class="btn btn-info" onclick="add1(this.id,5)" title="5일차 일정추가">5일차</button>'+
        ' 				<button type="button" style="width:2% padding:0.5px" id="${place1[status.index] },${y_list1[status.index]}, ${x_list1[status.index]}"  class="btn  btn-dark" onclick="add1(this.id,6)" title="6일차 일정추가">6일차</button>&nbsp&nbsp<br>';
	    
	    
	    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
	// 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
	     
	    content : iwContent, 
	    removable : iwRemoveable
	});
	kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindow));

	// 일정 추가 버튼 메서드
	function add1(id,n) {		
			var id = id.split(',');
		document.getElementById("p_place"+n).value = id[0];
		document.getElementById("p_y"+n).value = id[1];
		document.getElementById("p_x"+n).value = id[2];				
	}
	</c:forEach>
// 1111111111111111111111111111111111111111111111
<c:forEach var="mylist"  items="${place2}" varStatus="status">
		// 마커 생성 표시
		var marker =  new kakao.maps.Marker({
			position:new kakao.maps.LatLng(${y_list2.get(status.index)}, ${x_list2.get(status.index)}),
			map:map
			});
		
		// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		//var iwContent = '<div style=padding:30px;>${maplist.address}<br><a href="http://localhost:8080/jejuguseok/index.do" style="color:blue" target="_blank">보기&nbsp</a> <a href="http://localhost:8080/jejuguseok/map.do" style="color:blue" target="_blank">&nbsp길찾기</a></div>'; 
		var iwContent =
        '          <div> &nbsp ${maplist.place}</div>' + 
        '               <div> &nbsp <img src="https://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70"></div>' +
		'				<div>&nbsp	${maplist.address} </div>' +	
        '         <div>&nbsp <a href="https://www.kakaocorp.com/main" target="_blank" class="link">클릭</a></div> ' + 
        ' 				<button type="button" style="width:2% padding:0.5px" id="${place2[status.index] },${y_list2[status.index]}, ${x_list2[status.index]}"  class="btn btn-primary" onclick="add1(this.id,1)" title="1일차 일정추가">1일차</button>'+
        ' 				<button type="button" style="width:2% padding:0.5px" id="${place2[status.index] },${y_list2[status.index]}, ${x_list2[status.index]}"  class="btn btn-danger" onclick="add1(this.id,2)" title="2일차 일정추가">2일차</button>'+
        ' 				<button type="button" style="width:2% padding:0.5px" id="${place2[status.index] },${y_list2[status.index]}, ${x_list2[status.index]}"  class="btn btn-success" onclick="add1(this.id,3)" title="3일차 일정추가">3일차</button>'+
        ' 				<button type="button" style="width:2% padding:0.5px" id="${place2[status.index] },${y_list2[status.index]}, ${x_list2[status.index]}"  class="btn btn-warning" onclick="add1(this.id,4)" title="4일차 일정추가">4일차</button>'+
        ' 				<button type="button" style="width:2% padding:0.5px" id="${place2[status.index] },${y_list2[status.index]}, ${x_list2[status.index]}"  class="btn btn-info" onclick="add1(this.id,5)" title="5일차 일정추가">5일차</button>'+
        ' 				<button type="button" style="width:2% padding:0.5px" id="${place2[status.index] },${y_list2[status.index]}, ${x_list2[status.index]}"  class="btn  btn-dark" onclick="add1(this.id,6)" title="6일차 일정추가">6일차</button>&nbsp&nbsp<br>';
	    
	    
	    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
	// 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
	     
	    content : iwContent, 
	    removable : iwRemoveable
	});
	kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindow));

	// 일정 추가 버튼 메서드
	function add1(id,n) {		
			var id = id.split(',');
		document.getElementById("p_place"+n).value = id[0];
		document.getElementById("p_y"+n).value = id[1];
		document.getElementById("p_x"+n).value = id[2];				
	}
	</c:forEach>
	// 22222222222222222222222222222222222222222222222222
	<c:forEach var="mylist"  items="${place3}" varStatus="status">
			// 마커 생성 표시
			var marker =  new kakao.maps.Marker({
				position:new kakao.maps.LatLng(${y_list3.get(status.index)}, ${x_list3.get(status.index)}),
				map:map
				});
			
			// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			//var iwContent = '<div style=padding:30px;>${maplist.address}<br><a href="http://localhost:8080/jejuguseok/index.do" style="color:blue" target="_blank">보기&nbsp</a> <a href="http://localhost:8080/jejuguseok/map.do" style="color:blue" target="_blank">&nbsp길찾기</a></div>'; 
			var iwContent =
	        '          <div> &nbsp ${maplist.place}</div>' + 
	        '               <div> &nbsp <img src="https://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70"></div>' +
			'				<div>&nbsp	${maplist.address} </div>' +	
	        '         <div>&nbsp <a href="https://www.kakaocorp.com/main" target="_blank" class="link">클릭</a></div> ' + 
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${place3[status.index] },${y_list3[status.index]}, ${x_list3[status.index]}"  class="btn btn-primary" onclick="add1(this.id,1)" title="1일차 일정추가">1일차</button>'+
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${place3[status.index] },${y_list3[status.index]}, ${x_list3[status.index]}"  class="btn btn-danger" onclick="add1(this.id,2)" title="2일차 일정추가">2일차</button>'+
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${place3[status.index] },${y_list3[status.index]}, ${x_list3[status.index]}"  class="btn btn-success" onclick="add1(this.id,3)" title="3일차 일정추가">3일차</button>'+
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${place3[status.index] },${y_list3[status.index]}, ${x_list3[status.index]}"  class="btn btn-warning" onclick="add1(this.id,4)" title="4일차 일정추가">4일차</button>'+
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${place3[status.index] },${y_list3[status.index]}, ${x_list3[status.index]}"  class="btn btn-info" onclick="add1(this.id,5)" title="5일차 일정추가">5일차</button>'+
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${place3[status.index] },${y_list3[status.index]}, ${x_list3[status.index]}"  class="btn  btn-dark" onclick="add1(this.id,6)" title="6일차 일정추가">6일차</button>&nbsp&nbsp<br>';
		    
		    
		    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
		     
		    content : iwContent, 
		    removable : iwRemoveable
		});
		kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindow));

		// 일정 추가 버튼 메서드
		function add1(id,n) {		
				var id = id.split(',');
			document.getElementById("p_place"+n).value = id[0];
			document.getElementById("p_y"+n).value = id[1];
			document.getElementById("p_x"+n).value = id[2];				
		}
		</c:forEach>
//3333333333333333333333333333333333333333333333333
<c:forEach var="mylist"  items="${place4}" varStatus="status">
			// 마커 생성 표시
			var marker =  new kakao.maps.Marker({
				position:new kakao.maps.LatLng(${y_list4.get(status.index)}, ${x_list4.get(status.index)}),
				map:map
				});
			
			// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			//var iwContent = '<div style=padding:30px;>${maplist.address}<br><a href="http://localhost:8080/jejuguseok/index.do" style="color:blue" target="_blank">보기&nbsp</a> <a href="http://localhost:8080/jejuguseok/map.do" style="color:blue" target="_blank">&nbsp길찾기</a></div>'; 
			var iwContent =
	        '          <div> &nbsp ${maplist.place}</div>' + 
	        '               <div> &nbsp <img src="https://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70"></div>' +
			'				<div>&nbsp	${maplist.address} </div>' +	
	        '         <div>&nbsp <a href="https://www.kakaocorp.com/main" target="_blank" class="link">클릭</a></div> ' + 
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${place4[status.index] },${y_list4[status.index]}, ${x_list4[status.index]}"  class="btn btn-primary" onclick="add1(this.id,1)" title="1일차 일정추가">1일차</button>'+
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${place4[status.index] },${y_list4[status.index]}, ${x_list4[status.index]}"  class="btn btn-danger" onclick="add1(this.id,2)" title="2일차 일정추가">2일차</button>'+
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${place4[status.index] },${y_list4[status.index]}, ${x_list4[status.index]}"  class="btn btn-success" onclick="add1(this.id,3)" title="3일차 일정추가">3일차</button>'+
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${place4[status.index] },${y_list4[status.index]}, ${x_list4[status.index]}"  class="btn btn-warning" onclick="add1(this.id,4)" title="4일차 일정추가">4일차</button>'+
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${place4[status.index] },${y_list4[status.index]}, ${x_list4[status.index]}"  class="btn btn-info" onclick="add1(this.id,5)" title="5일차 일정추가">5일차</button>'+
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${place4[status.index] },${y_list4[status.index]}, ${x_list4[status.index]}"  class="btn  btn-dark" onclick="add1(this.id,6)" title="6일차 일정추가">6일차</button>&nbsp&nbsp<br>';
		    
		    
		    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
		     
		    content : iwContent, 
		    removable : iwRemoveable
		});
		kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindow));

		// 일정 추가 버튼 메서드
		function add1(id,n) {		
				var id = id.split(',');
			document.getElementById("p_place"+n).value = id[0];
			document.getElementById("p_y"+n).value = id[1];
			document.getElementById("p_x"+n).value = id[2];				
		}
		</c:forEach>
//444444444444444444444444444444444444444444444444444
<c:forEach var="mylist"  items="${place5}" varStatus="status">
			// 마커 생성 표시
			var marker =  new kakao.maps.Marker({
				position:new kakao.maps.LatLng(${y_list5.get(status.index)}, ${x_list5.get(status.index)}),
				map:map
				});
			
			// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			//var iwContent = '<div style=padding:30px;>${maplist.address}<br><a href="http://localhost:8080/jejuguseok/index.do" style="color:blue" target="_blank">보기&nbsp</a> <a href="http://localhost:8080/jejuguseok/map.do" style="color:blue" target="_blank">&nbsp길찾기</a></div>'; 
			var iwContent =
	        '          <div> &nbsp ${maplist.place}</div>' + 
	        '               <div> &nbsp <img src="https://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70"></div>' +
			'				<div>&nbsp	${maplist.address} </div>' +	
	        '         <div>&nbsp <a href="https://www.kakaocorp.com/main" target="_blank" class="link">클릭</a></div> ' + 
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${place5[status.index] },${y_list5[status.index]}, ${x_list5[status.index]}"  class="btn btn-primary" onclick="add1(this.id,1)" title="1일차 일정추가">1일차</button>'+
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${place5[status.index] },${y_list5[status.index]}, ${x_list5[status.index]}"  class="btn btn-danger" onclick="add1(this.id,2)" title="2일차 일정추가">2일차</button>'+
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${place5[status.index] },${y_list5[status.index]}, ${x_list5[status.index]}"  class="btn btn-success" onclick="add1(this.id,3)" title="3일차 일정추가">3일차</button>'+
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${place5[status.index] },${y_list5[status.index]}, ${x_list5[status.index]}"  class="btn btn-warning" onclick="add1(this.id,4)" title="4일차 일정추가">4일차</button>'+
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${place5[status.index] },${y_list5[status.index]}, ${x_list5[status.index]}"  class="btn btn-info" onclick="add1(this.id,5)" title="5일차 일정추가">5일차</button>'+
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${place5[status.index] },${y_list5[status.index]}, ${x_list5[status.index]}"  class="btn  btn-dark" onclick="add1(this.id,6)" title="6일차 일정추가">6일차</button>&nbsp&nbsp<br>';
		    
		    
		    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
		     
		    content : iwContent, 
		    removable : iwRemoveable
		});
		kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindow));

		// 일정 추가 버튼 메서드
		function add1(id,n) {		
				var id = id.split(',');
			document.getElementById("p_place"+n).value = id[0];
			document.getElementById("p_y"+n).value = id[1];
			document.getElementById("p_x"+n).value = id[2];				
		}
		</c:forEach>
//55555555555555555555555555555555555555555555555555
<c:forEach var="mylist"  items="${place6}" varStatus="status">
			// 마커 생성 표시
			var marker =  new kakao.maps.Marker({
				position:new kakao.maps.LatLng(${y_list6.get(status.index)}, ${x_list6.get(status.index)}),
				map:map
				});
			
			// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			//var iwContent = '<div style=padding:30px;>${maplist.address}<br><a href="http://localhost:8080/jejuguseok/index.do" style="color:blue" target="_blank">보기&nbsp</a> <a href="http://localhost:8080/jejuguseok/map.do" style="color:blue" target="_blank">&nbsp길찾기</a></div>'; 
			var iwContent =
	        '          <div> &nbsp ${maplist.place}</div>' + 
	        '               <div> &nbsp <img src="https://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70"></div>' +
			'				<div>&nbsp	${maplist.address} </div>' +	
	        '         <div>&nbsp <a href="https://www.kakaocorp.com/main" target="_blank" class="link">클릭</a></div> ' + 
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${place6[status.index] },${y_list6[status.index]}, ${x_list6[status.index]}"  class="btn btn-primary" onclick="add1(this.id,1)" title="1일차 일정추가">1일차</button>'+
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${place6[status.index] },${y_list6[status.index]}, ${x_list6[status.index]}"  class="btn btn-danger" onclick="add1(this.id,2)" title="2일차 일정추가">2일차</button>'+
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${place6[status.index] },${y_list6[status.index]}, ${x_list6[status.index]}"  class="btn btn-success" onclick="add1(this.id,3)" title="3일차 일정추가">3일차</button>'+
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${place6[status.index] },${y_list6[status.index]}, ${x_list6[status.index]}"  class="btn btn-warning" onclick="add1(this.id,4)" title="4일차 일정추가">4일차</button>'+
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${place6[status.index] },${y_list6[status.index]}, ${x_list6[status.index]}"  class="btn btn-info" onclick="add1(this.id,5)" title="5일차 일정추가">5일차</button>'+
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${place6[status.index] },${y_list6[status.index]}, ${x_list6[status.index]}"  class="btn  btn-dark" onclick="add1(this.id,6)" title="6일차 일정추가">6일차</button>&nbsp&nbsp<br>';
		    
		    
		    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
		     
		    content : iwContent, 
		    removable : iwRemoveable
		});
		kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindow));

		// 일정 추가 버튼 메서드
		function add1(id,n) {		
				var id = id.split(',');
			document.getElementById("p_place"+n).value = id[0];
			document.getElementById("p_y"+n).value = id[1];
			document.getElementById("p_x"+n).value = id[2];				
		}
		</c:forEach>
//66666666666666666666666666666666666666666666666666666666666666666666666666666666
// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 		
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}
	</script>
</div>
<div class="right">
<br>
<div class="container mt-3">
<input type="text" name="subject" id="subject" value="${scheduledto.getSubject()}" size="45"><br>
 <input type="text" name="date" id="date" value="${scheduledto.getDate1()}" size="8">
<input type="text" name="day"  id="day" value="${scheduledto.getDay1() }일" size="2">
<input type="text" name="with"  id="with" value="${scheduledto.getWith1() }"size="3">
<input type="text" name="travel"  id="travel" value="${myscheduledto.getTravel() }"size="45">
</div>
<br><br>
 <c:forEach var="dayCnt" begin="1" end="${scheduledto.getDay1()}" step="1">
 
 <button type="button" class="btn btn-success" name="day_btn${dayCnt}" id="day_btn${dayCnt}" data-toggle="collapse" data-target="#col${dayCnt}">  ${ dayCnt}일차  </button>

<div id="col${dayCnt}" class="collapse in">
<br/>
<button type="button" class="btn btn-danger" name="add_btn${dayCnt}" id="add_btn${dayCnt}" data-toggle="collapse" data-target="#col1${dayCnt}">  ${ dayCnt}일차 추가  </button>
<div id="col1${dayCnt}" class="collapse in">
 <form name="sccedule_card${dayCnt}" action="" method="post">
  <div class="form-group">
  <label for="exampleFormControlText1">장소</label>
  <input class="form-control form-control-lg" type="text" name="p_place${ dayCnt}" id="p_place${ dayCnt}" readonly style="background-color:#FFFFF0" placeholder='지도에서 "${ dayCnt}일차" 버튼 누르기'>
  </div>
  <div class="form-group">
  <input class="form-control form-control-lg" type="text" name="p_y${ dayCnt}" id="p_y${ dayCnt}"style="display:none"  >
  </div>
  <div class="form-group">
  <input class="form-control form-control-lg" type="text" name="p_x${ dayCnt}" id="p_x${ dayCnt}"  style="display:none"  >
  </div>
 <div class="form-group">
  <label for="exampleFormControlText2">시간</label>
  <input class="form-control form-control-lg" type="time" name="p_time${ dayCnt}" id="p_time${ dayCnt}" value="00:00:00">
  </div>
  <div class="form-group">
    <label for="exampleFormControlTextarea3">메모</label>
    <textarea class="form-control" name="p_context${ dayCnt}" id="p_context${ dayCnt}" rows="3"></textarea>
  </div>

  <button type="button" class="btn btn-danger" id="create${dayCnt}" name="create${dayCnt}"   value="create" onclick="create(${dayCnt})" >  일정 넣기 </button> 
  </form>
  </div>
  
  <form name="day_card${dayCnt}" id="day_card${dayCnt}"  method="post" action="sccedule_card.do">	 
	 <div id="field${dayCnt}">
	 <c:if test="${dayCnt == 1}">	 
	 <c:forEach var="myinfo"  items="${place1}" varStatus="status">
	 	<div id="card${dayCnt}-${status.index}" name="card${dayCnt}-${status.index}" class="card"> 	
        <textarea class="form-control" name="place1${dayCnt}-${status.index}" id="place1${dayCnt}-${status.index}" rows="1">${place1[status.index] }</textarea>
        <textarea class="form-control" name="time1${dayCnt}-${status.index}" id="time1${dayCnt}-${status.index}" rows="1">${time1[status.index] }</textarea>
        <textarea class="form-control" name="context1${dayCnt}-${status.index}" id="context1${dayCnt}-${status.index}" rows="6">${context1[status.index] }</textarea>
         <input type="button" style="width:223pt" value="삭제" class="btn btn-success"  onclick="remove_div2(${dayCnt}+'-'+${status.index})" />
        </div>    
        </c:forEach>
        </c:if>
         <c:if test="${dayCnt == 2}">
        <c:forEach var="myinfo"  items="${place2}" varStatus="status">
	 	<div id="card${dayCnt}-${status.index}" name="card${dayCnt}-${status.index}" class="card"> 	
        <textarea class="form-control" name="place2${dayCnt}-${status.index}" id="place2${dayCnt}-${status.index}" rows="1">${place2[status.index] }</textarea>
        <textarea class="form-control" name="time2${dayCnt}-${status.index}" id="time2${dayCnt}-${status.index}" rows="1">${time2[status.index] }</textarea>
        <textarea class="form-control" name="context2${dayCnt}-${status.index}" id="context2${dayCnt}-${status.index}" rows="6">${context2[status.index] }</textarea>
         <input type="button" style="width:223pt" value="삭제" class="btn btn-success"  onclick="remove_div2(${dayCnt}+'-'+${status.index})" />
        </div>    
        </c:forEach>
        </c:if>
        <c:if test="${dayCnt == 3}">
        <c:forEach var="myinfo"  items="${place3}" varStatus="status">
	 	<div id="card${dayCnt}-${status.index}" name="card${dayCnt}-${status.index}" class="card"> 	
        <textarea class="form-control" name="place3${dayCnt}-${status.index}" id="place3${dayCnt}-${status.index}" rows="1">${place3[status.index] }</textarea>
        <textarea class="form-control" name="time3${dayCnt}-${status.index}" id="time3${dayCnt}-${status.index}" rows="1">${time3[status.index] }</textarea>
        <textarea class="form-control" name="context3${dayCnt}-${status.index}" id="context3${dayCnt}-${status.index}" rows="6">${context3[status.index] }</textarea>
         <input type="button" style="width:223pt" value="삭제" class="btn btn-success"  onclick="remove_div2(${dayCnt}+'-'+${status.index})" />
        </div>    
        </c:forEach>
        </c:if>
        <c:if test="${dayCnt == 4}">
        <c:forEach var="myinfo"  items="${place4}" varStatus="status">
	 	<div id="card${dayCnt}-${status.index}" name="card${dayCnt}-${status.index}" class="card"> 	
        <textarea class="form-control" name="place4${dayCnt}-${status.index}" id="place4${dayCnt}-${status.index}" rows="1">${place4[status.index] }</textarea>
        <textarea class="form-control" name="time4${dayCnt}-${status.index}" id="time4${dayCnt}-${status.index}" rows="1">${time4[status.index] }</textarea>
        <textarea class="form-control" name="context4${dayCnt}-${status.index}" id="context4${dayCnt}-${status.index}" rows="6">${context4[status.index] }</textarea>
         <input type="button" style="width:223pt" value="삭제" class="btn btn-success"  onclick="remove_div2(${dayCnt}+'-'+${status.index})" />
        </div>    
        </c:forEach>
        </c:if>
        <c:if test="${dayCnt == 5}">
        <c:forEach var="myinfo"  items="${place5}" varStatus="status">
	 	<div id="card${dayCnt}-${status.index}" name="card${dayCnt}-${status.index}" class="card"> 	
        <textarea class="form-control" name="place5${dayCnt}-${status.index}" id="place5${dayCnt}-${status.index}" rows="1">${place5[status.index] }</textarea>
        <textarea class="form-control" name="time5${dayCnt}-${status.index}" id="time5${dayCnt}-${status.index}" rows="1">${time5[status.index] }</textarea>
        <textarea class="form-control" name="context5${dayCnt}-${status.index}" id="context5${dayCnt}-${status.index}" rows="6">${context5[status.index] }</textarea>
         <input type="button" style="width:223pt" value="삭제" class="btn btn-success"  onclick="remove_div2(${dayCnt}+'-'+${status.index})" />
        </div>    
        </c:forEach>
        </c:if>
        <c:if test="${dayCnt == 6}">
        <c:forEach var="myinfo"  items="${place6}" varStatus="status">
	 	<div id="card${dayCnt}-${status.index}" name="card${dayCnt}-${status.index}" class="card"> 	
        <textarea class="form-control" name="place6${dayCnt}-${status.index}" id="place6${dayCnt}-${status.index}" rows="1">${place6[status.index] }</textarea>
        <textarea class="form-control" name="time6${dayCnt}-${status.index}" id="time6${dayCnt}-${status.index}" rows="1">${time6[status.index] }</textarea>
        <textarea class="form-control" name="context6${dayCnt}-${status.index}" id="context6${dayCnt}-${status.index}" rows="6">${context6[status.index] }</textarea>
         <input type="button" style="width:223pt" value="삭제" class="btn btn-success"  onclick="remove_div2(${dayCnt}+'-'+${status.index})" />
        </div>    
        </c:forEach>
        </c:if>
	 </div><br>
	 <button type="button" class="btn btn-info" id="send_bt${dayCnt}" name="send_bt${dayCnt}"   onclick="clkBtn(${dayCnt})" style="float: right; width:40%" >  ${dayCnt}일차 수정 </button>
	 <br><br><br><br><br>
	    </form>
	  </div>	  
	  </c:forEach>
<br><br><br><br><br>
	

  
   
   
    
  <script>
 
  function clkBtn(num){
	/*  if(document.getElementById("p_place1") && document.getElementById("p_place1").value =="" ){
	  		alert("1일차 장소를 선택하세요. ");
	  		return false;
	  	}if(document.getElementById("p_place2") && document.getElementById("p_place2").value ==""   ){
	  		alert("2일차 장소를 선택하세요. ");
	  		return false;
	  	}if(document.getElementById("p_place3") && document.getElementById("p_place3").value =="" ){
	  		alert("3일차 장소를 선택하세요. ");
	  		return false;
	  	}if(document.getElementById("p_place4") && document.getElementById("p_place4").value ==""){
	  		alert("4일차 장소를 선택하세요. ");
	  		return false;
	  	}if(document.getElementById("p_place5") && document.getElementById("p_place5").value ==""){
	  		alert("5일차 장소를 선택하세요. ");
	  		return false;
	  	}if(document.getElementById("p_place6") && document.getElementById("p_place6").value ==""){
	  		alert("6일차 장소를 선택하세요. ");
	  		return false;
	  	}*/
	  	 if(document.getElementById("field1")){

	  		 var form = $('#day_card'+num)[0];  
	  		  var data = new FormData(form);	  
	  		  $.ajax({
	  			 type:"POST",
	  			 url:'sccedule_fix.do',
	  			 data : data,
	  			 processData: false,
	  			contentType: false,
	  			cache: false,  
	  		  });		
	  		 alert(num+"일차 저장 되었습니다.");
	  	}
  }
 
  </script>


<script type='text/javascript'>  
    function create(num) {  	
    	if(num == 1){    		 		
        	var c_place = document.sccedule_card1.p_place1.value;
        	var c_context = document.sccedule_card1.p_context1.value; 
        	var c_time = document.sccedule_card1.p_time1.value;}
    	if(num == 2){		
        	var c_place = document.sccedule_card2.p_place2.value;
        	var c_context = document.sccedule_card2.p_context2.value;
        	var c_time = document.sccedule_card2.p_time2.value;}
    	if(num == 3){     		
        	var c_place = document.sccedule_card3.p_place3.value;
        	var c_context = document.sccedule_card3.p_context3.value;    	
        	var c_time = document.sccedule_card3.p_time3.value;}
    	if(num == 4){		
        	var c_place = document.sccedule_card4.p_place4.value;
        	var c_context = document.sccedule_card4.p_context4.value;
        	var c_time = document.sccedule_card4.p_time4.value;}
    	if(num == 5){ 		
        	var c_place = document.sccedule_card5.p_place5.value;
        	var c_context = document.sccedule_card5.p_context5.value;	
        	var c_time = document.sccedule_card5.p_time5.value;}
    	if(num == 6){    		
        	var c_place = document.sccedule_card6.p_place6.value;
        	var c_context = document.sccedule_card6.p_context6.value;
        	var c_time = document.sccedule_card6.p_time6.value;}
    	if(num == 7){   		
        	var c_place = document.sccedule_card7.p_place7.value;
        	var c_context = document.sccedule_card7.p_context7.value;	
        	var c_time = document.sccedule_card7.p_time7.value;}
	
        var addDiv = document.createElement('div');
        
        addDiv.innerHTML =  '<div id="card'+num+'" name="card'+num+'" class="card">'+
        ' <textarea class="form-control" name="c_place'+num+'" id="c_place'+num+'" rows="1">'+c_place+'</textarea>'+
        ' <textarea class="form-control" name="c_time'+num+'" id="c_time'+num+'" rows="1">'+c_time+'</textarea>'+
        ' <textarea class="form-control" name="c_context'+num+'" id="c_context'+num+'" rows="6">'+c_context+'</textarea></div>'+
        '<input type="button" style="width:223pt" value="삭제" class="btn btn-success"  onclick="remove_div(this,'+num+')" />';   
        
        document.getElementById('field'+num).appendChild(addDiv);
        
   } 
    function remove_div(obj,num){   	
    	document.getElementById('field'+num).removeChild(obj.parentNode);
    	}
    function remove_div2(string){  	

    	  var de = document.getElementById( 'card'+string );    
    	  var parent = de.parentNode;
    		parent.removeChild(de);
    	}
    
</script>

</div>		

</body>
</html>