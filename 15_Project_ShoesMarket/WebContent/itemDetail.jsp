<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품상세(수정/삭제하는 페이지)</title>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
 	<link href="css/style.css" rel="stylesheet" />
<script>
	function update_go(){
		alert("update_go() 시작");
		let form = document.forms["myForm"];
		// 사진 첨부 안 했을 경우
		/* if(form.elements[2].value.trim() == ""){
			alert(form.elements[2].title + "을 입력하세요");
			form.elements[2].focus;
			return;
		} */
		form.action ="controller?type=itemUpdate";
		form.submit();
	}
	
	function delete_go(){
		alert("delete_go() 시작");
		location.href ="controller?type=itemDelete";
	}
	 <%@ include file="include/popup.js" %>
	 <%@ include file="include/search.js" %>
</script>
</head>
<body>
	<%@ include file="include/managerHeader.jspf" %>
	<br/><br/>
	
	<table border="3px solid #D6D4A6"  width="600" align="center" cellspacing="0" cellpadding="0" style="padding-left: 20px;">
		<tr height="30">
			<td style="border: none;"><b>상품수정</b></td>
		</tr>
	</table>
<form method="post" name="myForm" enctype="multipart/form-data">
<table width="600" align="center" cellspacing="0" cellpadding="0">

	<tr>
		<td colspan="2" height="3" bgcolor="#dbdbdb" align="center"></td>
	</tr>
	<!-- 상품명, 가격 , 재고, 이미지 경로, 제품 설명 -->
	<tr>
	<!-- 상품명 : form.elements[0] -->
		<th width="100" height="30" bgcolor="#eeeeee">상품명</th>
		<td style="padding-left: 20px;">
		<input type="text" value="${itemVo.name }" name="name" class="boxTF" size="70" title="상품명">
		</td>
	</tr>
	
	<tr>
	<!-- 가격 : form.elements[1] -->
		<th width="100" height="30" bgcolor="#eeeeee">가격</th>
		<td style="padding-left: 20px;">
		<input type="text" value="${itemVo.price }" name="price" class="boxTF" size="70" title="가격">
		</td>
	</tr>
	
	<tr>
		<td colspan="2" height="1" bgcolor="#dbdbdb" align="center"></td>
	</tr>
	
	<!-- type 속성이 file일 경우 초기값 설정 불가함 -->
	<tr>
		<th width="100" height="30" bgcolor="#eeeeee">썸네일</th>
		<td style="padding-left: 20px;"><input type="file" title="썸네일" name="imagePath" class="boxTF" size="70"></td>
	</tr>
	
	<tr>
		<td colspan="2" height="1" bgcolor="#dbdbdb" align="center"></td>
	</tr>
	
	<tr>
	<!-- 재고 : form.elements[3] -->
		<th width="100" height="30" bgcolor="#eeeeee">재고</th>
		<td style="padding-left: 20px;">
		<input type="text" value="${itemVo.stock }" name="stock" class="boxTF" size="70" title="재고">
		</td>
	</tr>
	<tr>
		<td colspan="2" height="1" bgcolor="#dbdbdb" align="center"></td>
	</tr>
	
	<tr>
	<!-- 상품설명 : form.elements[4] -->
		<th width="100" height="30" bgcolor="#eeeeee">상품설명</th>
		<td style="padding-left: 20px;"><textarea cols="68" name="itemDetail" class="boxTA" title="상품설명">${itemVo.itemDetail }</textarea></td>
	</tr>
	
	<tr>
		<td colspan="2" height="1" bgcolor="#dbdbdb" align="center"></td>
	</tr>
	
	<tr>
	<!-- 브랜드 : form.elements[5] -->
		<th width="100" height="30" bgcolor="#eeeeee">브랜드</th>
		<td style="padding-left: 20px;">
		<input type="text" value="${itemVo.brand }" name="brand" class="boxTF" size="70" title="브랜드">
		</td>
	</tr>
	
	<tr>
		<td colspan="2" height="1" bgcolor="#dbdbdb" align="center"></td>
	</tr>
	
	
	
	

</table>


<br/>

<table width="600" align="center" cellspacing="0" cellpadding="0">
	<tr >
		<td>
		<input type="button" class="btn1" value="수정하기" onclick="update_go();"/>
		<input type="button" class="btn1" value="삭제하기" onclick="delete_go();"/>
		<!-- 상품등록 게시판으로 이동 -->
		<input type="button" class="btn1" value="작성취소" onclick="javascript:location.href='controller?type=itemBulletinBoard'"/>
		</td>
	</tr>
</table>
</form>
<%@ include file="include/managerFooter.jspf" %>
</body>
</html>