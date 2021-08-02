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
      #mapwrap {
	position: relative;
	overflow: hidden;
}

.category, .category * {
	margin: 0;
	padding: 0;
	color: #000;
}

.category {
	position: absolute;
	overflow: hidden;
	top: 20px;
	left: 10px;
	width: 150px;
	height: 50px;
	z-index: 10;
	border: 1px solid black;
	font-family: 'Malgun Gothic', '맑은 고딕', sans-serif;
	font-size: 12px;
	text-align: center;
	background-color: #fff;
}

.category .menu_selected {
	background: #FF5F4A;
	color: #fff;
	border-left: 1px solid #915B2F;
	border-right: 1px solid #915B2F;
	margin: 0 -1px;
}

.category li {
	list-style: none;
	float: left;
	width: 50px;
	height: 45px;
	padding-top: 5px;
	cursor: pointer;
}

.category .ico_comm {
	display: block;
	margin: 0 auto 2px;
	width: 22px;
	height: 26px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/category.png')
		no-repeat;
}

.category .ico_total {
	background-position: -10px 0;
}

.category .ico_tour {
	background-position: -10px -36px;
}

.category .ico_home {
	background-position: -10px -72px;
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

		<div id="mapwrap">
				<!-- 지도가 표시될 div -->
				<div id="map" style="width: 98%; height: 100%;"></div>
				<!-- 지도 위에 표시될 마커 카테고리 -->
				<div class="category">
					<ul>
						<li id="totalMenu" onclick="changeMarker('total')"><span
							class="ico_comm ico_total"></span> 전체</li>
						<li id="tourMenu" onclick="changeMarker('tour')"><span
							class="ico_comm ico_tour"></span> 관광지</li>
						<li id="homeMenu" onclick="changeMarker('home')"><span
							class="ico_comm ico_home"></span> 숙박</li>
					</ul>
				</div>
			</div>

			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a95cadba8f57feb150276e9f4194f8aa"></script>
			<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
	 center: new kakao.maps.LatLng(33.403421435965604, 126.51971115454302), // 지도의 중심좌표
        level: 9 // 지도의 확대 레벨 
        
    }; 

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 지도에 확대 축소 컨트롤을 생성한다
var zoomControl = new kakao.maps.ZoomControl();

// 지도의 우측에 확대 축소 컨트롤을 추가한다
map.addControl(zoomControl, kakao.maps.ControlPosition.BOTTOMRIGHT);



//마커이미지의 주소입니다. 스프라이트 이미지 입니다
var markerImageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/category.png';  
    totalMarkers = [], // 커피숍 마커 객체를 가지고 있을 배열입니다
    tourMarkers = [], // 편의점 마커 객체를 가지고 있을 배열입니다
    homeMarkers = []; // 주차장 마커 객체를 가지고 있을 배열입니다

    var iwContent = new Array(); 
 // 전체 위치, 1일차 마커가 표시될 좌표 배열입니다
    var totalPositions=new Array();
    <c:forEach var="mylist"  items="${place1}" varStatus="status">
    var totalPositions2 = [   new kakao.maps.LatLng(${y_list1.get(status.index)}, ${x_list1.get(status.index)})   ];  
    totalPositions = totalPositions.concat(totalPositions2); 
    </c:forEach>
    create_p1_Markers(); // 커피숍 마커를 생성하고 커피숍 마커 배열에 추가합니다
    
   // 전체 위치, 2일차 마커가 표시될 좌표 배열입니다

<c:forEach var="mylist"  items="${place2}" varStatus="status">
var totalPositions2 = [   new kakao.maps.LatLng(${y_list2.get(status.index)}, ${x_list2.get(status.index)})   ];  
totalPositions = totalPositions.concat(totalPositions2);
</c:forEach>
create_p2_Markers();

// 전체 위치, 3일차 마커가 표시될 좌표 배열입니다

