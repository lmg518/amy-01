var SUCCESS = 1;
//设置按钮的文字,以及编辑框的标题
setBtnVal();
//点击返回按钮
$('#btn_return').click(gobackUserList);
//点击保存/修改按钮
$('#btn_ok').click(commitUserForm);

//点击保存/修改按钮
function commitUserForm(){
	//if($('#editUserForm').valid()){   //用valid（），校验的文本框必须有name属性值
	
		var params = getFormParams();
		var userId = $('#container').data('userId');
		var userPwd = userId?$('#newPwd').val():$('#userPwd').val();
		params.password = userPwd;
		
		var url = 'saveUser.do';
		$.post(url,params,function(result){
			console.log(result)
			if(result.state=='SUCCESS'){
				alert('注册成功!');
				clearData();
				//window.location.href("apply_book.do"); //跳转到预定页面 ---》 报错
				document.location.href="apply_book.do";
			}else{
				alert(result);
			}
		})
		
		
		
		
		/*if(params=='nochoose'){
			alert('请选择用户角色！');
			return false;
		}*/
		
		
		/*
		var userId = $('#container').data('userId');
		var userPwd = userId?$('#newPwd').val():$('#userPwd').val();
		
		
		params.password = userPwd;
		params.id = userId;
		var url = userId?'user/updateUser.do':'user/saveUser.do';
		
		
		
		$.post(url,params,function(result){
			if(result.state==SUCCESS){
				alert('操作成功！');
				clearData();
				$('#container').load('user/listUI.do');
			}else{
				alert(result.message);
			}
		})*/
		
		
		
		
}

//获取表单参数
function getFormParams(){
	var userName = $('#userName').val();
	var mobile = $('#mobile').val();
	var params = {
		'name':userName,
		'phone':mobile,
	}
	return params;
}

//点击返回按钮
function gobackUserList(){
	clearData();
	$('#container').load('user/listUI.do');
}

//设置按钮文字
function setBtnVal(){
	var userId = $('#container').data('userId');
	if(userId){
		$('#btn_ok').val('修改');
		$('#editTitle').text('修改');
		findUserById(userId);   //根据id查询用户信息
	}else{
		$('#btn_ok').val('保存');
		$('#editTitle').text('新增');
		//加载所有角色
		//loadRoleList();
	}
}

//点击返回，保存，修改按钮，清除editForm数据
function clearData(){
	$('#editUserForm .dynamicClear').val('');
	$('#newPwdDiv').css('display','none');
	$('#roleList').empty();
	$('#container').data('userId','');
}