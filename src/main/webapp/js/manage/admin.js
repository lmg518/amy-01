$(document).ready(function(){
	
	//弹出注册页面  使用bootstrap   通过请求  转到注册页面
	$('#queryFormId').on("click",".btn-add",showEditDialog);
	
	
});

//显示模态框
function showEditDialog(){
	//通过请求  转到注册页面
	var url="team/editUI.do"
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