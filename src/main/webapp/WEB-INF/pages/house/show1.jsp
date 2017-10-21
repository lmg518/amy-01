<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri= "http://java.sun.com/jsp/jstl/core" prefix= "c" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
    
	<!-- 设置页面不可缩放 user-scalable=no
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" /> 
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	 -->
	<style type="text/css">
		#container{width:600px;height:500px;border:0px solid gray} 
	</style>
	<script type="text/javascript" src="./js/jquery-1.11.1.js"></script>
	
	<link rel="stylesheet" href="./css/common/show.css" />
	
	<!--swiper插件-->
    <link rel="stylesheet" type="text/css" href="css/common/swiper-3.3.1.min.css" />
	<link rel="stylesheet" type="text/css" href="css/common/animate.min.css" />
	<c:set var="size" value="${fn:length(houseImages) -1 }"></c:set>
</head>
<body>
<%-- 
简介：${houseinfo.title }
房东：${custPerson.name } 
01：${custPerson.headUrl } 
02：${houseinfo.imgUrl }  
${houseinfo.longitude }
${houseinfo.latitude }
${houseImages[0].houseImageUrl }
${fn:length(houseImages)}  <!-- 获取集合的长度 -->
${size }
--%>


<!-- 图片展现 -->
	<div id="houseImages" style="display:none">
	      <div class="swiper-container swiper-banner">
			<div class="swiper-wrapper">
			
		    <div class="swiper-slide"><img class="i1" src="${houseImages[0].houseImageUrl }" />
			    <!-- 标题 -->
				<div class="houseImagesTitle">
					<p>${houseinfo.houseType }</p>
				</div>
				<hr><br><br>
				<!-- 单价/位置信息 -->
				<div class="houseImagesInfos">
					<span>${houseinfo.city }</span><span>/</span><span>${houseinfo.price }元</span>
				    <p>${houseinfo.address }</p>
				</div>
	       </div>
			 <!-- 从第二张图片开始遍历   c.count 获取到第几次 从1开始-->
			<c:forEach begin="1" end="${size }" varStatus="c">
			  <div class="swiper-slide"><img src="${houseImages[c.count].houseImageUrl }" /></div>
		    </c:forEach>
			
			
				
			<%--  <div class="swiper-slide"><img class="i1" src="images/houses/house02_1001.jpg" />
			    <!-- 标题 -->
				<div class="houseImagesTitle">
					<p>${houseinfo.houseType }</p>
				</div>
				<hr><br><br>
				<!-- 单价/位置信息 -->
				<div class="houseImagesInfos">
					<span>${houseinfo.city }</span><span>/</span><span>${houseinfo.price }元</span>
				    <p>${houseinfo.address }</p>
				</div>
			 </div>
			 <div class="swiper-slide"><img src="images/houses/house02_1002.jpg" /></div>
			 <div class="swiper-slide"><img src="images/houses/house02_1003.jpg" /></div>
			 <div class="swiper-slide"><img src="images/houses/house02_1004.jpg" /></div>
			 <div class="swiper-slide"><img src="images/houses/house02_1005.jpg" /></div>  --%>
			
			</div>
			<div class="swiper-pagination swiper-pagination1" class="swiper-pagination swiper-pagination-small" style="width:13.2rem;"></div>
		</div>
	</div>

<div id="otherInfo">
	<!-- 图片，标题 -->
	<div class="content">
		<input type="hidden" value=${houseinfo.houseInfoId } />
		<img id="houseImg" src="${houseinfo.imgUrl }" />
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
		<p class="p2">&nbsp入住&nbsp&nbsp 15:00以后&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp退房&nbsp&nbsp&nbsp&nbsp 12:00以前</p>
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
	<div class="apply_book_btn">
		<p>联系房东预订</p>
	</div>
	
</div>	
	
</body>
<!-- swipper插件 js需要放到下面包括show1.js -->
<script src="js/common/swiper-3.3.1.jquery.min.js"></script>
<script src="js/common/swiper.animate1.0.2.min.js"></script>
<script type="text/javascript" src="./js/show1.js"></script>

<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=jlMaC5VZmtj04AhDFc0ANun9R2yVxfMT">
		// v2.0版本的引用方式：src="http://api.map.baidu.com/api?v=2.0&ak=您的密钥"
		//v1.4版本及以前版本的引用方式：src="http://api.map.baidu.com/api?v=1.4&key=您的密钥&callback=initialize"
	</script>
	<script type="text/javascript"> 
		var map = new BMap.Map("container");          // 创建地图实例
		var point = new BMap.Point(${houseinfo.longitude },${houseinfo.latitude });  // 创建点坐标
		map.centerAndZoom(point, 15);                 // 将point移到浏览器中心，并且地图大小调整为20街道级;
		// map.addControl(new BMap.NavigationControl);//地图平移缩放控件
		map.addControl(new BMap.ScaleControl());//比例尺控件
		map.addControl(new BMap.OverviewMapControl()); //缩放地图控件
		map.addControl(new BMap.MapTypeControl()); //地图类型控件
		var opts = {type: BMAP_NAVIGATION_CONTROL_ZOOM}    
		map.addControl(new BMap.NavigationControl(opts));
		var marker = new BMap.Marker(point);        // 创建标注    
		map.addOverlay(marker);                     // 将标注添加到地图中
		
		//创建信息窗口
		var opts = {
		width : 30, // 信息窗口宽度
		height: 30, // 信息窗口高度
		title : "欢迎加入爱美叶" // 信息窗口标题
		}
		var infoWindow = new BMap.InfoWindow("${houseinfo.houseType }", opts); // 创建信息窗口对象
		map.openInfoWindow(infoWindow, map.getCenter()); // 打开信息窗口
		
		//自定义控件调用方法
		// 创建控件实例    点击时放大2倍图片
		/* var myZoomCtrl = new ZoomControl();
		map.addControl(myZoomCtrl); */
		/* var traffic = new BMap.TrafficLayer();        // 创建交通流量图层实例   
		map.addTileLayer(traffic);                    // 将图层添加到地图上   */
		window.setTimeout(function(){  
		    map.panTo(new BMap.Point(${houseinfo.longitude },${houseinfo.latitude }));    
		}, 1000); 
		
	</script>  
	
</html>