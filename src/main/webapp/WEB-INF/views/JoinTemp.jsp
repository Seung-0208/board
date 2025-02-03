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
    <body>
      <nav class="navbar navbar-light bg-light fixed-top">
        <div class="container">
            <a style="font-weight: 700;" class="navbar-brand" href="<c:url value="/Proj/Service/List.ict" />">Bulletin Board</a>
        </div>
    </nav>
        <div class="row align-items-center" style="padding-top: 200px; text-align: center;">
            <div class="col">
            <h1 class="display-4">Member Information</h1>
            <div class="gap-3">
              <div style="padding-top: 30px;">회원 정보를 수정하세요</div>
              <div style="padding-top: 5px; padding-bottom: 70px;">로그인 후 이용해주세요</div>
            </div>
         </div>
        </div>
        <!--<div class="row justify-content-center" style="margin-bottom: 50px;">
          <hr class="hr-13" style="width: 1000px; position: absolute;">
      </div>-->
      <div class="row">
    <div style="background-color: #5DA452; margin-top: 70px;">
      <form method="post" action="<c:url value="/Proj/Join.ict" />" >
        <fieldset>
          <legend class="my-4"><span class="number">1</span> Your Basic Info</legend>
          <div class="my-4">
            <label>Name:</label>
            <p style="font-size: small;">다른 이용자에게 보여줄 이름을 설정해주세요</p>
            <input class="form-control" type="text" name="name">
          </div>
          <div class="row align-items-start"> <!--로그인-->
            <div class="col">
              <label>ID:</label>
              <input class="form-control" type="text" name="id">
            </div>
            <div class="col">
              <label>Password:</label>
              <input class="form-control" type="password" name="pwd">
            </div>
          </div>
          
          <div class="my-4">
            <label>Gender:</label>
            <div class="row align-items-start form-check ml-3">
              <div class="col">
                <input class="form-check-input" type="radio" value="m" name="gender"><label class="light">남자</label><br>
              </div>
              <div class="col">
                <input class="form-check-input" type="radio" value="f" name="gender"><label class="light">여자</label>
              </div>
              <div class="col">
                <input  class="form-check-input" type="radio" value="e" name="gender"><label class="light">기타</label>
              </div>
            </div>
          </div>

          <div class="my-4">
            <label>Education:</label>
            <select class="form-select" id="education" name="education" style="height: 40px;">
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
              <input class="form-check-input" type="checkbox" value="pol" name="inter"><label class="light">정치</label><br>
              <input class="form-check-input" type="checkbox" value="eco" name="inter"><label class="light">경제</label><br>
              <input class="form-check-input" type="checkbox" value="ent" name="inter"><label class="light">연예</label>
            </div>
          </div>
        </fieldset>
        <fieldset>
          <legend><span class="number">2</span> Introduction</legend>
          <div class="my-4">
            <label >Self Introduction:</label>
            <textarea id="자기소개" name="selfIntro" class="form-control" rows="5"></textarea>
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
	
</script>
