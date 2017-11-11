<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri= "http://java.sun.com/jsp/jstl/core" prefix= "c" %> 
<c:set var="basePath" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>

<link rel="stylesheet" href="${basePath}/common/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="${basePath}/common/bootstrap/css/bootstrap-table.min.css">


<!-- 引入分页的js -->
<script type="text/javascript" src="${basePath}/js/manage/page.js"></script>
 
<!-- 引入js文件 -->
<script type="text/javascript" src="${basePath}/js/manage/calendar/calendar_list.js"></script>
<script type="text/javascript" src="${basePath}/js/manage/calendar/calendar_edit.js"></script>
<!-- 表格样式 -->
<style>
	#thead,#tbody tr,th{
		text-align:center;
	}
	#thead tr{
		background-color:gray;
	}
	#tbody a{
		font-size:13px;
		/* border:1px solid red; */
		width:46px;
		height:28px;
	}
</style>

</head>

<body>

 <!-- 表单 -->
	<div class="container">
	   <!-- 页面导航 -->
	   <div class="page-header">
			<div class="page-title" style="padding-bottom: 5px">
				<h3>Amy精品民宿后台管理</h3>
				<ol class="breadcrumb">
				  <li>房源管理</li>
				  <li>房源信息管理</li>
				  <li class="active">房源价格管理</li>
				</ol>
			</div>
			<div class="page-stats"></div>
		</div>
		
		<form method="post" id="queryFormId">
		    <!-- 查询表单 -->
			<div class="row page-search">
			 <div class="col-md-12">
				<ul class="list-unstyled list-inline">
					<li><input type="text" id="searchNameId" class="form-control"placeholder="团名称"></li>
					<li><select id="selectProjectId" class="form-control">
							<option value="">选择项目</option>
					</select></li>
					<li class='O1'><button type="button" class="btn btn-primary btn-search" >查询</button></li>
					<li class='O2'><button type="button" class="btn btn-primary btn-add">添加</button></li>
					
					<!-- <li class='O3'><button type="button" class="btn btn-primary btn-invalid">禁用</button></li>
					<li class='O4'><button type="button" class="btn btn-primary btn-valid">启用</button></li> -->
				</ul>
			  </div>
			</div>
			<!-- 列表显示内容 -->
			<div class="row col-md-12">
				<table style="font-size:12px;" class="table table-bordered table-hover">
					<thead id="thead">
						<tr>
						    <th>选择</th>
						    <th>房源ID</th>
							<th>日期</th>
							<th>价格</th>
							<th>房间数量</th>
							<th>月份</th>
							<th>状态</th>
							<th>操作</th>
						</tr>
					</thead>
					
					<!-- 数据区 -->
					<tbody id="tbody">
					
					
					</tbody>
				</table>
				
				<!-- 引入分页的jsp文件 -->
				<%@include file="../common/page.jsp" %>
				
			</div>
		</form>
 </div>

</body>



</html>




   