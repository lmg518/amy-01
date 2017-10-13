<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
<link rel="stylesheet" href="./css/apply_book.css" />

<script type="text/javascript" src="./js/jquery-1.11.1.js"></script>
<script src="./js/price-calendar/yui-min.js"></script>
<script src="./js/apply_book.js"></script>


<!-- <script type="text/javascript">
function f1(){
	$(".price-calendar-bounding-box .content-box").show();
	$(".price-calendar-bounding-box .bottom").show();
	$(".button").show();
	
	$("#title1").hide();
	$(".staty_num").hide();
	$("#title2").hide();
	$(".travel_plan").hide();
	$(".apply_book").hide();
}
function f2(){
	var rdoValue = $('.staty_num .btn-corner').find(':radio:checked').val();
	console.log(rdoValue);
}
</script> -->



<!-- 日历组件 -->
<style>
body{padding:0;margin:0 10px;}
.title{padding:0;margin:10px 0;font:700 18px/1.5 \5fae\8f6f\96c5\9ed1;}
.title em{font-style:normal;color:#C00;font-size:14px;}
.title a{font:400 14px/1.5 Tahoma;}
.example{margin-top:10px;}
.example button{margin:0 5px 10px 0;}



</style>



</head>
<body>
	<!-- 房源简介 -->
	<div class="introduction">
	    <img src="images/houses/house01.jpg" />
		 <div class="span1">
		     <span>Lovelife布艺设计师的家room...艺设计师的家</span><br>
		 	 <p>3间卧室.1个卫生间.2张床</p>
		 </div>
	</div>
	
	
	
	<!-- 日历 -->
	<div id="J_Example" class="example">
		
		
	<!-- 旅行时间 -->
	 <p id="title">旅行时间</p>
	<div class="travel_time">
		 <div class="go_time">
			 <p class="p1">入住</p>
			 <button class="J_Count" data-value="2" style="height:80px;font-size:30px;border:0;background-color:white;" onclick="f1()">选择日期</button>
		 </div>
		 <img src="images/common/line.jpg"/>
		  <div class="leave_time">
			 <p class="p1">离开</p>
			 <button class="J_Count" data-value="2" style="height:80px;font-size:30px;border:0;background-color:white;" onclick="f1()">选择日期</button>
		 </div>
	</div>	
		
		<br>
		<div class="button" style="display:none;">
			<button class="J_Limit" data-limit="7" style="height:80px;font-size:30px;">限定范围（今天->90天）</button>
			<button class="J_Limit" data-limit="7" data-date="2017-10-1" style="height:80px;font-size:30px;">指定日历时间（2012年10月1号->60天）</button>
        </div>
		
		
	</div>
	
	
	
	
	
	
	
	<!-- 入住人数 -->
	 <p id="title1">入住人数</p>
	<div class="staty_num">
		<label class="btn-corner">
			<input type="radio" name="value" value="1">1
		    <input type="radio" name="value" value="2">2
		    <input type="radio" name="value" value="3">3
		    <input type="radio" name="value" value="4">4
		</label>
	</div>
	
	<!-- 旅行计划 -->
	 <p id="title2">旅行计划</p>
	<div class="travel_plan">
		<input type="text" placeholder="简单介绍一下自己和您的旅行" />
	</div>
	
	<!-- 申请预订 -->
	<div class="apply_book">
		<p onclick="apply_booking();">申请预订</p>
	</div>
	
	
	<hr>
	<h1 onclick="location='editUserUI.do'">注册</h1>
	

</body>