<!-- 231024 박수진 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>

 <script>
 <%@ include file="include/popup.js" %>
 <%@ include file="include/search.js" %>
 </script>
<!-- 메뉴바 외 코드 -->
<link href="css/style.css" rel="stylesheet" />
<!-- 메뉴바 부트스트랩 템플릿 사용 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/lux/bootstrap.min.css" integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG" crossorigin="anonymous">
</head>
<body>
	<!-- start hero area -->
	<!-- start header section -->
	<%@ include file="include/managerHeader.jspf" %>
	<!-- end header section -->	
	<!-- end hero area -->
	
  	<!-- 문의게시판 내용 시작 -->
  	
	<!-- 게시판 내용 시작 -->
	<br>
   	<%@ include file="include/managerBoardBtn.jspf" %>
   	<br>
	<div class="container">
	<h4 id="board_title">공지사항</h4>
			<!-- 키워드 검색 -->
	    	<form action="controller?type=managerNoticeSearch" method="post">
	    		<i class="fa fa-search" style="font-size:14px"></i> 
				<input type="text" name="keyword">
				<input id="search_button" type="submit" value="검색">
				<!-- <input type="hidden" name="type" value="search"> -->
			</form><br>
			<!-- 리스트 출력 -->
			<table class="table table-hover">
				<thead class="menu_table_head">
					<tr>
						<th id="menu_table_num">게시글 번호</th>
						<th id="menu_table_nickName">작성자</th>
						<th id="menu_table_title">제목</th>
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
								<td>${vo.noticeNum }</td>
								<td>관리자</td>
								<td>
								<a href="controller?type=managerNoticeView&
									noticeNum=${vo.noticeNum }&idx=${idx }&keyword=${keyword }">${vo.noticeTitle }</a>
								</td>
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
							<a href="controller?type=managerNoticeList&cPage=${pvo.beginPage - 1 }">
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
							<a href="controller?type=managerNoticeList&cPage=${pageNo }">${pageNo }</a>
						</li>
					</c:if>		
						
					</c:forEach>
					
					<%--[다음으로]에 대한 사용여부 처리 --%>
					<c:if test="${pvo.endPage >= pvo.totalPage }">
						<li class="disable"><i class="fa fa-angle-right" style="font-size:24px"></i></li>
					</c:if>
					<c:if test="${pvo.endPage < pvo.totalPage }">
						<li>
							<a href="controller?type=noticeList&cPage=${pvo.endPage + 1 }">
								<i class="fa fa-angle-right" style="font-size:24px"></i>
							</a>
						</li>
					</c:if>		 
					</ol>
				</td>
				<td>
					<input type="button" value="글쓰기"
						onclick="javascript:location.href='manager_notice_write.jsp'">
				</td>
			</tr>
			</tfoot>
			</table>
		</div>

	<br><br><br><br><br><br><br><br>
  	<!-- 공지사항 내용 끝 -->

  	<!-- info section -->
  	<!-- footer section -->
  	<div>
	<%@ include file="include/managerFooter.jspf" %>
	</div>
<!-- 부트스트랩 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>