<%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="basePath" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="0">
<title>艾美叶后台管理系统</title>

<link rel="stylesheet" href="${basePath}/common/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="${basePath}/common/bootstrap/css/bootstrap-datepicker.min.css" />
<link rel="stylesheet" href="${basePath}/static/css/font-awesome.min.css">
<link rel="stylesheet" href="${basePath}/static/plugins/ztree/css/metroStyle/metroStyle.css">
<link rel="stylesheet" href="${basePath}/common/bootstrap/css/bootstrap-table.min.css">
<link rel="stylesheet" href="${basePath}/static/css/main.css">
<link rel="stylesheet" href="${basePath}/static/plugins/treegrid/jquery.treegrid.css">

<script src="${basePath}/jquery/jquery-3.2.1.min.js"></script>
<script src="${basePath}/jquery/jquery.validate.min.js"></script>
<script src="${basePath}/jquery/jquery.form.js"></script>
<script src="${basePath}/common/bootstrap/js/bootstrap.min.js"></script>
<script src="${basePath}/common/bootstrap/js/bootstrap-datepicker.min.js"></script>
<script src="${basePath}/common/bootstrap/js/bootstrap-table.min.js"></script>
<script src="${basePath}/static/plugins/layer/layer.js"></script>
<script src="${basePath}/static/plugins/treegrid/jquery.treegrid.min.js"></script>
<script src="${basePath}/static/plugins/treegrid/jquery.treegrid.bootstrap3.js"></script>
<script src="${basePath}/static/plugins/treegrid/jquery.treegrid.extension.js"></script>
<script src="${basePath}/static/plugins/treegrid/tree.table.js"></script>
<script src="${basePath}/static/plugins/ztree/jquery.ztree.all.min.js"></script>

<!-- 地图样式 -->
<style type="text/css">
    #containerbaiDu{width:100%;height:100%;border:0px solid gray}
</style>


</head>
<body>
 <%@ include file="../common/menu.jsp" %>
 
   <!--百度地图--> 
 <div id="baidumap" style="display:none">
    <div id="r-result">请输入:<input type="text" id="suggestId" size="20" value="百度" style="width:150px;" />
    </div>
    <div id="searchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;"></div>
    <!-- <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
    </div> -->
 <div id="containerBaidu"></div>
	<!-- 引入百度地图 -->
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.3"></script>
	
	<!-- <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=jlMaC5VZmtj04AhDFc0ANun9R2yVxfMT">
		//v2.0版本的引用方式：src="http://api.map.baidu.com/api?v=2.0&ak=您的密钥"
		//v1.4版本及以前版本的引用方式：src="http://api.map.baidu.com/api?v=1.4&key=您的密钥&callback=initialize"
       </script> -->
 </div>
 
 
 
 
 
 
 
 
 <!--动态的设置内容的容器 -->
 <div id="container">
       
 </div>
 <!-- Modal(模态框) -->
 <div class="modal fade" id="modal-dialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body">
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary ok" >保存</button>
      </div>
    </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- modal -->
  
  
  <!-- Modal(模态框) -->
 <div class="modal fade" id="modal-dialog1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body">
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary ok" >保存</button>
      </div>
    </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- modal -->
  
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
						//$("#modal-dialog").css('display','block'); //显示模态框
						$('#modal-dialog').modal('show');     //显示模态框
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
 
<c:url var="url" value="/js/manage/house_edit.js"></c:url>
<script type="text/javascript" src="${url}"></script>
  
  
  
  
  
  
  
  
  
  
  
</body>
</html>





