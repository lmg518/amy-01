//选择日期时隐藏日历
function f1(){
	$(".price-calendar-bounding-box .content-box").show();
	$(".price-calendar-bounding-box .bottom").show();
	$(".button").show();
	//其他信息隐藏
	$("#title1").hide();
	$(".staty_num").hide();
	$("#title2").hide();
	$(".travel_plan").hide();
	$(".apply_book").hide();
	$(".userInfo").hide();
}

//
function getParams(){
	var rdoValue = $('.staty_num .staty-info').find(':radio:checked').val(); //获取入住人数
	var begin_date=$('.go_time .J_Count').html();//开始日期
	var end_date=$('.leave_time .J_Count').html();//结束日期
	//获取用户信息
	var userName=$('.userInfo .userName').val();
	var IDNum=$('.userInfo .IDNum').val();
	//房源id
	var house_info_id=$('.introduction input').val();
	debugger
	if(rdoValue == undefined || rdoValue == ""){
		alert("请选择入住人数");
		return;
	}
	if(begin_date == "开始日期" && end_date == "结束日期"){
		alert("请选择开始日期和结束日期");
		return;
	}
	if(userName == "" || userName == undefined || userName == null){
		
		alert("请输入真实姓名");
		return;
	}
	if(IDNum == "" || IDNum == undefined || IDNum == null){
		alert("请输入身份证号");
		return;
	}
	var params={
			'stay_num':rdoValue,
			'begin_date':begin_date,
			'end_date':end_date,
			'userName':userName,
			'IDNum':IDNum,
			'house_info_id':house_info_id
	}
	console.log(params);
	return params;
}


//申请预订
function order(){
	var url="apply_booking.do";
	var params=getParams();
	$.post(url,params,function(result){
		document.location.href="order.do";  //转到订单详情页面
	});
}




/*--------------------------------------------------------*/
//var root = 'http://fgm.cc/learn/calendar/price-calendar/';
var root = './js/price-calendar/';
var config = {
	modules: {
		'price-calendar': {
			fullpath: root + 'price-calendar.js',
			type    : 'js',
			requires: ['price-calendar-css']
		},
		'price-calendar-css': {
			fullpath: root + 'price-calendar.css',
			type    : 'css'
		}
	}
};


YUI(config).use('price-calendar', 'jsonp', function(Y) {
	var sub  = Y.Lang.sub;
	var url = 'findHouseById.do?minDate={mindate}&maxDate={maxdate}&house_info_id={house_info_id}&callback={callback}';
	//价格日历实例
	var oCal = new Y.PriceCalendar();
	//点击确定按钮
	oCal.on('confirm', function() {
			//alert('入住时间：' + this.get('depDate') + '\n离店时间：' + this.get('endDate'));
			//赋值到页面上
			$('.go_time .J_Count').html( this.get('depDate'))
			$('.leave_time .J_Count').html( this.get('endDate'))
			console.log("开始日期：",this.get('depDate'));
			console.log("结束日期：",this.get('endDate'));
			$(".price-calendar-bounding-box .content-box").hide();
			$(".price-calendar-bounding-box .bottom").hide();
			$(".button").hide();
			$("#title1").show();
			$(".staty_num").show();
			$("#title2").show();
			$(".travel_plan").show();
			$(".apply_book").show();
			$(".userInfo").show();
	});
	
	//点击取消按钮
	oCal.on('cancel', function() {
		this.set('depDate', '').set('endDate', '').render();
		//隐藏日历
		$(".price-calendar-bounding-box .content-box").hide();
		$(".price-calendar-bounding-box .bottom").hide();
		$(".button").hide();
		//其他信息显示
		$("#title1").show();
		$(".staty_num").show();
		$("#title2").show();
		$(".travel_plan").show();
		$(".apply_book").show();
		$(".userInfo").show();
	});
	
	Y.one('#J_Example').delegate('click', function(e) {
		var that    = this,
		oTarget = e.currentTarget;
		switch(true) {
			//设置日历显示个数
			case oTarget.hasClass('J_Count'):
				this.set('count', oTarget.getAttribute('data-value')).render();
			break;
			//时间范围限定
			case oTarget.hasClass('J_Limit'):
				this.set('data', null)
				.set('depDate', '')
				.set('endDate', '')
				.set('minDate', '')
				.set('afterDays', oTarget.getAttribute('data-limit'));
				if(!oTarget.hasAttribute('data-date')) {
					this.set('date', new Date())
				}else {
					var oDate = oTarget.getAttribute('data-date');
					this.set('minDate', oDate);
					this.set('date', oDate);
				}
				oTarget.ancestor().one('.J_RoomStatus') ?
				oTarget.ancestor().one('.J_RoomStatus').setContent('\u663e\u793a\u623f\u6001').removeClass('J_Show') :
				oTarget.ancestor().append('<button style="height:80px;font-size:30px;" class="J_RoomStatus">\u663e\u793a\u623f\u6001</button>');
				break;
			//异步拉取酒店数据
			case oTarget.hasClass('J_RoomStatus'):
				oTarget.toggleClass ('J_Show');
				if(oTarget.hasClass('J_Show')){
					Y.jsonp(
							sub(url, {
								mindate:this.get('minDate'),
								maxdate:this.get('maxDate'),
								house_info_id:$('.introduction input').val()
							}),
							{
								on: {
									success: function(data) {
										that.set('data', data);
										oTarget.setContent('\u9690\u85cf\u623f\u6001');   //显示房态
										console.log("显示房价",data);
								   }
								}
							}
					);
				}else {
					this.set('data', null);
					oTarget.setContent('\u663e\u793a\u623f\u6001');  //隐藏房态
				}
				break;
		}
	}, 'button', oCal);
});


