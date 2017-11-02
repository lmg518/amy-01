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
<script type="text/javascript" src="${basePath}/js/manage/house_list.js"></script>
<script type="text/javascript" src="${basePath}/js/manage/house_edit.js"></script>
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
				  <li class="active">添加房源信息</li>
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
				<table style="font-size:15px;" class="table table-bordered table-hover">
					<thead>
						<tr>
						    <th style="width:50px;">选择</th>
						    <th>标题</th>
							<th style="width:50px;">城市</th>
							<th style="width:80px;">所在区</th>
							<th>经度</th>
							<th>纬度</th>
							<th>地址</th>
							<th>房源类型</th>
							<th>房源介绍</th>
							<th>房客数量</th>
							<th>卧室数量</th>
							<th style="width:50px;">床数量</th>
							<th style="width:70px;">卫生间数量</th>
							<th style="width:140px;">操作</th>
						</tr>
					</thead>
					
					<!-- 数据区 -->
					<tbody id="tbody">
					
					
					</tbody>
				</table>
				
				<!-- 引入分页的jsp文件 -->
				<%@include file="../manage/page.jsp" %>
				
			</div>
		</form>
 </div>

</body>



</html>




   