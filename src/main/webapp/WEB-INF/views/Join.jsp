<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>


    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sign Up Form</title>
        <link rel="stylesheet" href="https://codepen.io/gymratpacks/pen/VKzBEp#0">
        <link href='https://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <!-- <link href="<c:url value="/css/join.css?ver=1" />" rel="stylesheet" > -->
    	<link href="${pageContext.request.contextPath}/css/join.css" rel="stylesheet" >
    	<!-- <link href="<c:url value="join.css?ver=0" />" rel="stylesheet" >-->
    </head>
    <style>
    body {
    margin: 0;
    padding: 0;
}
    </style>
    <body>
      <nav class="navbar navbar-light bg-light fixed-top">
        <div class="container">
            <a style="font-weight: 700;" class="navbar-brand" href="<c:url value="/Proj/Service/List.ict" />">Bulletin Board</a>
        </div>
    </nav>
        <div class="align-items-center" style="padding-top: 200px; text-align: center;">
            <div class="col">
            <h1 class="display-4">Sign in</h1>
            <div class="gap-1" style="display:flex; flex-direction: column;align-items: center;">
              <div style="display:flex; padding-top: 30px;">해당 게시판은 회원만 이용이 가능합니다</div>
              <div style="display:flex; padding-top: 5px; padding-bottom: 70px;">로그인 후 이용해주세요</div>
            </div>
         </div>
        </div>
      <div style="background-color: #5DA452;" class="py-1">
    <div>
      <form class="needs-validation" novalidate method="post" action="<c:url value="/Proj/Join.ict" />" >
        <fieldset>
          <legend class="my-4"><span class="number">1</span> Your Basic Info</legend>
          <div class="my-4">
            <label>Name:</label>
            <p style="font-size: small;">다른 이용자에게 보여줄 이름을 설정해주세요</p>
            <input id="writer" class="form-control" type="text" name="name" required>
              <div class="invalid-feedback">이름은 적어도 한 글자 이상 작성해야 합니다</div>
          </div>
          <div class="row align-items-start"> <!--로그인-->
            <div class="col" id="idDiv">
              <label>ID:</label>
              <input id="nick" class="form-control" type="text" name="id" required> <!-- 유효성검사 테스트용 id -->
              <div class="invalid-feedback">아이디는 5글자 이상 10글자 이하의 영어와 숫자로 입력하세요</div>
              <div id="idDuplicatedChk" class="test-warning valid-feedback"></div>
              <div class="valid-feedback"><a id="idCheck" class="btn-xs btn-success">아이디 중복 확인</a></div>
            </div>
            <div class="col">
              <label>Password:</label>
              <input id="pwd" class=" form-control" type="password" name="pwd" required>
              <div class="invalid-feedback">비밀번호는 영어, 숫자, 특수문자로 이루어진 8자 이상을 입력하세요(특수문자: !@#$%^&*()-+=_)</div>
            </div>
          </div>
          
          <div class="my-4">
            <label>Gender:</label>
            <div class="row align-items-start form-check ml-3">
              <div class="col">
                <input  required class="form-check-input" type="radio" value="m" name="gender"><label class="light">남자</label><br>
              </div>
              <div class="col">
                <input class="form-check-input" type="radio" value="f" name="gender"><label class="light">여자</label>
              </div>
              <div class="col">
                <input class="form-check-input" type="radio" value="e" name="gender"><label class="light">기타</label>
              </div>
            </div>
          </div>

          <div class="my-4">
            <label>Education:</label>
            <select required class="form-select" id="education" name="education" style="height: 40px;">
                <option value="">학력을 선택하세요</option>
                <option value="elementary">초등학교</option>
                <option value="middle">중학교</option>
                <option value="high">고등학교</option>
                <option value="college">대학교</option>
                <option value="graduate">대학원</option>
            </select>
          </div>

          <div class="my-4">
            <label>Interests:</label>
            <div class="form-check ml-4">
              <input id="invalidCheck" class="form-check-input" type="checkbox" value="pol" name="inter"><label class="light">정치</label><br>
              <input id="invalidCheck" class="form-check-input" type="checkbox" value="eco" name="inter"><label class="light">경제</label><br>
              <input id="invalidCheck" class="form-check-input" type="checkbox" value="ent" name="inter"><label class="light">연예</label>
            </div>
          </div>
        </fieldset>
        <fieldset>
          <legend><span class="number">2</span> Introduction</legend>
          <div class="my-4">
            <label >Self Introduction:</label>
            <span style="color:#B6B6B6;">
            	<em style="font-style:normal;">0</em>
            	/2000자
            </span>
            <textarea required id="selfIntro" name="selfIntro" class="form-control" rows="5"></textarea>
          </div>
        </fieldset>
       
        <button type="submit" class="btn btn-success">Sign Up</button>
        
       </form>
      </div>
        </div>
      </div>
      
    </body>
</html>

<script>
	
	//아이디 중복 체크
	var isclickedIdCheck = false;
	document.querySelector('#idCheck').onclick=()=>{
		isclickedIdCheck = true;
		var id = document.querySelector('#nick').value;
		fetch("<c:url value='/Proj/IdCheck.ict?id=' />"+id)
		.then(response=>response.text())
		.then(data=>{
			var sucdiv = document.querySelector('#idDuplicatedChk');
			sucdiv.textContent='';
			if(data.trim().length===5){
				//div태그 가지고 오기
				sucdiv.textContent='사용 가능한 아이디입니다';
				//class 변경
				sucdiv.classList.remove('text-danger');
				sucdiv.classList.add('text-success');
				submit.disabled = false;
			}
			else{
				sucdiv.textContent='중복된 아이디입니다';
				//class 변경
				sucdiv.classList.add('text-danger');
				sucdiv.classList.remove('text-success');
				submit.disabled = true;
			}
		});
	}
	//아이디 유효성 검사-----------
	document.querySelector('#nick').addEventListener('input', function(){
		let isNickValid = false;
		let inputNick = this.value;
		document.querySelector('#idDuplicatedChk').textContent='';
		if(inputNick != null && inputNick.trim().length >= 5 &&  inputNick.trim().length <= 10
				&& /[a-zA-Z]+/.test(inputNick) && /[0-9]+/.test(inputNick)){
			if(/[!@#$%^&*()-+=_]+/.test(inputNick)){
				if(/[!@#$%^&*()-+=_]+/.test(inputNick)){
					isNickValid = false;
				}
				else{
				isNickValid = true;}
			}
			else{
				isNickValid = true;
			}
		}
		
		//isNickValid = inputNick.length >= 5 && inputNick.length <= 10;
		if(isNickValid){
			this.classList.remove("is-invalid");
			this.classList.add("is-valid");
			submit.disabled = false;
		}
		else{
			this.classList.add("is-invalid");
			this.classList.remove("is-valid");
			submit.disabled = true;
		}
		this.classList.add('was-validated')
	})
	//사용자 이름 유효성 검사-----------
	document.querySelector('#writer').addEventListener('input', function(){
		let isNickValid = false;
		let inputNick = this.value;
		if(inputNick != null && inputNick.trim().length >0){
			isNickValid = true;
		}
		//isNickValid = inputNick.length >= 5 && inputNick.length <= 10;
		if(isNickValid){
			this.classList.remove("is-invalid");
			this.classList.add("is-valid");
			submit.disabled = false;
		}
		else{
			this.classList.add("is-invalid");
			this.classList.remove("is-valid");
			submit.disabled = true;
		}
		this.classList.add('was-validated')
	})
	//사용자 비밀번호 유효성 검사-----------
	document.querySelector('#pwd').addEventListener('input', function(){
		let isNickValid = false;
		let inputNick = this.value;
		if(inputNick != null && inputNick.trim().length >= 8
				&& /[a-zA-Z]+/.test(inputNick) && /[0-9]+/.test(inputNick)
				&& /[!@#$%^&*()-+=_]+/.test(inputNick)){
			isNickValid = true;
		}
		//isNickValid = inputNick.length >= 5 && inputNick.length <= 10;
		if(isNickValid){
			this.classList.remove("is-invalid");
			this.classList.add("is-valid");
			submit.disabled = false;
		}
		else{
			this.classList.add("is-invalid");
			this.classList.remove("is-valid");
			submit.disabled = true;
		}
		this.classList.add('was-validated')
	})
	
	//학력선택 유효성 검사-----------
	document.querySelector('#education').addEventListener('input', function(){
		let isNickValid = false;
		let inputNick = this.value;
		if(inputNick != ''){
			isNickValid = true;
		}
		//isNickValid = inputNick.length >= 5 && inputNick.length <= 10;
		if(isNickValid){
			this.classList.remove("is-invalid");
			this.classList.add("is-valid");
			submit.disabled = false;
		}
		else{
			this.classList.add("is-invalid");
			this.classList.remove("is-valid");
			submit.disabled = true;
		}
		this.classList.add('was-validated')
	})
	
	//gender 선택
	document.querySelectorAll('[name=gender]').forEach(item=>{
		item.addEventListener('click', function(){
			let isNickValid = false;
			let inputNick = this.value;
			if(inputNick != ''){
				isNickValid = true;
			}
			//isNickValid = inputNick.length >= 5 && inputNick.length <= 10;
			if(isNickValid){
				this.classList.remove("is-invalid");
				this.classList.add("is-valid");
				submit.disabled = false;
			}
			else{
				this.classList.add("is-invalid");
				this.classList.remove("is-valid");
				submit.disabled = true;
			}
			this.classList.add('was-validated')
		})
	})
	
	//자기소개 유효성 검사-----------
	var selfInfo = document.querySelector('#selfIntro');
	selfInfo.addEventListener('input', function(){
		document.querySelector('em').textContent = selfInfo.value.length;
		let isNickValid = false;
		let inputNick = this.value;
		if(inputNick != null && inputNick.trim().length !=0){
			isNickValid = true;
		}
		//isNickValid = inputNick.length >= 5 && inputNick.length <= 10;
		if(isNickValid){
			this.classList.remove("is-invalid");
			this.classList.add("is-valid");
			submit.disabled = false;
		}
		else{
			this.classList.add("is-invalid");
			this.classList.remove("is-valid");
			submit.disabled = true;
		}
		this.classList.add('was-validated')
	})
	
	const form = document.querySelector('form');
	const submit = document.querySelector('button');
	submit.disabled = true;
	function isChecked(){ //관심사항 체크용
		var checkbox = document.querySelectorAll('[name=inter]');
		var cnt = 0;
		var ischecked = false;
		checkbox.forEach(item=>{
			if(item.checked) {
				ischecked = true;
			}
		})
		return ischecked;
	}
	var checkbox = document.querySelectorAll('[name=inter]');
	checkbox.forEach(item=>{
		item.onclick = ()=>{
			if(!isChecked()){
				var checkbox = document.querySelectorAll('[name=inter]');
				checkbox.forEach(item=>{
					item.classList.add("is-invalid");
					item.classList.remove("is-valid");
				})
				
			}
			if(isChecked()){
				var checkbox = document.querySelectorAll('[name=inter]');
				checkbox.forEach(item=>{
					item.classList.remove("is-invalid");
					item.classList.add("is-valid");
				})
			}
		}
	})
	form.addEventListener('input', e=>{
		if(!form.checkValidity() || !isChecked()){
			submit.disabled = true;
		}
		else if(form.checkValidity() && isChecked()){
			submit.disabled = false;
		}
		
	})
	submit.onclick=()=>{
		window.onbeforeunload = function(e){};
		if (!isclickedIdCheck){
			alert('아이디 중복 여부를 체크해주세요');
			//document.querySelector('#nick').focus();
			document.querySelector('#writer').scrollIntoView();
			return false;
		}
		if (document.querySelector('#selfIntro').value.length>2000){
			alert('Self Introduction은 2000자까지 작성 가능합니다');
			//document.querySelector('#nick').focus();
			document.querySelector('#selfIntro').focus();
			return false;
		}
	}
	window.onbeforeunload = function(e){
        return doExit();
    };
    function doExit(){
        event.returnValue = '"페이지를 벗어 나시겠습니까?"';
    }
</script>
