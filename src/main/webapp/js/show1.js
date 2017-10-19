$(document).ready(function(){
	console.log(1);
	
	$('.booking').click(toOrder);  //联系房东预订  点击事件
	
})

function toOrder(){
	var house_info_id=$('.content input').val();
	
	
	document.location.href="apply_book.do?house_info_id="+house_info_id;
	
}