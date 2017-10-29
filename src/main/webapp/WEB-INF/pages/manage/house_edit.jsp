<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
//初始化datepicker对象
$('.datepicker').datepicker({
    format: 'yyyy-mm-dd',
    autoclose: true//选中自动关闭
})
</script>
<form  class="form-horizontal" role="form" id="editFormId">


    <div class="form-group">
		<label for="titleID" class="col-sm-2 control-label" >房源标题:</label> 
	    <div class="col-sm-10">
			<input type="text" class="form-control required" name="title" id="titleId"  placeholder="请输入房源标题">
	    </div>
	</div>


	<div class="form-group">
		<label for="cityId" class="col-sm-2 control-label" >所在城市:</label> 
	    <div class="col-sm-10">
			<input type="text" class="form-control required" name="city" id="cityId"  placeholder="请输入房源名称">
	    </div>
	</div>
	
	
	<div class="form-group">
		<label for="project-code" class="col-sm-2 control-label">所在区:</label> 
		<div class="col-sm-10">
		<input type="text" class="form-control required" name="district" id="districtId" placeholder="请输入所在区">
		</div>
	</div>
	
	
	<!--
	<div class="form-group">
		<label for="project-code"  class="col-sm-2 control-label">开始时间:</label> 
		<div class="col-sm-10">
		<input type="text" class="form-control datepicker " name="code" id="beginDateId">
		</div>
	</div>
	 <div class="form-group">
		<label for="project-code" class="col-sm-2 control-label">结束时间:</label> 
		<div class="col-sm-10">
		<input type="text" class="form-control datepicker "  name="code" id="endDateId">
		</div>
	</div> -->
	
	
    
    
	
	
	
</form>
<c:url var="url" value="/js/manage/house_edit.js"></c:url>
<script type="text/javascript" src="${url}"></script>