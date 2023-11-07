<!-- 231024 박수진 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의게시글</title>
<script>
function board_main(){
	let form = document.formButton;
	form.action="controller?type=board";
	form.submit();
}
function notice_list(){
	let form = document.formButton;
	
	form.action="controller?type=noticeList";
	form.submit();
}
function board_inquiry() {
	let form = document.formButton;
	
	form.action="controller?type=list";
	form.submit();
}
function review_list() {
	let form = document.formButton;
	
	form.action="controller?type=reviewList";
	form.submit();
}
</script>
 <script>
 <%@ include file="include/popup.js" %>
 <%@ include file="include/search.js" %>
 </script>
<link href="css/style.css" rel="stylesheet" />
</head>
<body>
	<!-- start hero area -->
	<!-- start header section -->
	<%@ include file="include/header.jspf" %>
	<!-- end header section -->
	<!-- end hero area -->
  	
	<!-- 공지사항 내용 시작 -->
	<div class="contents">
		<div class="menu">
	    	<form method="post" name="formButton">
	    	<ul>
	    		<li><input class="inputbutton" type="button" value="메인게시판" onclick="board_main()"></li>
	    		<li><input class="inputbutton" type="button" value="공지사항" onclick="notice_list()"></li>
	    		<li><input class="inputbutton" type="button" value="문의게시판" onclick="board_inquiry()"></li>
	    		<li><input class="inputbutton" type="button" value="리뷰게시판" onclick="review_list()"></li>
	    	</ul>
	    	</form>
	  		<div class="menu_contents">
	    		<div id="menu_top">
          			<div id="hello">
            			<i class="fa fa-comment" style="font-size:24px"></i>
	        			<p>
		        			안녕하세요! 고객님!<br>
		        			빠르고 친절한 답변을 위해 노력하겠습니다.
	        			</p>
	        			<!-- <button id="inner-button" onclick="inquiry_list()">자주 묻는 질문 바로가기</button> -->
	      			</div>
	      			<div id="consult">
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
            				<li>
            				
            				</li>
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
  	<%@ include file="include/footer.jspf" %>

</body>
</html>