<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
	<c:when test="${WHERE == 'INS' }">
		<c:set var="successMessage" value="회원가입을 축하합니다! 로그인 후 서비스 이용을 시작하세요!" />
		<c:set var="failureMessage" value="Self Introduction은 2000자까지 작성 가능합니다" />
		<c:set var="successUrl" value="/Proj/Login.ict" />
	</c:when>
	<c:when test="${WHERE == 'EDT' }">
		<c:set var="successMessage" value="회원정보가 수정되었습니다! 다시 로그인하세요!" />
		<c:set var="failureMessage" value="Self Introduction은 2000자까지 작성 가능합니다" />
		<c:set var="successUrl" value="/Proj/Login.ict" />
	</c:when>
</c:choose>

<script>
	<c:choose>
		<c:when test="${SUCCFAIL==1 }">
			alert('${successMessage }');
			location.replace('<c:url value="${successUrl }" />');
		</c:when>
		<c:when test="${SUCCFAIL==0 }">
			alert('${failureMessage }');
			history.back();
		</c:when>
	</c:choose>
</script>