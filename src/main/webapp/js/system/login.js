//用户登陆
function login() {
	var contextPath = getPath();
	var phoneNo = $("#phoneNo").val();
	var password = $("#password").val();
	if(!checkphone(phoneNo)){
		return false;
	}
	if(isNull(phoneNo)){
		common.alert("手机号不能为空");
		return false;
	}
	if(isNull(password)){
		common.alert("密码不能为空");
		return false;
	}
	if(!checkPassword(password)){//校验密码
		return false;
	}
	password=hashCode(password);
	weui.Loading.show();
	$.ajax({
		url : contextPath + '/login.do',
		type : "POST",
		data : {
			phoneNo : phoneNo,
			userName:phoneNo,
			password : password
		},
		dataType : 'json',
		success : function(data) {
			weui.Loading.hide();
			toLogin(data);
			if (data.success) {
				window.location.href="indexUI.do";
			} else {
				common.alert(data.message);
			}
		},
		error : ajaxError
	});
}
