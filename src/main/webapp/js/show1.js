$(document).ready(function(){
	console.log(1);
	
	$('.apply_book_btn').click(toOrder);  //联系房东预订  点击事件
	$('#houseImg').click(houseImages);  //点击主图片时，隐藏下面的内容，显示图片
	
	$('#houseImages').click(show1);  //恢复到详细页面
})

function show1(){
	$('#otherInfo').show();
	$('#houseImages').hide();
}


function houseImages(){
	$('#otherInfo').hide();
	$('#houseImages').show();
	
	//swiper初始化 轮播图片
	var banner = new Swiper('.swiper-banner', {
		pagination: '.swiper-pagination1',
		loop : true,
		//autoplay:1000,
		//pagination : '#swiper-pagination1',
	});
}







function toOrder(){
	var house_info_id=$('.content input').val();
	
	
	document.location.href="apply_book.do?house_info_id="+house_info_id;
	
}