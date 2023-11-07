 function search_go() {
	 alert("search_go() 시작");
	 let form = document.forms["myForm"];
	 // 앞단에서 텍스트창에 문자 입력했는지 확인
	 if(form.elements['keyword'].value.trim() == ""){
		 alert(form.elements['keyword'].title + "를 입력하세요");
		 form.elements['keyword'].focus;
		 return;
	 }
	 form.submit();
}

/* 드롭다운 */
let isDropdownMenuVisible = false;

function showDropdownMenu() {
    const dropdownMenu = document.querySelector('.dropdown-brand');
    dropdownMenu.style.display = 'block';
    isDropdownMenuVisible = true;
}

function hideDropdownMenu() {
    const dropdownMenu = document.querySelector('.dropdown-brand');
    dropdownMenu.style.display = 'none';
    isDropdownMenuVisible = false;
}

function toggleDropdownMenu(event) {
    event.stopPropagation(); // 클릭 이벤트가 문서의 다른 부분으로 전파되지 않도록 함

    const dropdownMenu = document.querySelector('.dropdown-brand');
    if (isDropdownMenuVisible) {
        hideDropdownMenu();
    } else {
        showDropdownMenu();
    }
}

// 문서의 다른 부분을 클릭하면 드롭다운 메뉴 닫기
document.addEventListener('click', function (event) {
    const dropdownMenu = document.querySelector('.dropdown-brand');
    if (isDropdownMenuVisible && event.target !== dropdownMenu) {
        hideDropdownMenu();
    }
});