<!-- 231024 박수진 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>문의 게시글 작성</title>
<script>
	function list_go() {
		let form = document.myform;
		
		form.action = "controller?type=list";
		form.submit();
	}
	function inquiry_insert() {
		let form = document.myform;
		
		form.action = "controller?type=inquiryWrite";
		form.submit();
	}
	function search() {
		
	}
	function board_main(){
		location.href = "board_main.jsp"
	}
	function notice_list(){
		location.href = "noticeList.jsp"
	}
	function review_list() {
		location.href = "reviewList.jsp"
	}
</script>
<script type="text/javascript" src="popup.js"></script>
<link href="css/style.css" rel="stylesheet" />
</head>
<body>

		<%@ include file="header.jsp" %>
	
  	<!-- 문의게시판 내용 시작 -->
  	
    <div class="contents">
	    <div class="menu">
  	    	<ul>
  	    		<li><button onclick="board_main()">메인게시판</button></li>
    			<li><button onclick="notice_list()">공지사항</button></li>
	    		<li><button onclick="review_list()">리뷰게시판</button></li>
	  		</ul>
			<div class="menu_contents">
				
				<!-- 문의게시판 글쓰기 -->
				<form method="post" name="myform" enctype="multipart/form-data" >
					<table id="inquiry_write">
						<caption>문의게시판 글쓰기</caption>
						<tbody>
							<tr>
								<th class="inquiry_write_th_td">제목</th>
								<td class="inquiry_write_th_td">
									<input type="text" name="title" title="제목">
								</td>
							</tr>
							<tr class="inquiry_write_tr_td">
								<th>상품명</th>
								<td>
									<input type="text" name="itemName" title="상품명">
								</td>
							</tr>
							<tr>
							<th>작성자</th>
								<td>
									<!-- 합친 후 value에 세션 넣어줘야 함 -->
									<!-- InquiryWriteCommand에 cusNum 보내줘야함 아래 인풋 -->
									<input type="text" name="cusNickname" title="작성자" value="test11" readonly>
								</td>
							</tr>
							<tr class="inquiry_write_tr_td">
								<th>내용</th>
								<td>
									<textarea name="contents" rows="8" cols="50" title="내용"></textarea>
								</td>
							</tr>
							<tr class="inquiry_write_tr_td">
								<th>첨부파일</th>
								<td>
									<input type="file" name="inqImgPath">
								</td>
							</tr>
							<tr class="inquiry_write_tr_td">
								<th>비밀글</th>
								<td>
									<div style="font-size: 14px">
									<input type="checkbox" name="secretStatus" >
									체크하시면 다른 회원님들은 조회할 수 없습니다.
									</div>
								</td>
							</tr>
						</tbody>
						<tfoot>
							<tr class="inquiry_write_tr_td">
								<td colspan="2">
									<input type="button" value="저장" onclick="inquiry_insert()">
									<input type="reset" value="초기화">
									<input type="button" value="목록보기" onclick="list_go()">
			
									<input type="hidden" name="inquiryNum" value="${vo.inquiryNum }">	
									<input type="hidden" name="cusPassword" value="${vo.cusPassword }">	
									<input type="hidden" name="idx" value="${idx }">	
									<input type="hidden" name="keyword" value="${keyword }">	
									<input type="hidden" name="cPage" value="${cPage }">
									<!-- InquiryWriteCommand에 cusNum 보내줘야함 -->	
									<%-- <input type="hidden" name="cusNum" value="${cusNum }"> --%>	
								</td>
							</tr>
						</tfoot>
					</table>		
				</form>
			</div>
	  	</div>
  	</div>

  	<!-- 공지사항 내용 끝 -->

  	<!-- info section -->
  	<!-- footer section -->
  	<%@ include file="footer.jsp" %>

</body>
</html>