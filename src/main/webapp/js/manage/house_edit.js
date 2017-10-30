$(document).ready(function(){
	
	
	
	
	
	
	//当模态框隐藏时在.ok上绑定的事件执行解绑动作
	$("#modal-dialog").on(
	   "hidden.bs.modal",function() {$(this).off('click', '.ok').removeData("id")
	});
	
	//保存或更新操作(在这写 会保存二次)
	//$("#modal-dialog").on('click','.ok',doSaveOrUpdate);
	
	//保存
	//$("#modal-dialog").on('click','.ok',doSave);
	
	//更新
	//$("#modal-dialog").on('click','.ok',doUpdate);
	
	
	//获得模态框上绑定的id值
	var id=$("#modal-dialog").data("id");
	console.log(id);
	//假如id有值,说明这是修改,然后根据id获得对象,初始化模态框数据
	//if(id)doGetObjectById(id);
	if(id){
		doGetObjectById(id);
	}else{
		$("#modal-dialog").on('click','.ok',doSave);
	}
	
	
})


   //保存或更新操作 （写在自动加载区 会保存二次）   
//$("#modal-dialog").on('click','.ok',doSaveOrUpdate);
////获得模态框上绑定的id值
//var id=$("#modal-dialog").data("id");
//console.log(id);
////假如id有值,说明这是修改,然后根据id获得对象,初始化模态框数据
//if(id)doGetObjectById(id);	



//根据id查找房源对象
function doGetObjectById(id){
	var url="house/doFindById.do";
	var params={"id":id};
	$.post(url,params,function(result){
		console.log(result)
		if(result.state==1){
			//初始化表单数据
			doFillFormData(result.data);
			
			//更新
			$("#modal-dialog").on('click','.ok',doUpdate);
			
			
		}else{
			alert(result.message);
		}
	});
}

//将获得的数据填充到form表单中
function doFillFormData(obj){
	
	$("#titleId").val(obj.title);   //首页中的标题
	$("#cityId").val(obj.city);     //城市    根据house_edit.jsp中 <input id>
	$("#districtId").val(obj.district); //区域
	
	
	
	/*$("#beginDateId").val(obj.beginDate);//2017/08/09 
	$("#endDateId").val(obj.endDate);*/
}

//保存
function doSave(){
	//1.获得表单数据
	var params=doGetEditFormData();
	var url="house/doSaveProject.do";
	$.post(url,params,function(result){
		if(result.state==1){
			//1)隐藏模态框
			$("#modal-dialog").modal("hide");
			//当模态隐藏时，.ok上绑定的事件执行解绑动作  （否则会执行二次保存操作）
			$('#modal-dialog').modal('hide').off('click', '.ok').removeData("id");
			//2)重新查询列表数据
			doGetObjects();
		}else{
		   alert(result.message);
		}
	});
	
}
//更新
function doUpdate(){
	//1.获得表单数据
	var params=doGetEditFormData();
	var url="house/doUpdataProject.do";
	$.post(url,params,function(result){
		if(result.state==1){
			//1)隐藏模态框
			$("#modal-dialog").modal("hide");
			//当模态隐藏时，.ok上绑定的事件执行解绑动作  （否则会执行二次保存操作）
			$('#modal-dialog').modal('hide').off('click', '.ok').removeData("id");
			//2)重新查询列表数据
			doGetObjects();
		}else{
		   alert(result.message);
		}
	});
	
}






//保存或更新数据
function doSaveOrUpdate(){
	if($("#editFormId").valid()){//required
		
	//1.获得表单数据
	var params=doGetEditFormData();
	//2.将数据提交到服务端
	var id=$("#modal-dialog").data("id");
	var url=id?"house/doUpdataProject.do":"house/doSaveProject.do";
	$.post(url,params,function(result){
		if(result.state==1){
			//1)隐藏模态框
			$("#modal-dialog").modal("hide");
			
			//当模态隐藏时，.ok上绑定的事件执行解绑动作  （否则会执行二次保存操作）
			$('#modal-dialog').modal('hide').off('click', '.ok').removeData("id");
			console.log('lmg')
			//2)重新查询列表数据
			doGetObjects();
		}else{
		   alert(result.message);
		}
	});
	
	}
}
//获得表单数据
function doGetEditFormData(){
	var params={
		"houseInfoId":$("#modal-dialog").data("id"),//更新时需要
		
		"title":$("#titleId").val(),
		"city":$("#cityId").val(),
		"district":$("#districtId").val(),
		
		
		/*"beginDate":$("#beginDateId").val(),
		"endDate":$("#endDateId").val(),
		"valid":$('input[name="valid"]:checked').val(),
		"note":$('#noteId').val()*/
		
	};
	//检测获得的结果
	console.log(JSON.stringify(params));
	return params;
}

