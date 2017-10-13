<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri= "http://java.sun.com/jsp/jstl/core" prefix= "c" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="./css/common/show.css" />

</head>
<body>
	<!-- 图片，标题 -->
	<div class="content">
		<img src="images/houses/house01.jpg" />
		<p class="title">北京四合院 天安门&故宫天安门东地铁站景山公园 后海</p>
		<br>
		
		<div class="head-img"><img src="images/show/head-img.jpg"></div>
		<div class="readme">
			<span class="name">Helen</span>&nbsp&nbsp|&nbsp&nbsp<span class="expert">旅游达人</span><br><br>
			<span>我喜欢交朋友，经常喜欢来一场说走就走的旅行，我喜欢自然，喜欢设计，喜欢...</span>
		</div>
	</div>
	
	<hr>
	<!-- 独立房间 -->
	<div class="room">
		<p class="p1">独立房间</p>
		<!-- 配置1 -->
		<div class="configuration1">
			<img class="room-img" src="images/show/tenant.jpg">
			<div class="count"><span>1位房客</span></div>
		</div>
		
		<!-- 配置2 -->
		<div class="configuration2">
			<img class="room-img" src="images/show/door.jpg">
			<div class="count"><span>1间卧室</span></div>
		</div>
		
		<!-- 配置3 -->
		<div class="configuration3">
			<img class="room-img" src="images/show/bed.jpg">
			<div class="count"><span>1张床</span></div>
		</div>
		
		<!-- 配置4 -->
		<div class="configuration4">
			<img class="room-img" src="images/show/bathtub.jpg">
			<div class="count"><span>1卫</span></div>
		</div>
		
		<div class="configuration5">
		</div>
	</div><br>
	
	<hr>
	<!-- 房源介绍 -->
	<div class="house_introduced">
		<p class="p1">房源介绍</p>
		<p class="p2">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp大黄蜂建卡后的空间发哈监督和反差的烦恼就是快递放假啊了才能使大脑产生的</p>
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
		<br><br><br><br><br><br>
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
</html>