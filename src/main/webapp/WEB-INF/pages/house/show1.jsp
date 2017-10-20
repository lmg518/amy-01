<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri= "http://java.sun.com/jsp/jstl/core" prefix= "c" %> 
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" /> 
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<style type="text/css">
		#container{width:600px;height:500px;border:0px solid gray} 
	</style>
	
	<link rel="stylesheet" href="./css/common/show.css" />
</head>
<body>
简介：${houseinfo.title }
房东：${custPerson.name } 
01：${custPerson.headUrl } 
02：${houseinfo.imgUrl } 
	<!-- 图片，标题 -->
	<div class="content">
		<img src="${houseinfo.imgUrl }" />
		<p class="title">${houseinfo.houseType }</p>
		<br>
		
		<div class="head-img"><img src="${custPerson.headUrl }" /></div>
		<div class="readme">
			<span class="name">${custPerson.alias }</span>&nbsp&nbsp|&nbsp&nbsp<span class="expert">${custPerson.type }</span><br><br>
			<span>${custPerson.introduce }</span>
		</div>
	</div>
	
	<hr>
	<!-- 独立房间 -->
	<div class="room">
		<p class="p1">独立房间</p>
		<!-- 配置1 -->
		<div class="configuration1">
			<img class="room-img" src="images/show/tenant.jpg">
			<div class="count"><span>${houseinfo.roomSum }</span><span>位房客</span></div>
		</div>
		
		<!-- 配置2 -->
		<div class="configuration2">
			<img class="room-img" src="images/show/door.jpg">
			<div class="count"><span>${houseinfo.bedroomSum }</span><span>间卧室</span></div>
		</div>
		
		<!-- 配置3 -->
		<div class="configuration3">
			<img class="room-img" src="images/show/bed.jpg">
			<div class="count"><span>${houseinfo.bedSum }</span><span>张床</span></div>
		</div>
		
		<!-- 配置4 -->
		<div class="configuration4">
			<img class="room-img" src="images/show/bathtub.jpg">
			<div class="count"><span>${houseinfo.toiletSum }</span><span>卫</span></div>
		</div>
		
		<div class="configuration5">
		</div>
	</div><br>
	
	<hr>
	<!-- 房源介绍 -->
	<div class="house_introduced">
		<p class="p1">房源介绍</p>
		<p class="p2">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp${houseinfo.houseDescribe }</p>
	</div><br>
	
	<hr>
	<!-- 评论-->
	<div>
	<p class="p1">0人评论</p>
		<br><br><br><br><br><br>
	</div><br>
	
	<hr>
	<!-- 地图 -->
	
	<div>
		<p class="p1">地图区</p>
		<div id="container"></div>
	</div>
	
	<hr>
	<!-- 入住须知 -->
	<div class="notes">
		<p class="p2">&nbsp入住&nbsp&nbsp 15:00以后&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp退房&nbsp&nbsp&nbsp&nbsp 12:00</p>
		<hr>
			<div class="regulations">
				<div class="options"><span class="p1">&nbsp可供出租日历</span></div><img src="images/show/arrow.jpg"/>
			</div>
		<hr>
		
		<div class="regulations">
				<div class="options"><span class="p1">&nbsp额外费用</span></div><img src="images/show/arrow.jpg"/>
			</div>
		<hr>
		
		<div class="regulations">
				<div class="options"><span class="p1">《退订政策》</span></div><img src="images/show/arrow.jpg"/>
			</div>
		<hr>
		
		<div class="regulations">
				<div class="options"><span class="p1">《房屋守则》</span></div><img src="images/show/arrow.jpg"/>
		</div>
		<hr>
	</div>

	<!-- 联系房东预订 -->
	<div class="booking" onclick="location='apply_book.do'">
		<p>联系房东预订</p>
	</div>
	
	<br><br><br><br><br>
	
	
	
	
</body>


<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=jlMaC5VZmtj04AhDFc0ANun9R2yVxfMT">
		// v2.0版本的引用方式：src="http://api.map.baidu.com/api?v=2.0&ak=您的密钥"
		//v1.4版本及以前版本的引用方式：src="http://api.map.baidu.com/api?v=1.4&key=您的密钥&callback=initialize"
	</script>
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
</html>