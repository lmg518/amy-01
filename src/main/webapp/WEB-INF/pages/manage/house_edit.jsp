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
		<label for="provinceId" class="col-sm-2 control-label" >省份:</label> 
	    <div class="col-sm-10">
			<input type="text" class="form-control required" name="province" id="provinceId"  placeholder="请输入省份">
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
	
	<div class="form-group">
		<label for="project-code" class="col-sm-2 control-label">经度:</label> 
		<div class="col-sm-10">
		<input type="text" class="form-control required" name="longitude" id="longitudeId" >
		</div>
	</div>
	<div class="form-group">
		<label for="project-code" class="col-sm-2 control-label">纬度:</label> 
		<div class="col-sm-10">
		<input type="text" class="form-control required" name="latitude" id="latitudeId" >
		</div>
	</div>
	
	<div class="form-group">
		<label for="project-code" class="col-sm-2 control-label">地址:</label> 
		<ul class="list-unstyled list-inline">
			<li class='O1'>
				<div class="col-sm-10">
					<input type="text" class="form-control required" name="address" id="addressId" style="width:360px;">
				</div>
			</li>
			<li class='O2'><button type="button" class="btn btn-primary map" id="baiduMap" style="float:left">地图</button></li>
		</ul>
		
		
		
	</div>
	
	<div class="form-group">
		<label for="project-code" class="col-sm-2 control-label">房源类型:</label> 
		<div class="col-sm-10">
		<input type="text" class="form-control required" name="houseType" id="houseTypeId" placeholder="请输入房源类型">
		</div>
	</div>
	
	<div class="form-group">
		<label for="project-code" class="col-sm-2 control-label">房源介绍:</label> 
		<div class="col-sm-10">
		<!-- <input type="text" class="form-control required" name="houseDescribe" id="houseDescribeId" placeholder="请输入房源介绍"> -->
		<textarea rows="3" cols="62" id="houseDescribeId" placeholder="请输入房源介绍"></textarea>
		
		</div>
	</div>
	
	<div class="form-group">
		<label for="project-code" class="col-sm-2 control-label">房客数量:</label> 
		<div class="col-sm-10">
		<input type="text" class="form-control required" name="roomSum" id="roomSumId" placeholder="请输入可入住房客人数">
		</div>
	</div>
	
	<div class="form-group">
		<label for="project-code" class="col-sm-2 control-label">卧室数量:</label> 
		<div class="col-sm-10">
		<input type="text" class="form-control required" name="bedroomSum" id="bedroomSumId" placeholder="请输入卧室数量">
		</div>
	</div>
	
	<div class="form-group">
		<label for="project-code" class="col-sm-2 control-label">床数量:</label> 
		<div class="col-sm-10">
		<input type="text" class="form-control required" name="bedSum" id="bedSumId" placeholder="请输入床数量">
		</div>
	</div>
	
	<div class="form-group">
		<label for="project-code" class="col-sm-2 control-label">卫生间数量:</label> 
		<div class="col-sm-10">
		<input type="text" class="form-control required" name="toiletSum" id="toiletSumId" placeholder="请输入卫生间数量">
		</div>
	</div>
	
</form>
<c:url var="url" value="/js/manage/house_edit.js"></c:url>
<script type="text/javascript" src="${url}"></script>









