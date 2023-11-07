<!-- 231024 박수진 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
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
	<%@ include file="include/header.jspf" %>
	<!-- end header section -->
	<!-- end hero area -->
  	<br>
	<!-- 게시판 내용 시작 -->
   	<%@ include file="include/boardBtn.jspf" %>
   	<br>
 		<div class="container">
   			<div class="row" id="menu_top">
        		<div class="col-5" id="hello">
          			<i class="fa fa-comment" style="font-size:24px"></i>
	       			<p>
	        			안녕하세요! 고객님!<br>
	        			빠르고 친절한 답변을 위해 노력하겠습니다.
	       			</p>
	       			<br>
		       		<div id="icon"> 	   			
		      			<div class="inquiry_icon">
		        			<i class="fa fa-truck" style="font-size:24px"></i><br>
		        			주문/배송(조회)<br>
			   			</div>
			   			<div class="inquiry_icon">
		        			<i class="fa fa-shopping-bag" style="font-size:24px"></i><br>
		        			취소, 반품교환<br>
			   			</div>
		      			<div class="inquiry_icon">
		        			<i class="fa fa-id-card" style="font-size:24px"></i><br>
		        			회원정보수정<br>
		     			</div>
	   				</div>
       				<!-- <button id="inner-button" onclick="inquiry_list()">자주 묻는 질문 바로가기</button> -->
     			</div>
     			<div class="col-5" id="consult">
          			<i class="fa fa-phone" style="font-size:24px"></i>
        			<p>
	        		고객상담실<br>
       				1588-8282<br>
       				상담시간 : 오전 10:00 ~ 오후 17:00<br>
       				(주말/공휴일 휴무, 점심시간 제외)<br>
       				점심시간 : 오전 11:30 ~ 오후 12:30
      				</p>
     			</div>
   			</div>
   			<br><br>
   		<div class="row" id="menu_bottom">

  			<div class="col-12" id="notice">
  				
  				<div id="main_board_notice">
  				<i class="fa fa-bell" style="font-size:24px"></i>
      			<h4>&nbsp;공지사항</h4>
      			<a href="controller?type=noticeList">&nbsp;+ 더보기</a>
      			</div>
      			<div>
      			<table class="table table-hover">
      				<thead class="menu_table_head">
	      			<tr>
		      			<th>글번호</th>
		      			<th>제목</th>
		      			<th>내용</th>
		      			<th>작성일</th>
	      			</tr>
	      			</thead >
	      			<tbody class="menu_table_content" id="tbody">
	      			<c:forEach var="vo" items="${list }">   
	      				<tr>
	      					<td id="notice_num">${vo.noticeNum }</td>
	      					<td id="notice_title"><a href="controller?type=noticeView&noticeNum=${vo.noticeNum }&idx=${idx}&keyword=${keyword}">${vo.noticeTitle }</a></td>
	      					<td id="notice_contents">${vo.contents }</td>
	      					<td id="notice_regdate">${vo.regDate }</td>
	      				</tr>
      				</c:forEach>
      				</tbody>
      			</table>
      			
      			</div>
   			</div>
   		</div>
	</div>
  	<!-- 공지사항 내용 끝 -->

  	<!-- info section -->
  	<!-- footer section -->
  	<%@ include file="include/footer.jspf" %>
<!-- 부트스트랩 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>