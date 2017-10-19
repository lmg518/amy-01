<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri= "http://java.sun.com/jsp/jstl/core" prefix= "c" %> 
<c:set var="basePath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Amy精品民宿</title>

<link rel="stylesheet" href="${basePath}/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="${basePath}/bootstrap/css/bootstrap-datepicker.min.css" />
<link rel="stylesheet" href="${basePath}/static/css/font-awesome.min.css">
<link rel="stylesheet" href="${basePath}/static/plugins/ztree/css/metroStyle/metroStyle.css">
<link rel="stylesheet" href="${basePath}/bootstrap/css/bootstrap-table.min.css">
<link rel="stylesheet" href="${basePath}/static/css/main.css">
<link rel="stylesheet" href="${basePath}/static/plugins/treegrid/jquery.treegrid.css">

<script type="text/javascript" src="./js/jquery-1.11.1.js"></script>

<script src="${basePath}/bootstrap/js/bootstrap.min.js"></script>
<script src="${basePath}/bootstrap/js/bootstrap-datepicker.min.js"></script>
<script src="${basePath}/bootstrap/js/bootstrap-table.min.js"></script>

<script src="${basePath}/static/plugins/layer/layer.js"></script>
<script src="${basePath}/static/plugins/treegrid/jquery.treegrid.min.js"></script>
<script src="${basePath}/static/plugins/treegrid/jquery.treegrid.bootstrap3.js"></script>
<script src="${basePath}/static/plugins/treegrid/jquery.treegrid.extension.js"></script>
<script src="${basePath}/static/plugins/treegrid/tree.table.js"></script>
<script src="${basePath}/static/plugins/ztree/jquery.ztree.all.min.js"></script>


<script type="text/javascript" src="./js/common/index.js"></script>
<link rel="stylesheet" href="./css/common/index.css" />

<!--swiper插件-->
<link rel="stylesheet" type="text/css" href="css/common/swiper-3.3.1.min.css" />
<link rel="stylesheet" type="text/css" href="css/common/animate.min.css" />



</head>
<body>
	<!-- 搜索模块 -->
	<div id="search">
		<div class="search s1 address_select_box">
			<img src="./images/common/location.png" /><span>任何房源</span>
		</div><br>
		<div class="search s1" onclick="location='choose_date.do'">
			<img src="./images/common/date.png" /><span>任何时间</span>
		</div><br>
		<div class="search s1" onclick="location='guest.do'">
			<img src="./images/common/persons.png" /><span>1位</span>
		</div><br>
	
	</div>
	
	
	<!-- 热门活动 -->
	<div id="activity">
		<span class="title">Amy热门活动</span><br><br>
		<div class="swiper-container swiper-banner">
			<div class="swiper-wrapper">
				<c:forEach items="${hotActivitys }" var="hotActivity">
					<div class="swiper-slide"><img src="${hotActivity.hotActivityImageUrl }" /></div>
				</c:forEach>
				<!-- <div class="swiper-slide"><img src="images/activity/activity01.jpg" /></div>
				<div class="swiper-slide"><img src="images/activity/activity02.jpg" /></div>
				<div class="swiper-slide"><img src="images/activity/activity03.jpg" /></div> -->
			</div>
			<div class="swiper-pagination swiper-pagination1" class="swiper-pagination swiper-pagination-small" style="width:13.2rem;"></div>
		</div>
	</div>
	<br>
	
	<!-- 探索城市 -->
	<div id="citys">
		<span class="title">热搜城市</span><br><br>
		<c:forEach items="${hotCitys }" var="hc">
			<%-- <dd>${hc.provinceName }</dd> --%>
			<img class="city_jpg1" src="${hc.addressImageUrl}" />
		</c:forEach>
		<!-- <img class="city_jpg1" src="images/citys/city01.jpg" />
		<img class="city_jpg1" src="images/citys/city02.jpg" />
		<img class="city_jpg1" src="images/citys/city03.jpg" /> -->
	</div>
	
	<!-- 发现最美的家 -->
	<div id="amy_houses"><br>
		<p class="title">发现最美的家</p>
		<c:forEach items="${houseInfos }" var="houseInfo">
			<div class="img_url"><input value="${houseInfo.houseInfoId }" /><img src="${houseInfo.imgUrl }" /></div><br>
			<p class="presentation">${houseInfo.title }</p>
			<div class="content">
				<div class="city"><span>${houseInfo.province }</span></div>
				<div class="account"><span>我是旅游达人Helen，欢迎回家</span></div>
				<div class="account2"></div>
			</div><br>
		</c:forEach>
		<!-- 房源1 -->
		<!-- <div><img onclick="location='show1.do'" src="images/houses/house01.jpg" /></div><br>
		<p class="presentation">#小院#被院子围起来的小天地</p>
		<div class="content">
			<div class="city"><span>北京</span></div>
			<div class="account"><span>我是旅游达人Helen，欢迎回家</span></div>
			<div class="account2"></div>
		</div><br>
		
		房源2
		<div><img src="images/houses/house02.jpg" /></div><br>
		<p class="presentation">#小院#被院子围起来的小天地</p>
		<div class="content">
			<div class="city"><span>上海</span></div>
			<div class="account"><span>我是旅游达人Helen，欢迎回家</span></div>
			<div class="account2"></div>
		</div><br>
		
		房源3
		<div><img src="images/houses/house03.jpg" /></div><br>
		<p class="presentation">#小院#被院子围起来的小天地</p>
		<div class="content">
			<div class="city"><span>郑州</span></div>
			<div class="account"><span>我是旅游达人Helen，欢迎回家</span></div>
			<div class="account2"></div>
		</div><br> -->
	</div>
	
	
	
	
	<br><br><p></p>&nbsp<p></p><p></p><p></p>
	<div><br>&nbsp&nbsp&nbsp<br><br></div>
	
	
	
 
</body>
<script src="js/common/jquery.js"></script>
<script src="js/common/swiper-3.3.1.jquery.min.js"></script>
<script src="js/common/swiper.animate1.0.2.min.js"></script>
<script src="js/common/index.js"></script>

</html>