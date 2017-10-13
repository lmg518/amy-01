<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="basePath" value="${pageContext.request.contextPath}"></c:set>


<link rel="stylesheet" href="${basePath}/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="${basePath}/bootstrap/css/bootstrap-datepicker.min.css" />
<link rel="stylesheet" href="${basePath}/static/css/font-awesome.min.css">
<link rel="stylesheet" href="${basePath}/static/plugins/ztree/css/metroStyle/metroStyle.css">
<link rel="stylesheet" href="${basePath}/bootstrap/css/bootstrap-table.min.css">
<link rel="stylesheet" href="${basePath}/static/css/main.css">
<link rel="stylesheet" href="${basePath}/static/plugins/treegrid/jquery.treegrid.css">

<script type="text/javascript" src="./js/jquery-1.11.1.js"></script>

<script src="${basePath}/bootstrap/js/bootstrap.min.js"></script>
<script src="${basePath}/bootstrap/js/bootstrap-datepicker.min.js"></script>
<script src="${basePath}/bootstrap/js/bootstrap-table.min.js"></script>


<div class="container" style="font-size:35px;">
	<div class="panel panel-default" >
		<div class="panel-heading" id="editTitle"></div>
		<div style="margin-left: -30px;">
		
			<form class="form-horizontal" id="editUserForm">
				<!-- 用户名 -->
				<div class="form-group" style="width:750px;">
					<div class="col-sm-2 control-label" style="width:250px;"><font color="red">*</font>用户名：</div>
					<div class="col-sm-10" style="width:400px;">
						<input type="text" name="userName" id="userName" placeholder="登录账号" class="form-control dynamicClear required" style="height:64px;font-size:30px;">
					</div>
				</div>
				
				<!-- 密码 -->
				<div class="form-group" style="width:750px;">
					<div class="col-sm-2 control-label" style="width:250px;"><font color="red">*</font>密码：</div>
					<div class="col-sm-10" style="width:400px;">
						<input type="password" name="userPwd" id="userPwd" placeholder="密码" class="form-control dynamicClear required" style="height:64px;font-size:30px;">
					</div>
				</div>
				
				<!--新密码 -->
				<div class="form-group" id="newPwdDiv" style="display:none;width:750px;">
					<div class="col-sm-2 control-label" style="width:250px;"><font color="red">*</font>新密码：</div>
					<div class="col-sm-10">
						<input type="password" name="newPwd" id="newPwd" placeholder="新密码" class="form-control dynamicClear required" style="height:64px;font-size:30px;">
					</div>
				</div>
				
				<!-- 电话 -->
				<div class="form-group" style="width:750px;">
					<div class="col-sm-2 control-label" style="width:250px;"><font color="red">*</font>手机号：</div>
					<div class="col-sm-10" style="width:400px;">
						<input type="text" name="mobile" id="mobile" placeholder="手机号" class="form-control dynamicClear required" style="height:64px;font-size:30px;">
					</div>
				</div>
				
				
				<div class="form-group" style="width:300px;margin-left:200px;margin-top:30px;" >
					<input type="button" value="保存" class="btn btn-primary" id="btn_ok" style="height:64px;font-size:30px;">
					&nbsp;&nbsp;
					<input type="button" value="返回" class="btn btn-warning" id="btn_return" style="height:64px;font-size:30px;">
				</div>
				
				
				
				
				
				
				
				<!-- 
				<div class="form-group">
					<div class="col-sm-2 control-label"><font color="red">*</font>手机号：</div>
					<div class="col-sm-10">
						<input type="text" name="mobile" id="mobile" placeholder="手机号" class="form-control dynamicClear required">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-2 control-label"><font color="red">*</font>密码：</div>
					<div class="col-sm-10">
						<input type="password" name="userPwd" id="userPwd" placeholder="密码" class="form-control dynamicClear required">
					</div>
				</div>
				<div class="form-group" id="newPwdDiv" style="display:none">
					<div class="col-sm-2 control-label"><font color="red">*</font>新密码：</div>
					<div class="col-sm-10">
						<input type="password" name="newPwd" id="newPwd" placeholder="新密码" class="form-control dynamicClear required">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-2 control-label">邮箱：</div>
					<div class="col-sm-10">
						<input type="text" id="email" placeholder="邮箱" class="form-control dynamicClear">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-2 control-label">角色：</div>
					<div class="col-sm-10">
						<label id="roleList" class="checkbox-inline"></label>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-2 control-label"></div>
					<input type="button" value="保存" class="btn btn-primary" id="btn_ok">
					&nbsp;&nbsp;
					<input type="button" value="返回" class="btn btn-warning" id="btn_return">
				</div>
				
				
				 -->
				
			</form>
		</div>
	</div>
</div>
<script type="text/javascript" src="${basePath}/js/system/user_edit.js"></script>