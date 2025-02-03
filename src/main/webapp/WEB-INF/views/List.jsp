<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
	.wrap-container{
		height:auto;
		/*min-height: 100%;*/
		padding-bottom: 60px;
	}
	.home-container{
		min-height: 100px;
	}
	#recordClick {
  		color: #001e0c;
  		/*text-decoration: none;*/
	}
	#recordClick:hover {
 		color: #00A140;
		text-decoration: underline;
	}
	form{
		display:flex;
		flex-direction:row;
		justify-content:space-evenly;
	}
	@media screen and (min-width: 500px) {
	  #searchContainer {
	    width: 470px;
	  }
	  #test{
	  	width: 380px;
	  }
	}
</style>
<jsp:include page="/template/Top.jsp"/>

        <!-- header-->
        <header>
            <div class="align-self-center text-center" style="height: 300px; position: relative; ">
                <h2 class="align-self-center" style="font-weight:bold; margin-top: 170px;">Bulletin Board</h3>
                <div id="searchContainer" style="display: inline-block; margin-top: 100px;">
                    <form class="d-flex" role="search" action="<c:url value="/Proj/Service/List.ict"/>">
                        <!--<div class="col-4 justify-content-center">-->
                        <div style="display:flex;" id="test">
                            <input name="search" class="form-control me-auto" type="search" placeholder="Search" aria-label="Search">
                        </div>
                            <button class="btn btn-outline-success btn-sm" type="submit">Search</button>
                    </form>
                </div>
                <div class="align-self-center justify-content-center" style="width:auto;max-width:1050px; display:flex; margin:60px auto 0; flex-direction: column; align-items:center;">
                    <hr class="hr-13" style="bottom: 50px; width: 100%; height: 10px;
    border: 0;
    box-shadow: 0 10px 10px -10px #8c8c8c inset;">
    				<div class="mt-1 my-3" style="width:95%">
        				<a href="<c:url value="/Proj/Service/Write.ict"/>" class="btn btn-success btn-sm" style="float:right; width:80px; position:relative;">글등록</a>
        			</div>
                </div>
            </div>
        </header>
        <!-- table -->
        <div class="wrap-container container" style="margin-top:60px; margin-bottom: 60px; display:flex; ">
            <table class="table text-center table-hover" style="margin-left: auto; margin-right: auto; width:1000px;">
                <thead>
                  <tr>
                    <th class="col-1">#</th>
                    <th>제목</th>
                    <th class="col-2">작성자</th>
                    <th class="col-1">조회수</th>
                    <th class="col-2">작성일</th>
                    <th class="col-1">좋아요</th>
                  </tr>
                </thead>
                <tbody>
          			<c:if test="${empty records }" var="isEmpty">
          				<tr>
          					<td colspan="6">등록된 글이 없습니다</td>
          				</tr>
          			</c:if>
          			<c:if test="${!isEmpty }">
          				<c:forEach var="record" items="${records }">
		                  <tr>
		                    <!-- <th scope="row">${fn:length(records) }</th> -->
		                    <th scope="row">${record.no }</th>
		                    <td><a id="recordClick" href="<c:url value="/Proj/Service/View.ict?no=${record.originNo }&nowPage=${nowPage }" />" >${record.title }</a></td>
		                    <td>${record.name }</td>
		                    <td>${record.visitCount }</td>
		                    <td>${record.postDate }</td>
		                    <td>${record.lno }</td>
		                  </tr>
	                  	</c:forEach>
                  	</c:if>
                </tbody>
            </table>
            </div>
        </div>
        <!-- 페이징 -->
        ${paging }
        
          <!-- Site footer -->
    <!-- <footer class="site-footer" style="margin-top: 120px">
        <div style="margin: auto;">
        <hr>
         </div>
         <div class="container" >
           <div class="row">
             <div style="margin:auto;">
               <p class="copyright-text text-center" > &copy; 2023 Second Personal Project from
                <a href="#">한국 ICT인재개발원</a>.
               </p>
             </div>
   
   </footer> -->
<script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@latest/dist/tf.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@teachablemachine/image@latest/dist/teachablemachine-image.min.js"></script>
<script>
	
	if("${search}" != null){
		document.querySelector('[name=search]').value = "${search}"
	}
</script>
</body>
</html>
<jsp:include page="/template/Footer.jsp"/>