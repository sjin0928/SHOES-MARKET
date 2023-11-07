<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록 페이지</title>
<!-- 메뉴바 외 코드 -->
	<link href="css/style.css" rel="stylesheet" />
	<!-- 부트스트랩 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/lux/bootstrap.min.css" integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG" crossorigin="anonymous">
<script>
<%@ include file="include/popup.js" %>
	function write_go(){
		alert("write_go() 시작");
		let form = document.forms["myForm"];
		// 앞단에서 요소들 모두 작성되었는지 확인
		// form.elements[0] ~ form.elements[5] : 상품명,가격,이미지,재고,상품설명,브랜드
		for (let i = 0; i < form.elements.length - 3; i++){
			if(form.elements[i].value.trim() == ""){
				// 작성 안 했을 경우 다시 입력하도록 처리
				alert(form.elements[i].title + "을 입력하세요");
				form.elements[i].focus;
				return;
			}
		}
		
		
		form.submit();
	}
</script>

</head>
<body>
	<%@ include file="include/managerHeader.jspf" %>
	<!-- ------------------------------------------------------------------------ -->
	
	
	<br/><br/>
	
	<table border="3px solid #D6D4A6"  width="600" align="center" cellspacing="0" cellpadding="0" style="padding-left: 20px;">
		<tr height="30">
			<td style="border: none;"><b>상품등록</b></td>
		</tr>
	</table>
	
<form action="controller?type=productWrite" method="post" name="myForm" enctype="multipart/form-data">
<table width="600" align="center" cellspacing="0" cellpadding="0">

	<tr>
		<td colspan="2" height="3" bgcolor="#dbdbdb" align="center"></td>
	</tr>
	<!-- 상품명, 가격 , 재고, 이미지 경로, 제품 설명 -->
	<tr>
	<!-- 상품명 : form.elements[0] -->
		<th width="100" height="30" bgcolor="#eeeeee">상품명</th>
		<td style="padding-left: 20px;">
		<input type="text" name="name" class="boxTF" size="70" title="상품명">
		</td>
	</tr>
	
	<tr>
	<!-- 가격 : form.elements[1] -->
		<th width="100" height="30" bgcolor="#eeeeee">가격</th>
		<td style="padding-left: 20px;">
		<input type="text" name="price" class="boxTF" size="70" title="가격">
		</td>
	</tr>
	
	<tr>
		<td colspan="2" height="1" bgcolor="#dbdbdb" align="center"></td>
	</tr>
	
	<!-- 이미지 경로(텍스트)에서 파일로 변경  -->
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
		<input type="text" name="stock" class="boxTF" size="70" title="재고">
		</td>
	</tr>
	<tr>
		<td colspan="2" height="1" bgcolor="#dbdbdb" align="center"></td>
	</tr>
	
	<tr>
	<!-- 상품설명 : form.elements[4] -->
		<th width="100" height="30" bgcolor="#eeeeee">상품설명</th>
		<td style="padding-left: 20px;"><textarea cols="68" name="itemDetail" class="boxTA" title="상품설명"></textarea></td>
	</tr>
	
	<tr>
		<td colspan="2" height="1" bgcolor="#dbdbdb" align="center"></td>
	</tr>
	
	<tr>
	<!-- 브랜드 : form.elements[5] -->
		<th width="100" height="30" bgcolor="#eeeeee">브랜드</th>
		<td style="padding-left: 20px;">
		<!-- <input type="text" name="brand" class="boxTF" size="70" title="브랜드"> -->
		<select name="brand" title="브랜드" class="boxTF" style="width:100px;">
			<option value="0" disabled selected>브랜드</option>
			<option value="아디다스">아디다스</option>
			<option value="컨버스">컨버스</option>
			<option value="뉴발란스">뉴발란스</option>
			<option value="반스">반스</option>
			<option value="푸마">푸마</option>
		</select>
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
		<input type="button" class="btn1" value="등록하기" onclick="write_go();"/>
		<input type="reset" class="btn1" value="다시입력" onclick="document.myForm.subject.focus();"/>
		<!-- 상품등록 게시판으로 이동 -->
		<input type="button" class="btn1" value="작성취소" onclick="javascript:location.href='controller?type=itemBulletinBoard'"/>
		</td>
	</tr>
</table>
</form>
<br><br>
	<!-- ------------------------------------------------------------------------ -->
	
	<%@ include file="include/managerFooter.jspf" %>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>