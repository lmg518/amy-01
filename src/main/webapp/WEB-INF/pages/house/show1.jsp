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
		<!-- <hr>
			<div class="regulations">
				<div class="options"><span class="p1">&nbsp可供出租日历</span></div><img src="images/show/arrow.jpg"/>
			</div> 
		<hr>
		<div class="regulations">
				<div class="options"><span class="p1">&nbsp额外费用</span></div><img src="images/show/arrow.jpg"/>
			</div>-->
			
		<hr>
		<div class="regulations" onclick="showPolicy();">
				<div class="options"><span class="p1">《退订政策》</span></div><img src="images/show/arrow.jpg"/>
			</div>
		<hr>
		
		<div class="regulations" onclick="showfacilityCode();">
				<div class="options"><span class="p1">《房屋守则》</span></div><img src="images/show/arrow.jpg"/>
		</div>
		<hr>
	</div>

	<!-- 联系房东预订 -->
	<div class="apply_book_btn">
		<p>联系房东预订</p>
	</div>
	
</div>

<!-- 附件资料 -->
<div id="policyInfo" style="display:none">
<h1>《Amy民宿续、退房政策》</h1>
<h3>那么正式取消预订24小时后的未住宿天数的住宿费用将全额退款。</h3>
<h2>续订政策</h2>
<p>如果房客已入住但决定持续续租，那么必须至少提前24小时在线预定。</p>

<h2>针对续、退房争议处理</h2>
<p class="importance">如果房客针对本人入住民宿期间，住宿退款存有异议，请于24小时内联系我司客服中心处理协商解决。</p>
<p class="importance">客服中心电话：15836011700房客需在取消确认页面上点击取消按钮才能正式取消预订。</p>
<p class="importance">请您关注“Amy艾美叶公众号”进行操作。</p>

<h2>全额住宿费用退款</h2>
<p>房客必须在入住日期当天的入住时间（以15:00为准）前24小时取消预订。例如，如果入住日期是周五，则需在该周周四的入住时间15:00之前取消预订。</p>


<h2>退还70%住宿费用</h2>
<p>如果房客在入住前一天23:00前取消预订，首晚房费将退还70%。</p>

<h2>退还50%住宿费用</h2>
<p>如果房客在入住当天09:00前取消预订，首晚房费将退还50%。</p>

<h2>退还清洁费</h2>
<p>如果房客在入住前取消的预订可以退还清洁费。</p>

<h2>退还未入住天数住宿费用</h2>
<p>如果房客已入住但决定提前退房</p>

<div class="removeButton">
	<img src="images/common/remove.png" onclick="hidePolicy();"/>
</div>
</div>

<!-- 民宿守则 -->
<div id="facilityCode" style="display:none">
<h1>《Amy民宿守则》</h1>
<h2>欢迎入住Amy艾美叶精品民宿</h2>
<h3>承租房屋使用者简称房客。为保证房客在租住期间的正常使用和安全，特提出如下要求：</h3>
<p>1、遵守国家法律法规，禁止入住期间从事色情、聚赌等违法行为。</P>
<p>2、处理好邻里关系，禁止大声喧哗。</p>
<p>3、个人防火：吸烟后烟蒂完全熄灭后放入加水的烟灰缸中，杜绝酒后、床上吸烟；严禁使用除空调、供暖管道以外的取暖电器。</p>
<p>4、防触电：不乱拉电线，正确使用电器。本房屋为三相供电，照明插座为一路火线，空调单独一路火线。如更换灯具需全部断电，以免发生意外。</p>
<p>5、人员在露台上不得向楼下、邻居露台抛扔烟蒂、垃圾、酒瓶、饮料瓶。</p>
<p>6、人员离开室内做到人走灯灭、关停空调节约用电，房客不得以出得起电费为由，无人时长期不关灯，不关空调，我司有权在多次提醒无效时罚款，金额以每次每台空调100元（仅指不关的空调）。</p>
<p>7、入住期间，室内卫生及时打扫，禁止携带宠物，垃圾倒入小区物业指定地点。</p>
<p>8、爱护房屋和物品，卫生干净！做饭后厨具要清洗，摆放整齐到位。垃圾食品及时清理出门，免得产生异味，影响室内环境</p>
<p>9、一定不要在床上吃油性食物，免得弄脏床单被子清洗不掉</p>
<p>10、出门要关掉开着的灯，电视，空调等，节约能源，延长使用寿命，门一定要确保关上，锁上。</p>
<p>11、请不要将手纸向马桶内丢，避免造成马桶堵塞，给您生活带来不必要的麻烦</p>
<p>12、使用中如发生水电故障，及时联系Amy客服中心处理。</p>
<p>13、防盗：室内尽量不放现金和贵重物品，人走锁好大门；</p>
<p>14、在客户入住期间，经与客户本人协商，我司有权查看房屋使用情况。</p>
<h2>为了更好服务，请仔细阅读以下内容</h2>
<p class="importance">①请准备多于两人身份证，配合工作人员进行入住登记！</p>
<p class="importance">②入住期间，有需要请与入住房屋房管主任联系。</p>
<p class="importance">24h客服电话:15836011700</p>


	<div class="removeButton">
		<img src="images/common/remove.png" onclick="hidefacilityCode();"/>
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