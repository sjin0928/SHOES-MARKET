<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/mainStyles.css" rel="stylesheet" />
<title>인기상품 목록</title>
<!-- 스타일시트 파일의 경로를 지정 -->
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
 	<link href="css/style.css" rel="stylesheet" />
 <script>
 <%@ include file="include/popup.js" %>
 <%@ include file="include/search.js" %>
 </script>
</head>
<body>
  	<%@ include file="include/header.jspf" %>
  	
  	<!-- ------------------------------------------------------------------------ -->
  	
	<div class="products">
      <h3>BEST</h3>
  	
	<div class="product-list">
	<c:forEach var="bestVo" items="${bestList }">
        <a href="controller?type=productDetail&itemNum=${bestVo.itemNum}" class="product">
          <img src="${bestVo.imagePath }" width="225" alt="상품이미지">
          <div class="product-name">
          [${bestVo.brand }] ${bestVo.name }
          </div>
          <div class="product-price">${bestVo.price }</div>
        </a>
        </c:forEach>
      </div>
      </div>
      
      <!-- ------------------------------------------------------------------------ -->
      <!-- 페이징 -->
      <div id="ibb">
		<table>
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
							<a href="controller?type=best&cPage=${pvo.beginPage - 1 }">이전으로</a>
						</li>
					</c:if>
					
					<%--블록내에 표시할 페이지 태그 작성(시작페이지 ~ 끝페이지) --%>
					<c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
					<c:if test="${pageNo == pvo.nowPage }">	
						<li class="now">${pageNo }></li>
					</c:if>
					<c:if test="${pageNo != pvo.nowPage }">
						<li>
							<a href="controller?type=best&cPage=${pageNo }">${pageNo }</a>
						</li>
					</c:if>
					
					</c:forEach>
										
					 <%--[다음으로]에 대한 사용여부 처리 --%>
					 <c:if test="${pvo.endPage >= pvo.totalPage }">
						<li class="disable">다음으로<li> 
					</c:if>
					<c:if test="${pvo.endPage < pvo.totalPage }">
						<li>
							<a href="controller?type=best&cPage=${pvo.endPage + 1 }">다음으로</a>
						</li>
					</c:if>
					</ol>
					
				</td>
			</tr>
		</tfoot>
		</table>
	</div>
	<br>
      
      <!-- ------------------------------------------------------------------------ -->
      
      <%@ include file="include/footer.jspf" %>
 
</body>
</html>