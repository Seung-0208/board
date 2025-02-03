<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/template/Top.jsp"/>
<style>
body{
	background-color: #016241;
}
</style>
<head>
	<link href="${pageContext.request.contextPath}/css/write.css" rel="stylesheet" >
	<link href="${pageContext.request.contextPath}/css/view.css" rel="stylesheet" >
	<link href="${pageContext.request.contextPath}/css/likeButton.css" rel="stylesheet" >
	<link href="${pageContext.request.contextPath}/css/toolTip.css?after" rel="stylesheet" >
	<link href="${pageContext.request.contextPath}/css/test.css?after" rel="stylesheet" >
	<script src="https://kit.fontawesome.com/644efb6c21.js" crossorigin="644efb6c21"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script> 
	<script src="${pageContext.request.contextPath}/js/jquery.transit.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath}/js/test.js" crossorigin="644efb6c21"></script>
	<style>
		@import url('https://fonts.googleapis.com/css2?family=Dhurjati&display=swap');
	</style>
</head>

<!-- 본문 -->
<div style="max-width:1000px; background-color:#FFFFFF; margin:auto; height:auto; width:auto; padding-bottom:100px;">
	<!-- <button style="margin-top:500px;" class="btn-xs btn-success ">목록</button> -->
	<div class="container" style="padding-top:50px;">

		<div class=" px-5 profile">
			<div class="profile-stats">

				<ul style="padding:0; margin:0; float:right;">
				
				<c:if test="${isSameUser}">
					
					<li><a href = "<c:url value="/Proj/Service/Edit.ict?no=${record.no }&nowPage=${nowPage }" />" class="btn btn-success profile-edit-btn">수정</a></li>
					<li><a href="javascript:isDelete();" class="btn btn-success profile-edit-btn">삭제</a></li>
				</c:if>
				<!--<c:if test="${not isSameUser }">
					<li>
						<a href="#" class="like-button">
						<?xml version="1.0" encoding="utf-8"?>
						<svg width="20" height="20" viewBox="0 0 1792 1792" xmlns="http://www.w3.org/2000/svg"><path d="M320 1344q0-26-19-45t-45-19q-27 0-45.5 19t-18.5 45q0 27 18.5 45.5t45.5 18.5q26 0 45-18.5t19-45.5zm160-512v640q0 26-19 45t-45 19h-288q-26 0-45-19t-19-45v-640q0-26 19-45t45-19h288q26 0 45 19t19 45zm1184 0q0 86-55 149 15 44 15 76 3 76-43 137 17 56 0 117-15 57-54 94 9 112-49 181-64 76-197 78h-129q-66 0-144-15.5t-121.5-29-120.5-39.5q-123-43-158-44-26-1-45-19.5t-19-44.5v-641q0-25 18-43.5t43-20.5q24-2 76-59t101-121q68-87 101-120 18-18 31-48t17.5-48.5 13.5-60.5q7-39 12.5-61t19.5-52 34-50q19-19 45-19 46 0 82.5 10.5t60 26 40 40.5 24 45 12 50 5 45 .5 39q0 38-9.5 76t-19 60-27.5 56q-3 6-10 18t-11 22-8 24h277q78 0 135 57t57 135z"/></svg>
						</a>
					</li>
				</c:if>-->
					<li><a href="<c:url value="/Proj/Service/List.ict?nowPage=${nowPage }" />" class="btn btn-success profile-edit-btn">목록</a></li>
					<!-- <li><i class="fas fa-heart" aria-hidden="true"></i></li>-->
				</ul>

			</div>
			<div class="my-4 profile-user-settings">
				<h2 style="font-family: 'Dhurjati', sans-serif;">no.&nbsp;${record.no }</h2>
				<h1 class="profile-user-name">${record.title }</h1>
			</div>


			<div class="profile-bio" style="font-size:17px;">
					<div style="float:right;">
					
					<a id="likeBtn" class="like-button"  tooltip="${record.lno }">
						<?xml version="1.0" encoding="utf-8"?>
						<svg width="60" height="60" viewBox="0 0 1792 1792" xmlns="http://www.w3.org/2000/svg"><path d="M320 1344q0-26-19-45t-45-19q-27 0-45.5 19t-18.5 45q0 27 18.5 45.5t45.5 18.5q26 0 45-18.5t19-45.5zm160-512v640q0 26-19 45t-45 19h-288q-26 0-45-19t-19-45v-640q0-26 19-45t45-19h288q26 0 45 19t19 45zm1184 0q0 86-55 149 15 44 15 76 3 76-43 137 17 56 0 117-15 57-54 94 9 112-49 181-64 76-197 78h-129q-66 0-144-15.5t-121.5-29-120.5-39.5q-123-43-158-44-26-1-45-19.5t-19-44.5v-641q0-25 18-43.5t43-20.5q24-2 76-59t101-121q68-87 101-120 18-18 31-48t17.5-48.5 13.5-60.5q7-39 12.5-61t19.5-52 34-50q19-19 45-19 46 0 82.5 10.5t60 26 40 40.5 24 45 12 50 5 45 .5 39q0 38-9.5 76t-19 60-27.5 56q-3 6-10 18t-11 22-8 24h277q78 0 135 57t57 135z"/></svg>
					</a>
					</div>
				<p><i class="fa-solid fa-pencil"></i><span class="profile-real-name">&nbsp;&nbsp;작성자| &nbsp;&nbsp;</span> ${record.name }</p>
				<p><i class="fa-solid fa-calendar-day"></i><span class="profile-real-name">&nbsp;&nbsp;작성일| &nbsp;&nbsp;</span> ${record.postDate }</p>

			</div>
	
		</div>
			<hr class="my-3 mx-3"/>
		<!-- End of profile section -->
	</div>
	<!-- End of container -->
	<!-- <div class="container px-5 my-4" style="background-color: lightyellow;"> -->
	<div id="contents">
		${record.content }
	</div>
	<div class="wrapper wrapper--demo">
	<div class="carousel">
    <div class="carousel__nav">
      <a id="prev" href="<c:url value="/Proj/Service/View.ict?no=${prevNextInfo.prev }&nowPage=${nowPage }" />" class="nav nav--left">Next</a>
      <a id="next" href="<c:url value="/Proj/Service/View.ict?no=${prevNextInfo.next }&nowPage=${nowPage }" />" class="nav nav--right">Previous</a>
    </div>
    
	</div>