<c:forEach var="mylist"  items="${place3}" varStatus="status">
var totalPositions2 = [   new kakao.maps.LatLng(${y_list3.get(status.index)}, ${x_list3.get(status.index)})   ];  
totalPositions = totalPositions.concat(totalPositions2);
</c:forEach>


    	
    //관광지 위치 마커가 표시될 좌표 배열입니다
    var tourPositions=new Array();
    <c:forEach var="maptourlist" items="${maptourlist}" varStatus="status">
    var tourPositions2 = [    new kakao.maps.LatLng(${maptourlist.y}, ${maptourlist.x})             ];
        tourPositions = tourPositions.concat(tourPositions2);
    </c:forEach>

    //숙소 위치 마커가 표시될 좌표 배열입니다
    var homePositions=new Array();
    <c:forEach var="maphomelist" items="${maphomelist}" varStatus="status">
    var homePositions2 = [   new kakao.maps.LatLng(${maphomelist.y}, ${maphomelist.x})   ];
    homePositions = homePositions.concat(homePositions2);
    </c:forEach>
    

createtourMarkers(); // 편의점 마커를 생성하고 편의점 마커 배열에 추가합니다
createhomeMarkers(); // 주차장 마커를 생성하고 주차장 마커 배열에 추가합니다

changeMarker('total'); // 지도에 커피숍 마커가 보이도록 설정합니다    


// 마커이미지의 주소와, 크기, 옵션으로 마커 이미지를 생성하여 리턴하는 함수입니다
function createMarkerImage(src, size, options) {
    var markerImage = new kakao.maps.MarkerImage(src, size, options);
    return markerImage;            
}

// 좌표와 마커이미지를 받아 마커를 생성하여 리턴하는 함수입니다
function createMarker(position, image) {
    var marker = new kakao.maps.Marker({
        position: position,
        image: image
    });
    
    return marker;  
}   

