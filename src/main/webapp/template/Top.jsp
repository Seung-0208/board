<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<style>
	.jumbotron{
            padding-top:1rem;
            padding-bottom:1rem;
            margin-bottom: .5rem;
            border-top-left-radius:0;
            border-top-right-radius:0;
        }
</style>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>게시판</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" type="text/css" />
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <!--부트스트랩 4.6-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link href="${pageContext.request.contextPath}/css/styles.css?after" rel="stylesheet" >
        
    </head>
    <body>
        <!-- Navigation-->
        <nav class="navbar navbar-light bg-light fixed-top">
            <div class="container">
                <a style="font-weight: 700;" class="navbar-brand" href="<c:url value="/Proj/Service/List.ict" />">Bulletin Board</a>
                <div>
                <c:if test="${requestScope.isValid or not empty cookie.USERID.value }" var="isValid">
                   <a class="btn btn-outline-success me-auto" href="<c:url value="/Proj/Login.ict" />">로그아웃</a>
                   <a class="btn btn-outline-success " href="<c:url value="/Proj/JoinEdit.ict" />">회원정보</a>
                </c:if>
                <c:if test="${not isValid}">
                   <a class="btn btn-outline-success me-auto" href="#signup">로그인</a>
                </c:if>
                </div>
            </div>
        </nav>