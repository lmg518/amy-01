<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri= "http://java.sun.com/jsp/jstl/core" prefix= "c" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript" src="./js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="./js/show1.js"></script>
<link rel="stylesheet" href="./css/common/show.css" />

</head>
<body>
<%-- 简介：${houseinfo.title }
房东：${custPerson.name } 
01：${custPerson.headUrl } 
02：${houseinfo.imgUrl }  --%>
	<!-- 图片，标题 -->
	<div class="content">
		<input value=${houseinfo.houseInfoId } />
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
		<br><br><br><br><br><br>
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
	
	
</body>
</html>