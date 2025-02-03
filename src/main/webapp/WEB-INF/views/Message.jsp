<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 어느 컨트롤러에서 왔는지(포워드 되었는지)에 따라 분기 -->
<c:choose>
	<c:when test="${WHERE == 'INS' }">
		<c:set var="successMessage" value="글이 등록되었습니다"/>
		<c:set var="failuerMessage" value="입력 실패했어요"/>
		<c:set var="successUrl" value="/Proj/Service/List.ict"/>
	</c:when>
	<c:when test="${WHERE == 'EDT' }">
		<c:set var="successMessage" value="글이 수정되었습니다"/>
		<c:set var="failuerMessage" value="수정 실패했어요"/>
		<c:set var="successUrl" value="/Proj/Service/View.ict?no=${param.no }"/>
	</c:when>
	<c:otherwise>	
		<c:set var="successMessage" value="글이 삭제되었습니다"/>
		<c:set var="failuerMessage" value="삭제 실패했어요"/>
		<c:set var="successUrl" value="/Proj/Service/List.ict"/>	
	</c:otherwise>
</c:choose>


<script>
	<c:choose>
		<c:when test="${SUCCFAIL == 1 }">
			alert("${successMessage}");
			location.replace("<c:url value="${successUrl }"/>");
		</c:when>
		<c:when test="${SUCCFAIL == 0 }">
			alert("${failuerMessage}");
			history.back();
		</c:when>
		<c:otherwise>
			alert("파일 업로드 용량을 초과 했어요");
			history.back();	
		</c:otherwise>
	</c:choose>
</script>

