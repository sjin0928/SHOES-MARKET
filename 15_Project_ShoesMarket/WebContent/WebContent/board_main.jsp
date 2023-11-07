<!-- 231024 박수진 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의게시글</title>
<script>
	function notice_list(){
		location.href = "noticeList.jsp"
	}
	function board_inquiry() {
		location.href = "controller?type=list"
	}
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
  	
	<!-- 공지사항 내용 시작 -->
	<div class="contents">
		<div class="menu">
  	    	<ul>
    			<li><button onclick="notice_list()">공지사항</button></li>
	    		<li><button onclick="board_inquiry()">문의게시판</button></li>
	    		<li><button onclick="review_list()">리뷰게시판</button></li>
	  		</ul>
	  		<div class="menu_contents">
	    		<div id="menu_top">
          			<div id="hello">
            			<i class="fa fa-comment" style="font-size:24px"></i><br>
	        			<p>
		        			안녕하세요! 고객님!<br>
		        			빠르고 친절한 답변을 위해 노력하겠습니다.<br>
	        			</p>
	        			<button id="inner-button" onclick="inquiry_list()">자주 묻는 질문 바로가기</button>
	      			</div>
	      			<div id="consult">
            			<i class="fa fa-phone" style="font-size:24px"></i><br>
  	        			<p>
	  	        			고객상담실<br>
		        			1588-8282<br>
		        			상담시간 : 오전 10:00 ~ 오후 17:00<br>
		        			(주말/공휴일 휴무, 점심시간 제외)<br>
		        			점심시간 : 오전 11:30 ~ 오후 12:30
	        			</p>
	      			</div>
	    		</div>
	    		<div id="menu_bottom">
	    			<div id="inquiry_icon_box">
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
		  			<div id="notice">
            			<h4>공지사항</h4>
            			<ul>
            				<li></li>
            			</ul>
            			<a href="board_notice.jsp">+ 더보기</a><br> 
	      			</div>
  	    		</div>
			</div>
		</div>
	</div>
  	<!-- 공지사항 내용 끝 -->

  	<!-- info section -->
  	<!-- footer section -->
  	<%@ include file="footer.jsp" %>

</body>
</html>