// total 마커를 생성하고 커피숍 마커 배열에 추가하는 함수입니다
function create_p1_Markers() {
	<c:forEach var="mylist"  items="${place1}" varStatus="status">
	 iwContent[${status.index}] = 
		 '          <div> &nbsp ${place1[status.index]}</div>' + 
	        '               <div> &nbsp <img src="https://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70"></div>' +
			'				<div>&nbsp	${maplist.address} </div>' +	
	        '         <div>&nbsp <a href="https://www.kakaocorp.com/main" target="_blank" class="link">클릭</a></div> ' + 
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${place1[status.index] },${y_list1[status.index]}, ${x_list1[status.index]}"  class="btn btn-primary" onclick="add1(this.id,1)" title="1일차 일정추가">1일차</button>'+
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${place1[status.index] },${y_list1[status.index]}, ${x_list1[status.index]}"  class="btn btn-danger" onclick="add1(this.id,2)" title="2일차 일정추가">2일차</button>'+
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${place1[status.index] },${y_list1[status.index]}, ${x_list1[status.index]}"  class="btn btn-success" onclick="add1(this.id,3)" title="3일차 일정추가">3일차</button>'+
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${place1[status.index] },${y_list1[status.index]}, ${x_list1[status.index]}"  class="btn btn-warning" onclick="add1(this.id,4)" title="4일차 일정추가">4일차</button>'+
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${place1[status.index] },${y_list1[status.index]}, ${x_list1[status.index]}"  class="btn btn-info" onclick="add1(this.id,5)" title="5일차 일정추가">5일차</button>'+
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${place1[status.index] },${y_list1[status.index]}, ${x_list1[status.index]}"  class="btn  btn-dark" onclick="add1(this.id,6)" title="6일차 일정추가">6일차</button>&nbsp&nbsp<br>';		    
	     </c:forEach>	 
    for (var i = 0; i < totalPositions.length; i++) {  
    	//console.log('마커출력'+i);
        var imageSize = new kakao.maps.Size(22, 26),
            imageOptions = {  
                spriteOrigin: new kakao.maps.Point(10, 0),    
                spriteSize: new kakao.maps.Size(36, 98)  
            };     
       
        // 마커이미지와 마커를 생성합니다
        var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
            marker = createMarker(totalPositions[i], markerImage);  
        //console.log('마커 위치'+totalPositions[i]);
        // 생성된 마커를 커피숍 마커 배열에 추가합니다
       
        totalMarkers.push(marker);
        //console.log('토탈마커'+"data: " + JSON.stringify(totalMarkers[1]));
        
       //===================================================================
       
        iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
       
    // 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({    	
    	content : iwContent[i],
        removable : iwRemoveable       
    });
    console.log('iwContent'+iwContent);
    // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindow));     
 // 일정 추가 버튼 메서드
	function add1(id,n) {		
			var id = id.split(',');
		document.getElementById("p_place"+n).value = id[0];
		document.getElementById("p_y"+n).value = id[1];
		document.getElementById("p_x"+n).value = id[2];				
			}
        // 1111111111111111111111111111111111111111
 
    }  //for       
}//createmarker()
function create_p2_Markers(){
<c:forEach var="mylist"  items="${place2}" varStatus="status">
	 iwContent[${status.index}] = 
		 '          <div> &nbsp ${place2[status.index]}</div>' + 
	        '               <div> &nbsp <img src="https://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70"></div>' +
			'				<div>&nbsp	${maplist.address} </div>' +	
	        '         <div>&nbsp <a href="https://www.kakaocorp.com/main" target="_blank" class="link">클릭</a></div> ' + 
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${place2[status.index] },${y_list2[status.index]}, ${x_list2[status.index]}"  class="btn btn-primary" onclick="add1(this.id,1)" title="1일차 일정추가">1일차</button>'+
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${place2[status.index] },${y_list2[status.index]}, ${x_list2[status.index]}"  class="btn btn-danger" onclick="add1(this.id,2)" title="2일차 일정추가">2일차</button>'+
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${place2[status.index] },${y_list2[status.index]}, ${x_list2[status.index]}"  class="btn btn-success" onclick="add1(this.id,3)" title="3일차 일정추가">3일차</button>'+
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${place2[status.index] },${y_list2[status.index]}, ${x_list2[status.index]}"  class="btn btn-warning" onclick="add1(this.id,4)" title="4일차 일정추가">4일차</button>'+
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${place2[status.index] },${y_list2[status.index]}, ${x_list2[status.index]}"  class="btn btn-info" onclick="add1(this.id,5)" title="5일차 일정추가">5일차</button>'+
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${place2[status.index] },${y_list2[status.index]}, ${x_list2[status.index]}"  class="btn  btn-dark" onclick="add1(this.id,6)" title="6일차 일정추가">6일차</button>&nbsp&nbsp<br>';		    
	     </c:forEach>	 
    for (var i = 0; i < totalPositions.length; i++) {  
    	//console.log('마커출력'+i);
        var imageSize = new kakao.maps.Size(22, 26),
            imageOptions = {  
                spriteOrigin: new kakao.maps.Point(10, 0),    
                spriteSize: new kakao.maps.Size(36, 98)  
            };           
        // 마커이미지와 마커를 생성합니다
        var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
            marker = createMarker(totalPositions[i], markerImage, iwContent[i] );  
        // 생성된 마커를 커피숍 마커 배열에 추가합니다
        totalMarkers.push(marker);
 
        iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
       
    // 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({    	
    	content : iwContent[i],
        removable : iwRemoveable       
    }); 
    // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindow));     
 // 일정 추가 버튼 메서드
	function add1(id,n) {		
			var id = id.split(',');
		document.getElementById("p_place"+n).value = id[0];
		document.getElementById("p_y"+n).value = id[1];
		document.getElementById("p_x"+n).value = id[2];				
			}
    }  //for       
}//createmarker2()


