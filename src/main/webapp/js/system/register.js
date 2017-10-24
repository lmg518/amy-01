var countdown=60;//60秒倒计时的设置
var downTimer;//60秒倒计时的设置
var mark="";//注册时是否需要姓名以及身份证号的标志
$(document).ready(function(){
	TheButtonIsVisableOrNot();
})

//用户注册
function register() {
	var contextPath = getPath();
	var phoneNo = $("#phoneNo").val();
	var password = $("#password").val();
	console.log("phoneNo",phoneNo,"password",password);
	/*var reg=/^[\u2E80-\u9FFF]+$/;//Unicode编码中的汉字范围
	if(!reg.test(name)&&mark=='yes'){
		common.alert("姓名只能输入汉字");
		return false;
	}*/
	if(!checkphone(phoneNo)){
		return false;
	}
	if(password.length<6||password.length>16){
		common.alert("请输入6-16位密码");
		return false;
	}
	password=hashCode(password);
	weui.Loading.show();
	$.ajax({
		url : contextPath + '/register.do',
		type : "POST",
		data : {
			userName : phoneNo,
			password : password
		},
		dataType : 'json',
		success : function(data) {
			weui.Loading.hide();
			debugger
			toLogin(data);
			if (data.success) {
				window.location.href = "indexUI.do";
			} else {
				common.alert(data.message);
			}
		},
		error : ajaxError
	});
}

//注册按钮是否可按
function TheButtonIsVisableOrNot(){
	var phoneNo = $("#phoneNo").val();
	//var verificationCode = $("#verificationCode").val();
	var password = $("#password").val();
	if(phoneNo!=""&&password!=""){
		$("#register_btn").removeAttr("disabled");
		$("#register_btn").removeClass("active");
	}else if(phoneNo!=""&&password!=""){
		$("#register_btn").removeAttr("disabled");
		$("#register_btn").removeClass("active");
	}else{
		$("#register_btn").attr({"disabled":"disabled"});
		$("#register_btn").addClass("active");
	}
}
//
