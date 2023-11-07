<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품상세(수정/삭제하는 페이지)</title>
<!-- 메뉴바 외 코드 -->
	<link href="css/style.css" rel="stylesheet" />
	<!-- 부트스트랩 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/lux/bootstrap.min.css" integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG" crossorigin="anonymous">
<script>

	function update_go(){
		//alert("update_go() 시작");
		let form = document.forms["myItemForm"];

		form.action ="controller?type=itemUpdate";
		form.submit();
	}
	
	function delete_go(){
		//alert("delete_go() 시작");
		location.href ="controller?type=itemDelete";
	}
	
	
	
	 <%@ include file="include/popup.js" %>
	 <%@ include file="include/search.js" %>
</script>
</head>
<body>
	<%@ include file="include/managerHeader.jspf" %>
	<br>
	<div class="container" style=" max-width: 700px;margin: 0 auto;">
	<form action="controller?type=productWrite" method="post" name="myItemForm" enctype="multipart/form-data">
		<!-- 상품명 : text -->
		<div class="form-group">
		    <label for="productName">상품명</label>
		<input class="form-control" value="${itemVo.name }" type="text" name="name" title="상품명" placeholder="Product Name" aria-label="default input example">
		</div>
		<!-- 브랜드 : select(opction) -->
		<div class="form-group">
		    <label for="brand">브랜드</label>
		    <select class="form-control" name="brand" title="브랜드" id="brandSeleted">
		    <option value="아디다스">아디다스</option>
			<option value="컨버스">컨버스</option>
			<option value="뉴발란스">뉴발란스</option>
			<option value="반스">반스</option>
			<option value="푸마">푸마</option>
		    </select>
		  </div>
		<!-- 가격 : text -->
		<div class="form-group">
		    <label for="Price">가격</label>
		<input class="form-control" value="${itemVo.price }" type="text" name="price" title="가격" placeholder="Price" aria-label="default input example">
		</div>
		<!-- 이미지 : file -->
		<div class="mb-3">
		  <label for="imagePath" class="form-label">이미지</label>
		  <input class="form-control" type="file" title="이미지" name="imagePath" id="formFile">
		</div>
		<!-- 재고 : text -->
		<div class="form-group">
		    <label for="Stock">재고</label>
		<input class="form-control" value="${itemVo.stock }" type="text" name="stock" title="재고" placeholder="Stock" aria-label="default input example">
		</div>
		<!-- 상품 설명 : textarea -->
		  <div class="form-group">
		    <label for="itemDetail">상품설명</label>
		    <textarea class="form-control" name="itemDetail" title="상품설명" id="exampleFormControlTextarea1" rows="5">${itemVo.itemDetail }</textarea>
		  </div>
		  
		  <!-- 등록하기 : button -->
		  <input class="btn btn-primary" type="button" value="수정하기" onclick="update_go();" />
		  <!-- 다시입력 : reset -->
		  <input class="btn btn-dark" type="button" value="삭제하기" onclick="delete_go();"/>
		  <!-- 작성취소 : button -->
		  <input class="btn btn-dark" type="button" value="작성취소" title="작성취소" onclick="javascript:location.href='controller?type=itemBulletinBoard'"/>
	</form>
	</div>
	<br><br>
	<script>

	let brandValue = "${itemVo.brand}"; // itemVo.brand의 값
	// select 요소를 찾음
	let selectElement = document.getElementById("brandSeleted");
	
	// option 요소를 찾아서 선택 상태를 설정
	let options = selectElement.options;
	for (let i = 0; i < options.length; i++) {
	    if (options[i].value === brandValue) {
	        options[i].selected = true;
	        break; // 원하는 옵션을 찾았으면 루프 종료
	    }
	}
	
	</script>
<%@ include file="include/managerFooter.jspf" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>