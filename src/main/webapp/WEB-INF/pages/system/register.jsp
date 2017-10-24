<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<title>注册</title>
<link rel="stylesheet" href="${basePath}static/css/common.css">
<link rel="stylesheet" href="${basePath}css/user/register.css">
<link rel="stylesheet" href="${basePath}common/css/jquery-weui.css">
</head>
<body>
	<div class="common_tittle background_white">
		<a href="javascript:void(0);" class="history_a">
			<span class="left">返回</span>
		</a> <span class="tittle_con color_dark_grey">注册</span>
	</div>
	<div class="common_content_box">
		<div class="common_log_list font_size_14">
			<span class="common_log_list_left color_gray">手机号</span> <input
				type="text" placeholder="请输入您的手机号码" class="font_size_14" id="phoneNo" onblur="checkphone(phoneNo)" onkeyup="TheButtonIsVisableOrNot()">
		</div>
		<!-- <div class="common_log_list font_size_14">
			<span class="common_log_list_left color_gray">验证码</span> <input
				type="text" placeholder="请输入获取的验证码" class="font_size_14" id="verificationCode" onkeyup="TheButtonIsVisableOrNot()"> 
				<button onclick="getVerificationCode()" class="common_log_codes font_size_14 color_green" id="code">获取验证码</button>
		</div> -->
		<div class="common_log_list common_log_lists font_size_14">
			<span class="common_log_list_left color_gray">密码</span> <input
				type="password" placeholder="请输入6-16位密码" class="font_size_14 showPwd" id="password" onkeyup="TheButtonIsVisableOrNot()">
			<span class="common_visual"></span>
		</div>
		<div class="common_log_btn_box">
			<button class="color_green_btn" onclick="register()" id="register_btn">注册</button>
		</div>
	</div>
	<div class="login_box">
		<a href="loginPage.do" class="color_green font_size_16"> -----登录-----
		</a>
	</div>
</body>
<script src="${basePath}js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="${basePath}js/common/common.js?v=20170915174216"></script>
<script type="text/javascript" src="${basePath}js/system/register.js?v=20170915174216"></script>
<script type="text/javascript" src="${basePath}common/js/weui.min.js"></script>
</html>
