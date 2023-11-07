<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품관리게시판</title>
	<!-- 스타일시트 파일의 경로를 지정 -->
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
 	<link href="css/style.css" rel="stylesheet" />
<script>
 <%@ include file="include/popup.js" %>
</script>
</head>
<body>

	<%@ include file="include/managerHeader.jspf" %>
	
	<!-- ------------------------------------------------------------------------ -->
	
	<h1>상품 관리 게시판</h1>
	<div id="ibb">
		<table>
			<thead>
				<tr class="title">
					<th style="width: 10%;">상품번호</th>
					<th style="width: 15%;">브랜드</th>
					<th style="width: 20%;">상품명</th>
					<th style="width: 20%;">가격</th>
					<th style="width: 20%;">등록일</th>
				</tr>
			</thead>
			<tbody>
			<c:choose>
		<c:when test="${empty list }">
			<tr>
				<td colspan="5">
					<h2>현재 등록된 게시글이 없습니다</h2>
				</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach var="vo" items="${list }">
				<tr>
					<th>${vo.itemNum }</th>
					<th>${vo.brand }</th>
					<th><a href="controller?type=itemDetail&itemNum=${vo.itemNum}">${vo.name }</a></th>
					<th>${vo.price }</th>
					<th>${vo.regDate }</th>
				</tr>
			</c:forEach>
			</c:otherwise>
			</c:choose>
			</tbody>
			
	<!-- ------------------------------------------------------------------------ -->
	<tfoot>
			<tr>
				<td colspan="4">
					<ol class="paging">
					<%--[이전으로]에 대한 사용여부 처리 --%>
					<%-- 메소드 사용시 pvo.getBeginPage () => 번잡 --%>
					<c:if test="${pvo.beginPage == 1 }">
						<li class="disable">이전으로</li> 
					</c:if>
					<c:if test="${pvo.beginPage != 1 }">
						<li>
							<a href="controller?type=itemBulletinBoard&cPage=${pvo.beginPage - 1 }">이전으로</a>
						</li>
					</c:if>
					
					<%--블록내에 표시할 페이지 태그 작성(시작페이지 ~ 끝페이지) --%>
					<c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
					<c:if test="${pageNo == pvo.nowPage }">	
						<li class="now">${pageNo }></li>
					</c:if>
					<c:if test="${pageNo != pvo.nowPage }">
						<li>
							<a href="controller?type=itemBulletinBoard&cPage=${pageNo }">${pageNo }</a>
						</li>
					</c:if>
					
					</c:forEach>
										
					 <%--[다음으로]에 대한 사용여부 처리 --%>
					 <c:if test="${pvo.endPage >= pvo.totalPage }">
						<li class="disable">다음으로<li> 
					</c:if>
					<c:if test="${pvo.endPage < pvo.totalPage }">
						<li>
							<a href="controller?type=itemBulletinBoard&cPage=${pvo.endPage + 1 }">다음으로</a>
						</li>
					</c:if>
					</ol>
					
				</td>
				<td>
					<input type="button" value="상품등록"
						onclick="javascript:location.href='itemWrite.jsp'">					>
				</td>
			</tr>
		</tfoot>
		</table>
	</div>
	<br>
	
	<!-- ------------------------------------------------------------------------ -->
	
	<%@ include file="include/managerFooter.jspf" %>
</body>
</html>