$(document).ready(function(){
	//弹出注册页面  使用bootstrap   通过请求  转到注册页面
	$('#queryFormId').on("click",".btn-add",showEditDialog);
	
	//修改项目信息
	$('#queryFormId').on("click",".btn-update",showEditDialog);
	
	//删除项目信息
	$('#queryFormId').on("click",".btn-delete",deleteHouse);
	
	//初始化页面
	doGetObjects();
});


//删除房源信息
function deleteHouse(){
	var id=$(this).parent().parent().find(".checkbox").val();
	console.log(id);
	if(confirm('确定要删除吗？')){
		var url="house/delete.do";
		var params={"id":id};
		$.post(url,params,function(){
			doGetObjects();
		});
	}else{
		//alert('删除失败！')
	}
}


//显示模态框
function showEditDialog(){
	//通过请求  转到注册页面
	var url="calendar/editUI.do"
	var title;	
	if($(this).hasClass("btn-update")){
		title="修改项目"
		//将id 绑定到 打开的模态框上  修改时绑定id
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



//获得房源所有信息
function doGetObjects(){
  var url="calendar/findAllObjects.do";
  var currentPage=$("#pagination").data('curPage');
  var params={};
  var pageCurrent=$('#pageId1').data("pageCurrent"); //获取到当前页
  if(pageCurrent){
	  params.pageCurrent=pageCurrent;
  }else{
	  params.pageCurrent=1;
  }
  
  $.post(url,params,function(result){
	  
	  console.log(result.data)
	  
		if(result.state==1){
			//填充数据   
		   setTableRows(result.data);
		   //显示分页
		   //setPagination(result.data.pageObject);
		}else{
			alert(result.message);
		}   
  });
}



//获取查询参数
function getQueryParamValues(){
	var name = $('#searchNameId').val();
	var projectId=$('#selectProjectId option:selected') .val();//选中的值
	var params = {'name':name,'projectId':projectId,}
	return params;
}


//初始化列表页面
function setTableRows(list){
	var tBody=$('tbody');
	tBody.empty();
	var tds='<td><input type="checkbox" class="checkbox" name="checkedItem" value="[id]"></td>'+
			'<td>[houseInfoId]</td>'+   
			'<td>[dateTime]</td>'+
	        '<td>[price]</td>'+
	        '<td>[roomNum]</td>'+
	        '<td>[month]</td>'+
	        '<td>[status]</td>'+
	        
	        '<td><a class="btn btn-default btn-update doShowEditDialog">修改</a>'+
	        '<a class="btn btn-default btn-delete">删除</a>'+
	        '</td>';
	for(var i in list){
	    var tr=$('<tr></tr>');
	    tr.data("id",list[i].houseInfoId);
	    tr.append(tds.replace('[id]',list[i].id)
	    		  .replace('[houseInfoId]',list[i].houseInfoId)
	    		  .replace('[dateTime]',list[i].dateTime)
	    		  .replace('[price]',list[i].price)
	    		  .replace('[roomNum]',list[i].roomNum)
	    		  .replace('[month]',list[i].month)
	    		  .replace('[status]',list[i].status)
	    );
	    tBody.append(tr);
	}
}



//显示编辑模态框
function doShowEditDialog(){
	 var url='team/editUI.do?t='+Math.random(1000);
	 $("#modal-dialog").data("projects",projects);
	 var title;
	 if($(this).hasClass("btn-add")){
		 title="添加团信息";
	 }
	 if($(this).hasClass("btn-update")){
		 $("#modal-dialog").data("id",$(this).parent().parent().data("id"));
		 title="修改团信息"
	 }
	 $("#modal-dialog .modal-body").load(url,function(){
		 $('#modal-dialog .modal-title').html(title);
		 $('#modal-dialog').modal('show');
	 })
}

//禁用&启用
function doValidById(){
	var state;
	//判断点击的按钮
	if($(this).hasClass("btn-valid")){
		state=1;
	}else{
		state=0;
	}
	//获得选中的id
	var checkedIds=getCheckedIds();
	if(checkedIds==''){
		alert("至少选择一个");
		return;
	}
	//发送ajax请求修改状态
	var url='team/doValidById.do';
	var params={'checkedIds':checkedIds,'valid':state}
	$.post(url,params,function(result){
		if(result.state==1){
		  doGetObjects();
		}else{
		  alert(result.message);
		}
	})
}
//获得选中的id，然后拼接成字符串
function getCheckedIds(){
	var checkedIds ='';
	$('tbody input[name="checkedItem"]').each(function(){
		if($(this).is(':checked')){  //或者用prop('checked')
			if(checkedIds==''){
			   checkedIds += $(this).val();
			}else{
			   checkedIds += ','+$(this).val();
			}
		}
	})
	return checkedIds;
}