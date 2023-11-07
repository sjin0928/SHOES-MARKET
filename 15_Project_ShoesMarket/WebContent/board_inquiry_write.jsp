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
		
		form.action = "controller?type=inquiryList";
		form.submit();
	}
	function inquiry_write() {
		let form = document.myform;
		
		form.action = "controller?type=inquiryWrite";
		form.submit();
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
	<!-- start header section -->
		<%@ include file="include/header.jspf" %>

  	<!-- 문의게시판 내용 시작 -->
  	   	<%@ include file="include/boardBtn.jspf" %>
  	   	
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
									<input type="text" name="cusNickname" title="작성자" value="${customer.cusNickName }" readonly>
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
									<input type="button" value="저장" onclick="inquiry_write()">
									<input type="reset" value="초기화">
									<input type="button" value="목록보기" onclick="list_go()">
			
									<input type="hidden" name="inquiryNum" value="${vo.inquiryNum }">
									<input type="hidden" name="idx" value="${idx }">	
									<input type="hidden" name="keyword" value="${keyword }">	
									<input type="hidden" name="cPage" value="${cPage }">	
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
  	<%@ include file="include/footer.jspf" %>
<!-- 부트스트랩 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>