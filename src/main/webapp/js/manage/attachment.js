$(document).ready(function(){
	
	$('#uploadFormId').on('click','.btn-upload',doUpload)  //附件 点击
	
//	$('#uploadFormId').on('click','.btn-down',doDownload)  //附件 下载
//	doGetObjects();
})


function doUpload(){
	var url="house/doSaveObject.do";
	$('#uploadFormId').ajaxSubmit({
		type:'post',
		url:url,
		data:{},
		dataType:'json',
		success:function(result){
			if(result.state==1){
				alert("upload ok");
				//doGetObjects();
			}else{
				alert(result.message);
			}
		}
	});
}


//显示所有附件列表
function doGetObjects(){
	var url="products/findObjects.do";
	$.post(url,function(result){
		
		console.log(result.data);
		
		if(result.state==1){
			setTableRows(result.data);
		}else{
			alert(result.message);
		}
	});
}

function doDownload(){
	var id=$(this).parent().parent().data("id");
	
	var url="products/doDownload.do?id="+id;
	document.location.href=url;
	
	//var url="products/doDownload.do"
	//var params={"id":id};	
	
	
//	alert("downLoad OK!");
	
//	$.post(url,params,function(){
//		console.log(11111);
//		//alert("downLoad OK!");
//	});
	
	
}




function setTableRows(list){
	var tBody=$('#tbody');
	tBody.empty();
	
	var tds='<td><input type="checkbox" name="selectItem" class="checkbox" name="checkedItem" value="[id]" ></td>'
		+'<td>[title]</td>'
		+'<td>[name]</td>'
		+'<td>[contentType]</td>'
		+'<td><input type="button" class="btn btn-primary btn-down" value="下载" /></td>';
	for(var i in list){
		var tr=$('<tr></tr>');
		tr.data("id",list[i].id);
		tr.append(
		tds.replace("[id]",list[i].id)
		   .replace("[title]",list[i].title)
		   .replace("[name]",list[i].fileName)
		   .replace("[contentType]",list[i].contentType));
		
		tBody.append(tr); //每循环一次 就添加到tBody
	}	
}

















