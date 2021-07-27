<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
  <!--  어드민쪽 헤더 태그(*) -->
  <%@ include file ="adminHeader.jsp" %>
    
  <div id="layoutSidenav_content">
   <main>
     <div class="container-fluid px-4">
        <h1 class="mt-4">Charts</h1>
           <ol class="breadcrumb mb-4">
               <li class="breadcrumb-item"><a href="/jejuguseok/index.do">Dashboard</a></li>
               <li class="breadcrumb-item active">Charts</li>
           </ol>
           
           
     <div class="col-lg-6">
          <div class="card mb-4">
            <div class="card-header">
               <i class="fas fa-chart-pie me-1"></i>
                  Pie Chart Example                      
                    </div>
                      <div class="card-body"><canvas id="myPieChart" width="100%" height="50"></canvas></div>              
                      <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>                
           </div>
      </div>
           
           
           
           
           
           
           
     </div>
    </main>
   </div>
   
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/jejuguseok/adminStyle/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="/jejuguseok/adminStyle/assets/demo/chart-area-demo.js"></script>
        <script src="/jejuguseok/adminStyle/assets/demo/chart-bar-demo.js"></script>
        <script src="/jejuguseok/adminStyle/assets/demo/chart-pie-demo.js"></script>
   
  </html>