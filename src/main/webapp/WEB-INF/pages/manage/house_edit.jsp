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



 
  <!-- 地图样式 -->
<style type="text/css">
    #containerbaiDu{width:100%;height:100%;border:0px solid gray} 
</style>
 <!--百度地图--> 
 <div id="baidumap">
    <div id="r-result">请输入:<input type="text" id="suggestId" size="20" value="百度" style="width:150px;" /></div>
       <div id="searchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;"></div>
	<div id="containerBaidu"></div>
	
	<!-- 引入百度地图 -->
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.3"></script>
	
	<!-- <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=jlMaC5VZmtj04AhDFc0ANun9R2yVxfMT">
		//v2.0版本的引用方式：src="http://api.map.baidu.com/api?v=2.0&ak=您的密钥"
		//v1.4版本及以前版本的引用方式：src="http://api.map.baidu.com/api?v=1.4&key=您的密钥&callback=initialize"
       </script> -->
    <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
       </div>
 </div>
  

<script type="text/javascript"> 

			// 百度地图API功能
			function G(id) {
				return document.getElementById(id);
			}
			var map = new BMap.Map("containerBaidu"); // 创建地图实例
		        map.centerAndZoom(new BMap.Point(113.630729, 34.73962), 11);
				var point = new BMap.Point(113.630729,34.73962);
		        map.centerAndZoom(point);
		        var geoc = new BMap.Geocoder();
		        map.enableScrollWheelZoom(true); //设置滚轮缩放
				map.enableContinuousZoom(); 
			var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
				{"input" : "suggestId"
				,"location" : map
			});
			
				
			ac.addEventListener("onhighlight", function(e) {  //鼠标放在下拉列表上的事件
			var str = "";
				var _value = e.fromitem.value;
				var value = "";
				if (e.fromitem.index > -1) {
					value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
				}    
				str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;
				
				value = "";
				if (e.toitem.index > -1) {
					_value = e.toitem.value;
					value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
				}    
				str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
				G("searchResultPanel").innerHTML = str;
			});

			var myValue;
			ac.addEventListener("onconfirm", function(e) {    //鼠标点击下拉列表后的事件
			var _value = e.item.value;
				myValue = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
				G("searchResultPanel").innerHTML ="onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;
				
				setPlace();
			});

			function setPlace(){
				map.clearOverlays();    //清除地图上所有覆盖物
				function myFun(){
					var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
					map.centerAndZoom(pp, 18);
					map.addOverlay(new BMap.Marker(pp));    //添加标注
				}
				var local = new BMap.LocalSearch(map, { //智能搜索
				  onSearchComplete: myFun
				});
				local.search(myValue);
			}

			map.onclick = function(e){
				var pt = e.point;
				geoc.getLocation(pt, function(rs){
		            var addComp = rs.addressComponents;
					var place = addComp.province + ", " + addComp.city + ", " + addComp.district + ", " + addComp.street;
		            if(confirm("当前选址："+place)){
						map.addEventListener("click");
						
						$('#longitudeId').val(e.point.lng);  //经度
						$("#latitudeId").val(e.point.lat);   //纬度
						$('#addressId').val(place);          //地址
						
						//$(".longGat").val( e.point.lat);
						$("#baidumap").css('display','none'); //隐藏地图
						$("#modal-dialog").css('display','block'); //显示模态框
						//$('#modal-dialog').modal('show');     //显示模态框
						$('#container').show();               //显示表格数据
						
						
						//$('#r-result').css('display','none')
						//$('#dStations').show();
						//$('#public_box').show();
		            }else{
						map.removeEventListener("click");
					};
				});	
			}
			
</script>  














