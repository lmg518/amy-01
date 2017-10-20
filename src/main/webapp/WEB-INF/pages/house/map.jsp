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
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=jlMaC5VZmtj04AhDFc0ANun9R2yVxfMT">
	//v2.0版本的引用方式：src="http://api.map.baidu.com/api?v=2.0&ak=您的密钥"
	//v1.4版本及以前版本的引用方式：src="http://api.map.baidu.com/api?v=1.4&key=您的密钥&callback=initialize"
</script>
</head>  
	<body>  
		<div id="container"></div> 
		<script type="text/javascript"> 
			var map = new BMap.Map("container");          // 创建地图实例
			var point = new BMap.Point(116.404, 39.915);  // 创建点坐标
			map.centerAndZoom(point, 15);                 // 初始化地图，设置中心点坐标和地图级别
			// map.addControl(new BMap.NavigationControl);//地图平移缩放控件
			map.addControl(new BMap.ScaleControl());//比例尺控件
			map.addControl(new BMap.OverviewMapControl()); //缩放地图控件
			map.addControl(new BMap.MapTypeControl()); //地图类型控件
			var opts = {type: BMAP_NAVIGATION_CONTROL_ZOOM}    
			map.addControl(new BMap.NavigationControl(opts));
			
			var marker = new BMap.Marker(point);        // 创建标注    
			map.addOverlay(marker);                     // 将标注添加到地图中
			//自定义控件调用方法
			// 创建控件实例    点击时放大2倍图片
			/* var myZoomCtrl = new ZoomControl();
			map.addControl(myZoomCtrl); */
			
			
			/* var traffic = new BMap.TrafficLayer();        // 创建交通流量图层实例      
			map.addTileLayer(traffic);                    // 将图层添加到地图上 */
			
			window.setTimeout(function(){  
			    map.panTo(new BMap.Point(116.409, 39.918));    
			}, 2000);
		</script>  
	</body>  
</html>