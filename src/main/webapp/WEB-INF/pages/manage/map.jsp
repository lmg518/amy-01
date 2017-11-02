<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>  
<html>  
<head>  
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />  
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />  
<title>Hello, World</title>  
<style type="text/css">  
	html{height:100%}  
	body{height:100%;margin:0px;padding:0px}  
	#container{height:100%}  
</style>  

</head>  
	<body>  
		
		<div id="r-result">请输入:<input type="text" id="suggestId" size="20" value="百度" style="width:150px;" /></div>
        <div id="searchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;"></div>
		<div id="container"></div> 
		<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=jlMaC5VZmtj04AhDFc0ANun9R2yVxfMT">
			//v2.0版本的引用方式：src="http://api.map.baidu.com/api?v=2.0&ak=您的密钥"
			//v1.4版本及以前版本的引用方式：src="http://api.map.baidu.com/api?v=1.4&key=您的密钥&callback=initialize"
       </script>
	    <div class="modal-footer">
           <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        </div>
		
		<script type="text/javascript"> 
			// 百度地图API功能
			function G(id) {
				return document.getElementById(id);
			}
			var map = new BMap.Map("container"); // 创建地图实例
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
						$('.location').val(place);
						$(".longLat").val(e.point.lng);
						$(".longGat").val( e.point.lat);
						$("#allmap").css('display','none');
						$('#r-result').css('display','none')
						$('#dStations').show();
						$('#public_box').show();
		            }else{
						map.removeEventListener("click");
					};
				});	
			}
			
			
			
			
		</script>  
	</body>  
</html>