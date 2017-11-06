<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri= "http://java.sun.com/jsp/jstl/core" prefix= "c" %> 
<c:set var="basePath" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>


<!-- -->
<script type="text/javascript" src="${basePath}/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${basePath}/jquery/jquery.validate.min.js"></script>
<script type="text/javascript" src="${basePath}/jquery/jquery.form.js"></script>
<link rel="stylesheet" href="${basePath}/common//bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="${basePath}/common/bootstrap/css/bootstrap-datepicker.min.css" />
<script type="text/javascript" src="${basePath}/common/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${basePath}/common/bootstrap/js/bootstrap-datepicker.min.js"></script>
 



<!-- 引入js文件 -->
<script type="text/javascript" src="${basePath}/js/manage/attachment.js"></script>
<script type="text/javascript" src="${basePath}/js/manage/house_list.js"></script>



</head>


 <!-- 表单 -->
	<div class="container">
	   <!-- 页面导航 -->
	   <div class="page-header">
			<div class="page-title" style="padding-bottom: 5px">
				<h3>Amy精品民宿后台管理</h3>
				<ol class="breadcrumb">
				  <li>房源信息管理</li>
				  <li>附件管理</li>
				  <li class="active">房源附件图片管理</li>
				</ol>
			</div>
			<div class="page-stats"></div>
		</div>
		<form method="post" id="uploadFormId" enctype="multipart/form-data">
		    <!-- 查询表单 -->
			<div class="row page-search">
			 <div class="col-md-12">
				<ul class="list-unstyled list-inline">
					<li>
						主页图片<input type="radio" name="type" value="Y" checked />
						图片集图片<input type="radio" name="type" value="N" />
					</li>
					<li><input type="hidden" id="houseInfoId" value=${houseinfo.houseInfoId }></li>
					<li><input type="file" name="file"></li>
					<li class='O1'><button type="button" class="btn btn-primary btn-upload" >上传</button></li>
				</ul>
			  </div>
			  
			</div>
			<!-- 列表显示内容 标题-->
			<div class="row col-md-12">
				<table class="table table-bordered">
					<thead>
						<tr>
						    <th>选择</th>
							<th>标题</th>
							<th>文件名</th>
							<th>文件类型</th>
							<th>操作</th>
						</tr>
					</thead>
					
					<!-- 数据区 
					<tbody id="tbody">
					</tbody>
					-->
					
				</table>
			</div>
		</form>
		
 </div>




</html>




   