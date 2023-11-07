<!-- 231024 박수진 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의게시글</title>

<script>
function board_main(){
	location.href = "board_main.jsp"
}
function notice_list(){
	location.href = "noticeList.jsp"
}
/* function board_inquiry() {
	location.href = "controller?type=list"
} */
function review_list() {
	location.href = "reviewList.jsp"
}
</script>
<script type="text/javascript" src="popup.js"></script>
<link href="css/style.css" rel="stylesheet" />
</head>
<body>
	<!-- start hero area -->
	<!-- start header section -->
		<%@ include file="header.jsp" %>
	<!-- end header section -->	
	<!-- end hero area -->
	
  	<!-- 문의게시판 내용 시작 -->
  	
    <div class="contents">
	    <div class="menu">
	    	<ul>
	    		<li><button onclick="board_main()">메인게시판</button></li>
	    		<li><button onclick="notice_list()">공지사항</button></li>
		    	<!-- <li><button id="board_inquiry">문의게시판</button></li> -->
		    	<li><button onclick="review_list()">리뷰게시판</button></li>
		  	</ul>
		<div class="menu_contents">
			
			<!-- 키워드 검색 -->
	    	<form action="controller?type=search" method="post">
				<select name="idx">
					<option value="0">작성자</option>
					<option value="1">제목</option>
					<option value="2">상품번호</option>
				</select>
				<input type="text" name="keyword">
				<input id="search_button" type="submit" value="검색">
				<!-- <input type="hidden" name="type" value="search"> -->
			</form>
			<!-- 리스트 출력 -->
			<h3 id="board_title">문의게시글 리스트</h3>
			<table id="menu_table">
				<thead class="menu_table_head">
					<tr>
						<th id="menu_table_num">게시글 번호</th>
						<th id="menu_table_secret">비밀글 여부</th>
						<th id="menu_table_nickName">작성자</th>
						<th id="menu_table_title">제목</th>
						<th id="menu_table_pnum">상품번호</th>
						<th id="menu_table_regdate">작성일</th>
						<th id="menu_table_moddate">수정일</th>
					</tr>
				</thead >
				<tbody class="menu_table_content" id="tbody">
					<c:choose>
					<c:when test="${empty list }">
						<tr>
							<td colspan="7">
							<h2>현재 등록된 게시글이 없습니다.</h2>
							</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="vo" items="${list }">
							<tr>
								<td>${vo.inquiryNum }</td>
								<td>${vo.secretStatus }</td>
								<td>${vo.cusNickname }</td>
								<td>${vo.title }</td>
								<td>${vo.itemNum }</td>
								<td>${vo.regDate }</td>
								<td>${vo.modDate }</td>
							</tr>
						</c:forEach>
					</c:otherwise>
					</c:choose>
				</tbody>
				<!-- 페이지 번호 -->
				<tfoot>
				<tr>
				<td colspan="6">
					<ol class="paging">
					<%--[이전으로]에 대한 사용여부 처리 --%>
					
					<c:if test="${pvo.beginPage == 1 }">
						<li class="disable">
							<i class="fa fa-angle-left" style="font-size:24px"></i>
						</li>
					</c:if>
					<c:if test="${pvo.beginPage != 1 }">
						<li>
							<a href="controller?type=list&cPage=${pvo.beginPage - 1 }">
							<i class="fa fa-angle-left" style="font-size:24px"></i>
							</a>
						</li>
					</c:if>	
					
					<%--블록내에 표시할 페이지 태그 작성(시작페이지~끝페이지) --%>
					<c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
					<c:if test="${pageNo == pvo.nowPage }">
						<li class="now">${pageNo }</li>
					</c:if>	
					<c:if test="${pageNo != pvo.nowPage }">
						<li>
							<a href="controller?type=list&cPage=${pageNo }">${pageNo }</a>
						</li>
					</c:if>		
						
					</c:forEach>
					
					<%--[다음으로]에 대한 사용여부 처리 --%>
					<c:if test="${pvo.endPage >= pvo.totalPage }">
						<li class="disable"><i class="fa fa-angle-right" style="font-size:24px"></i></li>
					</c:if>
					<c:if test="${pvo.endPage < pvo.totalPage }">
						<li>
							<a href="controller?type=list&cPage=${pvo.endPage + 1 }">
								<i class="fa fa-angle-right" style="font-size:24px"></i>
							</a>
						</li>
					</c:if>		 
					</ol>
				
				</td>
				<td>
					<input type="button" value="글쓰기"
						onclick="javascript:location.href='board_inquiry_write.jsp'">
				</td>
			</tr>
		</tfoot>
			</table>
		</div>
		</div>
  	</div>

  	<!-- 공지사항 내용 끝 -->

  	<!-- info section -->
  	<!-- footer section -->
  	<%@ include file="footer.jsp" %>

</body>
</html>