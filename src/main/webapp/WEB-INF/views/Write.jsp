<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/template/Top.jsp"/>
<style>
	body{
		background-color: #016241;
	}
	
</style>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script> 
<head>
	<link href="${pageContext.request.contextPath}/css/write.css" rel="stylesheet" >
	<link href="${pageContext.request.contextPath}/css/fileUpload.css?after" rel="stylesheet" >
	<link href="${pageContext.request.contextPath}/css/loading.css?1" rel="stylesheet" >
	<link href="${pageContext.request.contextPath}/css/toolTipBright.css?after" rel="stylesheet" >
</head>
	<div class="align-items-start " style="width:100%; background-color:#FFFFFF; height:300px">
		<div class="row" style="margin:0;">
		<div class="col"></div>
		<div class="col" style="padding-top:150px; display:flex; justify-content:center;"><h1 class="display-3">글을 입력하세요!</h1></div>
		<div class="col"></div>
		</div>
	</div>
	<div id="form-main" style="display:flex; justify-content:center; height:400px; margin-top:30px; margin-bottom:400px;">
  <div id="form-div" style="margin-left: 0; left:auto;">
  	<!-- <form method="post" action="<c:url value="/Proj/Service/ImageToText.ict"/>" enctype="multipart/form-data"> -->
  		<div style="display:flex;" tooltip="업로드 된 이미지 속 텍스트를 추출합니다!">
  		<div class="file-upload" style="flex-basis:80%;">
		  <div class="file-select">
		    <div class="file-select-name" id="noFile">No file chosen...</div> 
		    <input type="file" name="chooseFile" id="chooseFile">
		  </div>
		</div>
    	<div class="item"><button id="imageFile" type="submit" class="custom-btn btn-15">image to text</button></div>
    	</div>
    <!-- </form> -->
    <form method="post" action="<c:url value="/Proj/Service/Write.ict"/>">
      <div class="my-3">
        <input name="title" type="text" class="validate[required,custom[onlyLetter],length[0,100]] feedback-input" placeholder="제목" id="name" />
      </div>
      
      <div class="mt-3">
      	<!-- 로딩 -->
      	<div id="loadingSpinner" class="spinner-box">
		  <div class="pulse-container">  
		    <div class="pulse-bubble pulse-bubble-1"></div>
		    <div class="pulse-bubble pulse-bubble-2"></div>
		    <div class="pulse-bubble pulse-bubble-3"></div>
		  </div>
		  <div class="loadingSpinnerTxt">이미지 속에서 글자를 추출 중입니다</div>
		</div>
      	<!-- 로딩 -->
        <textarea style="height:300px; font-size: 14px;" name="content" class="validate[required,length[6,300]] feedback-input" id="content" placeholder="Content"></textarea>
      </div>
      <div>
      	<span style="color:#FFF;">
           	<em style="font-style:normal;"></em>
           	/2000자
        </span>
      </div>
      
      
        <div class="buttons" style="margin-left:600px;" >
		  <button id="submit" type="submit" class="up upload">등록</button>
		  
		</div>
    </form>
  </div>
	</div>

<jsp:include page="/template/Footer.jsp"/>
</body>
</html>

<script>
	//제목, 내용 태그 가지고 오기
	var title = document.querySelector('#name');
	var content = document.querySelector('#content');
	var button = document.querySelector('#submit');
	
	button.onclick = () => { //게시글 입력 체크용
		window.onbeforeunload = function(e){};
		//제목 체크
		if (title.value==null || title.value.trim().length == 0 || title.value.trim().length >= 100){
			if (title.value==null || title.value.trim().length == 0) alert('제목을 입력하세요');
			else alert('제목은 100자를 넘을 수 없습니다');
			return false;
		}
		//내용 체크
		if (content.value==null || content.value.trim().length == 0 || content.value.trim().length >= 2000){
			if (content.value==null || content.value.trim().length == 0) alert('내용을 입력하세요');
			else alert('게시글은 최대 2000자까지 작성 가능합니다');
			return false;
		}
	}
	//로딩중 관련 함수
	loadingSpinner.style.display = 'none';
	function showLoadingSpinner() {
	    var loadingSpinner = document.getElementById('loadingSpinner');
	    content.style.display='none';
	    button.disabled=true;
	    loadingSpinner.style.display = 'flex';
	}
	
	function hideLoadingSpinner() {
	    var loadingSpinner = document.getElementById('loadingSpinner');
	    content.style.display='block';
	    button.disabled=false;
	    loadingSpinner.style.display = 'none';
	}
	//이미지파일 제출여부 확인
	document.getElementById("imageFile").onclick = ()=>{
		window.onbeforeunload = function(e){};
		var fileInput = document.querySelector('#chooseFile')
		var fileInputName = fileInput.value.trim();
		var fileFormat = ["jpg","jpeg","png"];
		if(fileInputName.trim().length==0 || !fileFormat.includes(fileInputName.substring(fileInputName.lastIndexOf('.')+1))){
			alert('이미지 파일을 첨부해주세요');
			return false;
		}
		const formData = new FormData();
		formData.append('image',document.getElementById('chooseFile').files[0]);
		showLoadingSpinner();//로딩 시작
		fetch("<c:url value='/Proj/Service/ImageToText.ict'/>",
				{method:'POST', 
				body: formData,
				headers:{}})
		.then(response=>response.text())
		.then(data=>{
			if(data.trim().length==0){
				alert('이미지 파일 최대 용량을 벗어났습니다(3MB)');
			}
			else if(data.trim().length==4){
				alert('이미지 파일에서 텍스트를 감지하지 못했습니다');
			}
			else{
				content.value += data;
				document.querySelector('em').textContent = content.value.length;
			}																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																												
		})
		.finally(() => {
            hideLoadingSpinner(); // 로딩창 끝
        });
		window.onbeforeunload = function(e){
	        return doExit();
	    };
	    function doExit(){
	        event.returnValue = '"페이지를 벗어 나시겠습니까?"';
	    }
	}
	
	//게시글 본문 글자수 체크
	var content = document.querySelector('[name=content]');
	document.querySelector('em').textContent = content.value.length;
	content.addEventListener('input', function(){
		document.querySelector('em').textContent = content.value.length;
	})
	
	$('#chooseFile').bind('change', function () {
		  var filename = $("#chooseFile").val();
		  if (/^\s*$/.test(filename)) {
		    $(".file-upload").removeClass('active');
		    $("#noFile").text("No file chosen..."); 
		  }
		  else {
		    $(".file-upload").addClass('active');
		    $("#noFile").text(filename.replace("C:\\fakepath\\", "")); 
		  }
		});
	window.onbeforeunload = function(e){
        return doExit();
    };
    function doExit(){
        event.returnValue = '"페이지를 벗어 나시겠습니까?"';
    }
    
</script>