// 커피숍 마커들의 지도 표시 여부를 설정하는 함수입니다
function settotalMarkers(map) {        
    for (var i = 0; i < totalMarkers.length; i++) {  
        totalMarkers[i].setMap(map);
    }        
}

// 편의점 마커를 생성하고 편의점 마커 배열에 추가하는 함수입니다
function createtourMarkers() {
	<c:forEach var="maptourlist" items="${maptourlist}" varStatus="status">
	 iwContent[${status.index}] = 
		  '          <div> &nbsp ${maptourlist.name}</div>' + 
	        '               <div> &nbsp <img src="https://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70"></div>' +
			'				<div>&nbsp	${maptourlist.address} </div>' +		
	        '         <div>&nbsp <a href="https://www.kakaocorp.com/main" target="_blank" class="link">클릭</a></div> ' + 
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${maptourlist.name},${maptourlist.y},${maptourlist.x}"  class="btn btn-primary" onclick="add(this.id,1)" title="1일차 일정추가">1일차</button>'+
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${maptourlist.name},${maptourlist.y},${maptourlist.x}"  class="btn btn-danger" onclick="add(this.id,2)" title="2일차 일정추가">2일차</button>'+
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${maptourlist.name},${maptourlist.y},${maptourlist.x}"  class="btn btn-success" onclick="add(this.id,3)" title="3일차 일정추가">3일차</button>'+
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${maptourlist.name},${maptourlist.y},${maptourlist.x}"  class="btn btn-warning" onclick="add(this.id,4)" title="4일차 일정추가">4일차</button>'+
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${maptourlist.name},${maptourlist.y},${maptourlist.x}"  class="btn btn-info" onclick="add(this.id,5)" title="5일차 일정추가">5일차</button>'+
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${maptourlist.name},${maptourlist.y},${maptourlist.x}"  class="btn  btn-dark" onclick="add(this.id,6)" title="6일차 일정추가">6일차</button>&nbsp&nbsp<br>';
		    
	     </c:forEach>	 
    for (var i = 0; i < tourPositions.length; i++) {
        
        var imageSize = new kakao.maps.Size(22, 26),
            imageOptions = {   
                spriteOrigin: new kakao.maps.Point(10, 36),    
                spriteSize: new kakao.maps.Size(36, 98)  
            };       
     
        // 마커이미지와 마커를 생성합니다
        var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
            marker = createMarker(tourPositions[i], markerImage);  

        // 생성된 마커를 편의점 마커 배열에 추가합니다
        tourMarkers.push(marker);   
        iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
        
        // 인포윈도우를 생성합니다
        var infowindow = new kakao.maps.InfoWindow({    	
        	content : iwContent[i],
            removable : iwRemoveable
        });

        // 마커에 클릭이벤트를 등록합니다
        kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindow));      
        
    }        
}

// 편의점 마커들의 지도 표시 여부를 설정하는 함수입니다
function settourMarkers(map) {        
    for (var i = 0; i < tourMarkers.length; i++) {  
        tourMarkers[i].setMap(map);
    }        
}

