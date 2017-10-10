//swiper初始化 轮播图片
var banner = new Swiper('.swiper-banner', {
	pagination: '.swiper-pagination1',
	loop : true,
	autoplay:1000,
	//pagination : '#swiper-pagination1',
});

$(document).ready(function(){
	//弹出注册页面  使用bootstrap
	$('#queryFormId').on("click",".btn-add",showEditDialog);
})



function showEditDialog(){
	//var url="project/editUil.do"
	var url="editUil.do"
		
	var title;	
	if($(this).hasClass("btn-update")){
		title="修改项目"
		//将id 绑定到 打开的模态框上
		$("#modal-dialog").data("id",$(this).parent().parent().data("id"));
	}
	if($(this).hasClass("btn-add")){
		title="添加项目"
	}
		
	$('#modal-dialog .modal-title').html(title);  //更改标题名
	
	$('#modal-dialog .modal-body').load(url,function(){
		$('#modal-dialog').modal('show');
	});
}