</div>
</div>

<!-- footer -->
<footer class="site-footer" >
        <div style="max-width: 800px; width:auto; margin: 0 auto;">
        	<hr>
         </div>
         <div class="container" >
           <div class="row">
             <div style="margin:auto;">
               <p class="copyright-text text-center" > &copy; 2023 Second Personal Project from
                <a href="#">한국 ICT인재개발원</a>.
               </p>
             </div>
   		</div>
   		</div>
   </footer>
<script src="${pageContext.request.contextPath}/js/likeButton.js"  crossorigin="anonymous"></script>
<script>
	//${prevNextInfo.prev }
	console.log(document.querySelector("#prev"));
	var prevBtn = document.querySelector("#prev");
	var nextBtn = document.querySelector("#next");
	if("${prevNextInfo.prev }" == "isnull"){
		prevBtn.style.backgroundColor="#ccc";
		prevBtn.onclick = (e)=>{
			e.preventDefault();
		}
	}
	if("${prevNextInfo.next }" == "isnull"){
		nextBtn.style.backgroundColor="#ccc";
		nextBtn.onclick = (e)=>{
			e.preventDefault();
		}
	}
	function isDelete(){
		if(confirm("정말 삭제하시겠습니까?")){
			location.replace("<c:url value="/Proj/Service/Delete.ict?no=${record.no}" />");
		}
	}
	//좋아요 버튼 시작
	var likeBtn = document.querySelector(".like-button");
	console.log('좋아요버튼 클릭 여부:',${isLnoBtnOn});
	if(${isLnoBtnOn}){
		likeBtn.classList.toggle("active");
	}
	likeBtn.onclick=()=>{ //클릭이벤트 처리
		fetch("<c:url value='/Proj/Service/LikeCheck.ict' />", 
				{method:'POST', 
				body:JSON.stringify({no:${record.no}}), 
				headers:{"Content-Type":"application/json"}})
		.then(response=>response.text())
		.then(data=>{
			console.log(data);
			likeBtn.setAttribute("tooltip",data);
		})	
	}
	//좋아요 버튼 끝
</script>
</body>
</html>