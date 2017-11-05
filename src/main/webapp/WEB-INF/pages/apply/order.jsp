<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
<link rel="stylesheet" href="./css/apply/order.css" />

<script type="text/javascript" src="./js/jquery-1.11.1.js"></script>
<script src="./js/order.js"></script>

</head>
<body>
	<h2>订单详情页面</h2>
	<div class="orderInfo">
		<div class="title">
		   <span>订单号:</span><span>${orderNum }</span>
		</div>
		
		<!-- <div class="orderPrice">
		   <span>订金:</span><span>￥288.00</span>
		</div> -->
			
		<div class="stayPrice">
			<span>住房押金:</span><span>￥${deposit }</span>
		</div>
		
		<div class="needPay">
		    <span>房费:</span><span>￥${priceSum }</span>
		</div>

		<div class="needPay">
		    <span>总共需支付:</span><span>￥${totalPrice }</span>
		</div>		
	</div>
	
	
	
	
	
	
	
	
	
	<div class="apply_book">
		<p>下一步：支付定金</p>
	</div>
	
	
	
	
	
	
</body>