// 주차장 마커를 생성하고 주차장 마커 배열에 추가하는 함수입니다
function createhomeMarkers() {
	<c:forEach var="maphomelist" items="${maphomelist}" varStatus="status">
	 iwContent[${status.index}] = 
		  '          <div> &nbsp ${maphomelist.name}</div>' + 
	        '               <div> &nbsp <img src="https://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70"></div>' +
			'				<div>&nbsp	${maphomelist.address} </div>' +		
	        '         <div>&nbsp <a href="https://www.kakaocorp.com/main" target="_blank" class="link">클릭</a></div> ' + 
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${maphomelist.name},${maphomelist.y},${maphomelist.x}"  class="btn btn-primary" onclick="add(this.id,1)" title="1일차 일정추가">1일차</button>'+
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${maphomelist.name},${maphomelist.y},${maphomelist.x}"  class="btn btn-danger" onclick="add(this.id,2)" title="2일차 일정추가">2일차</button>'+
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${maphomelist.name},${maphomelist.y},${maphomelist.x}"  class="btn btn-success" onclick="add(this.id,3)" title="3일차 일정추가">3일차</button>'+
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${maphomelist.name},${maphomelist.y},${maphomelist.x}"  class="btn btn-warning" onclick="add(this.id,4)" title="4일차 일정추가">4일차</button>'+
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${maphomelist.name},${maphomelist.y},${maphomelist.x}"  class="btn btn-info" onclick="add(this.id,5)" title="5일차 일정추가">5일차</button>'+
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${maphomelist.name},${maphomelist.y},${maphomelist.x}"  class="btn  btn-dark" onclick="add(this.id,6)" title="6일차 일정추가">6일차</button>&nbsp&nbsp<br>';
		    
	     </c:forEach>
    for (var i = 0; i < homePositions.length; i++) {
        
        var imageSize = new kakao.maps.Size(22, 26),
            imageOptions = {   
                spriteOrigin: new kakao.maps.Point(10, 72),    
                spriteSize: new kakao.maps.Size(36, 98)  
            };       
     
        // 마커이미지와 마커를 생성합니다
        var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
            marker = createMarker(homePositions[i], markerImage,iwContent[i]);  

        // 생성된 마커를 주차장 마커 배열에 추가합니다
        homeMarkers.push(marker);     
        
iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
        
        // 인포윈도우를 생성합니다
        var infowindow = new kakao.maps.InfoWindow({    	
        	content : iwContent[i],
            removable : iwRemoveable
        });

        // 마커에 클릭이벤트를 등록합니다
        kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindow));      
    }                
}

// 주차장 마커들의 지도 표시 여부를 설정하는 함수입니다
function sethomeMarkers(map) {        
    for (var i = 0; i < homeMarkers.length; i++) {  
        homeMarkers[i].setMap(map);
    }        
}

// 카테고리를 클릭했을 때 type에 따라 카테고리의 스타일과 지도에 표시되는 마커를 변경합니다
function changeMarker(type){
    
    var totalMenu = document.getElementById('totalMenu');
    var tourMenu = document.getElementById('tourMenu');
    var homeMenu = document.getElementById('homeMenu');
    
    // 커피숍 카테고리가 클릭됐을 때
    if (type === 'total') {
    
        // 커피숍 카테고리를 선택된 스타일로 변경하고
        totalMenu.className = 'menu_selected';
        
        // 편의점과 주차장 카테고리는 선택되지 않은 스타일로 바꿉니다
        tourMenu.className = '';
        homeMenu.className = '';
        
        // 커피숍 마커들만 지도에 표시하도록 설정합니다
        settotalMarkers(map);
        settourMarkers(null);
        sethomeMarkers(null);
        
        
        
    } else if (type === 'tour') { // 편의점 카테고리가 클릭됐을 때
    
        // 편의점 카테고리를 선택된 스타일로 변경하고
        totalMenu.className = '';
        tourMenu.className = 'menu_selected';
        homeMenu.className = '';
        
        // 편의점 마커들만 지도에 표시하도록 설정합니다
        settotalMarkers(null);
        settourMarkers(map);
        sethomeMarkers(null);
        
    } else if (type === 'home') { // 주차장 카테고리가 클릭됐을 때
     
        // 주차장 카테고리를 선택된 스타일로 변경하고
        totalMenu.className = '';
        tourMenu.className = '';
        homeMenu.className = 'menu_selected';
        
        // 주차장 마커들만 지도에 표시하도록 설정합니다
        settotalMarkers(null);
        settourMarkers(null);
        sethomeMarkers(map);  
    }    
} 

//인포윈도우를 표시하는 클로저를 만드는 함수입니다 		
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker,infowindow );
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