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
		<label for="titleID" class="col-sm-2 control-label" >房源ID:</label> 
	    <div class="col-sm-10">
			<input type="text" class="form-control required" name="houseInfoId" id="houseInfoIdID"  placeholder="请选择房源ID">
	    </div>
	</div>
	
   <div class="form-group">
		<label for="project-code"  class="col-sm-2 control-label">日期:</label> 
		<div class="col-sm-10">
		<input type="text" class="form-control datepicker " name="dateTime" id="dateTimeID" placeholder="请选择日期">
		</div>
	</div>
	
	<div class="form-group">
		<label for="titleID" class="col-sm-2 control-label" >价格:</label> 
	    <div class="col-sm-10">
			<input type="text" class="form-control required" name="price" id="priceID"  placeholder="请输入房源价格">
	    </div>
	</div>
	
	<div class="form-group">
		<label for="titleID" class="col-sm-2 control-label" >房间数量:</label> 
	    <div class="col-sm-10">
			<input type="text" class="form-control required" name="roomNum" id="roomNumID"  placeholder="请输入房源价格">
	    </div>
	</div>
	
	<div class="form-group">
		<label for="titleID" class="col-sm-2 control-label" >月份:</label>
	    <div class="col-sm-10">
			<input type="text" class="form-control required" name="month" id="monthID"  placeholder="请输入房源价格">
	    </div>
	</div>
	
	
</form>
<c:url var="url" value="/js/manage/calendar/calendar_edit.js"></c:url>
<script type="text/javascript" src="${url}"></script>









