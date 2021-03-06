<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
  <!--  어드민쪽 헤더 태그(*) -->
  <%@ include file ="adminHeader.jsp" %>
    
 <%--     아래부터는 본문!    --%>
	    
	  <!-- 차트 링크 -->

	 		<div id="layoutSidenav_content">
  			<main>
     		<div class="container-fluid px-4">
        	<h1 class="mt-4">찜하기 통계</h1>

				<div class="row">
				
			<div class="col-xl-6">
				<div class="card mb-3">
					<div class="card-header">
						<i class="fas fa-chart-bar me-1"></i> 관광지 카테고리별 통계 </div>
					<div class="card-body">
						<canvas id="myChart" width="100%" height="40"></canvas>
					</div>
				</div>
			</div>
			
			<div class="col-xl-6">
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-chart-bar me-1"></i> 관광지 장소별 통계 </div>
					<div class="card-body">
						<canvas id="myChart2" width="100%" height="40"></canvas>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-chart-pie me-1"></i> 숙소 카테고리별 통계 </div>
					<div class="card-body">
						<canvas id="myChart3" width="100%" height="40"></canvas>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-chart-pie me-1"></i> 숙소 장소별 통계 </div>
					<div class="card-body">
						<canvas id="myChart4" width="100%" height="40"></canvas>
					</div>
				</div>
			</div>
			
			<div class="col-xl-6">
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-chart-bar me-1"></i> 연령별 관광지 카테고리 통계 </br>
															빨강=20대, 노랑=30대, 파랑=40대, 초록=50대 </div>
					<div class="card-body">
						<canvas id="myChart5" width="100%" height="40"></canvas>
					</div>
				</div>
			</div>
			
			<div class="col-xl-6">
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-chart-bar me-1"></i> 연령별 숙소 카테고리 통계 </br> 
															빨강=20대, 노랑=30대, 파랑=40대, 초록=50대</div>
					<div class="card-body">
						<canvas id="myChart6" width="100%" height="40"></canvas>
					</div>
				</div>
			</div>
		                        </div>                  
                    </div>
                    
               </main>
          </div>
		
		
		
			<!-- 부트스트랩 -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/jejuguseok/adminStyle/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="/jejuguseok/adminStyle/assets/demo/chart-area-demo.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
      
		  <script type="text/javascript">
			//관광지 카테고리별 통계 바 차트
		    var ctx = document.getElementById('myChart');
		    var myChart = new Chart(ctx, {
		      type: 'bar',
		      data: {
		        labels: ['Nature', 'Healing', 'Leisure', 'History'],
		        datasets: [{
		          label: '인원',
		          data: [${location_category[0].count}, ${location_category[1].count}, ${location_category[2].count}, ${location_category[3].count}],
		          backgroundColor: [
		            'rgba(255, 99, 132, 0.2)',
		            'rgba(54, 162, 235, 0.2)',
		            'rgba(255, 206, 86, 0.2)',
		            'rgba(75, 192, 192, 0.2)',
		            'rgba(153, 102, 255, 0.2)',
		            'rgba(255, 159, 64, 0.2)'
		          ],
		          borderColor: [
		            'rgba(255, 99, 132, 1)',
		            'rgba(54, 162, 235, 1)',
		            'rgba(255, 206, 86, 1)',
		            'rgba(75, 192, 192, 1)',
		            'rgba(153, 102, 255, 1)',
		            'rgba(255, 159, 64, 1)'
		          ],
		          borderWidth: 1
		        }]
		      },
		      options: {
		        scales: {
		          yAxes: [{
		            ticks: {
		              beginAtZero: true
		            }
		          }]
		        }
		      }
		    });
	
		  </script>
	  

		  <script type="text/javascript">
			//관광지 장소별 통계 바 차트
		    var ctx = document.getElementById('myChart2').getContext('2d');
		    var chart = new Chart(ctx, {
		      // 챠트 종류를 선택
		      type: 'line',
		
		      // 챠트를 그릴 데이타
		      data: {
		        labels: ['제주시', '표선', '애월', '서귀포시', '제주공항', '함덕'],
		        datasets: [{
		          label: '인원',
		          backgroundColor: 'transparent',
		          borderColor: 'red',
		          data: [${location_location[0].count}, ${location_location[1].count}, ${location_location[2].count}, ${location_location[3].count},
		        	  ${location_location[4].count}, ${location_location[5].count}]
		        }]
		      },
		      // 옵션
		      options: {}
		    });
		  </script>
  
  
  
		  <script type="text/javascript">
			//숙소 카테고리별 통계 파이 차트
		  data = {
		        datasets: [{
		            backgroundColor: ['red','yellow','blue','orange'],
		            data: [${home_category[0].count}, ${home_category[1].count}, ${home_category[2].count}, ${home_category[3].count}]
		        }],       
		        // 라벨의 이름이 툴팁처럼 마우스가 근처에 오면 나타남
		        labels: ['호텔','펜션','게스트하우스','모텔'] 
		    };
		
		
		  var ctx2 = document.getElementById("myChart3");
		  var myDoughnutChart = new Chart(ctx2, {
		      type: 'doughnut',
		      data: data,
		      options: {}
		  });
		  </script>
  

		    <script type="text/javascript">
		  	//숙소 장소별 통계 파이 차트
			var colors = ['red','skyblue','yellowgreen','violet','orange','gray','black'];
			
			
			var donutOptions = {
			  cutoutPercentage: 30, //도넛두께 : 값이 클수록 얇아짐
			  legend: {position:'bottom', padding:5, labels: {pointStyle:'circle', usePointStyle:true}}
			};
			
			
			var chDonutData1 = {
			    labels: ['중문', '함덕', '서귀포시','제주시','애월','표선','제주공항'],
			    datasets: [
			      {
			        backgroundColor: colors.slice(0,6),
			        borderWidth: 0,
			        data: [${home_location[0].count}, ${home_location[1].count}, ${home_location[2].count},
			        	${home_location[3].count}, ${home_location[4].count}, ${home_location[5].count}, ${home_location[6].count}]
			      }
			    ]
			};
			
			var chDonut1 = document.getElementById("myChart4");
			  if (chDonut1) {
			    new Chart(chDonut1, {
			      type: 'pie',
			      data: chDonutData1,
			      options: donutOptions
			  });
			}
			  
		  </script>
		
		<script type="text/javascript">
		//관광지 연령별 카테고리 통계 다중 차트
        colors5 = ['red','yellow','blue','#a72898','#28a745']; 
        var chBar = document.getElementById("myChart5"); 
        var chartData = { labels: ["자연", "레져", "힐링", "역사"], 
        		datasets:
        			[{ data: [${location_20[0].count},${location_20[1].count},${location_20[2].count},${location_20[3].count}], backgroundColor: colors5[0] }, 
        			 { data: [${location_30[0].count},${location_30[1].count},${location_30[2].count},${location_30[3].count}], backgroundColor: colors5[1] },
        			 { data: [${location_40[0].count},${location_40[1].count},${location_40[2].count},${location_40[3].count}], backgroundColor: colors5[2] },
        			 { data: [${location_50[0].count},${location_50[1].count},${location_50[2].count},${location_50[3].count}], backgroundColor: colors5[4] }] }; 
        var myChart = new Chart(chBar, { 
        	// 챠트 종류를 선택 
        	type: 'bar', 
        	// 챠트를 그릴 데이타 
        	data: chartData, 
        	// 옵션 
        	options: { 
        		legend: { 
        			display: false 
        			} } });

        
        </script>
		

		<script type="text/javascript">
		// 숙소 연령별 카테고리 통계 다중 차트
        colors6 = ['red','yellow','blue','#a72898','#28a745']; 
        var chBar = document.getElementById("myChart6"); 
        var chartData = { labels: ["호텔", "펜션", "게스트하우스", "모텔"], 
        		datasets:
        			[{ data: [${home_20[0].count},${home_20[1].count},${home_20[2].count},${home_20[3].count}], 
        				backgroundColor: colors6[0] }, 
        			{ data: [${home_30[0].count},${home_30[1].count},${home_30[2].count},${home_30[3].count}],
        					backgroundColor: colors6[1] },
        			{ data: [${home_40[0].count},${home_40[1].count},${home_40[2].count},${home_40[3].count}], 
        						backgroundColor: colors6[2] },
        			{ data: [${home_50[0].count},${home_50[1].count},${home_50[2].count},${home_50[3].count},], 
        							backgroundColor: colors6[4] }] }; 
        var myChart = new Chart(chBar, { 
        	// 챠트 종류를 선택 
        	type: 'bar', 
        	// 챠트를 그릴 데이타 
        	data: chartData, 
        	// 옵션 
        	options: { 
        		legend: { 
        			display: false 
        			} } });
        </script>
		

        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="/jejuguseok/adminStyle/js/datatables-simple-demo.js"></script>
    </body>
</html>
          