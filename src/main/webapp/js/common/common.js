/*footer*/
$(".footer_content>a").click(function(){
	$(".footer_content>a").removeClass("active");
	$(this).toggleClass("active");
});
$(".common_visual").click(function(){
	$(this).toggleClass("active");
	if($(".common_visual").hasClass('active')){
       $(".showPwd").prop('type','text');
   	}else{
       $(".showPwd").prop('type','password');
   	};
});
$(".history_a").click(function(){
	history.go(-1);
})
//提示信息
alerts();
function alerts(){
	 var alertHtml = '<div class="error_message_box">';
    	alertHtml += '<p class="error_message font_size_14"></p>';
    	alertHtml += '</div>';
    $("body").append($(alertHtml));
}
confirms();
function confirms(){
	var confirmHtml = '<div class="common_modal">'
		+ '<div class="common_modal_dialog">'
		+ '<div class="modal_dialog_tittle color_dark_green"></div>'
		+ '<div class="modal_dialog_content padding_x_20">'
		+ '<p class="font_size_14 color_dark_grey margin_bottom_10">林琳</p>'
		+ '<div class="modal_btn_box">'
		+ '<a href="javascript:;" class="color_orange_btn left common_modal_btn default">取消</a>'
		+ '<a href="javascript:;" class="color_green_lit_btn right common_modal_btn primary">确定</a>'
		+ '</div>' + '</div>';
		$("body").append($(confirmHtml));
}
var common = {
	/**弹框提示信息*/
    alert : function(msg) {
    	$(".error_message_box").show();
        $(".error_message").html(msg);
        $('.error_message_box').delay(5000).hide(0);
   },
   /**按钮显示颜色，并且可点击*/
   showColor:function(id){
	   $("#"+id).attr({"disabled":"disabled"});
	   $("#"+id).addClass("active"); 
   },
   /**按钮显示灰色，并且不可点击*/
   hideColor:function(id){
	   $("#"+id).removeAttr("disabled");
	   $("#"+id).removeClass("active");
   },
   confirm : function(title,msg,callback) {
		var common_confirm = $(".common_modal");
		common_confirm.show();
		common_confirm.find(".modal_dialog_tittle").text(
				title = (title ? title : "确认提示"));
		common_confirm.find(".modal_dialog_content p").html(msg);
		common_confirm.find('.primary').off("click").on('click', function() {
			common_confirm.hide();
			if (callback) {
				callback(true);
			}
		});
		common_confirm.find('.default').off("click").on('click', function() {
			common_confirm.hide();
			if (callback) {
				callback(false);
			}
		});
	}
};
/*判断是否为 ios微信浏览器*/
if(isWeiXin()){ 
	$(".common_tittle").addClass("active");
	$(".common_content_box").css("margin-top","24px");
	$(".loan_apply_content").css("margin-top","0px");
	$(".loan_detail_box").css("margin-top","0px");
	$(".common_progress").css("top","0px");
	$(".data_list_box").css("margin-top","110px");
}
function isAndroid(){
	var ua = window.navigator.userAgent;
	if(ua.indexOf('Android') > -1 || ua.indexOf('Adr') > -1){
		return true;
	}else{
		return false;
	}
}
function isWeiXin(){ 
	var ua = window.navigator.userAgent; 
	if(ua.indexOf('MicroMessenger') > -1&& !!ua.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/)){ 
		return true;
	}else{ 
		return false; 
	}
} 
//制保留2位小数，如：2，会在2后面补上00.即2.00          

function toDecimal(x) {
var f = parseFloat(x);      
if (isNaN(f)) {   
 return false;     
}          
var f = Math.round(x*100)/100;  
var s = f.toString();       
var rs = s.indexOf('.');      
if (rs < 0) {   
 rs = s.length;      
 s += '.';   
            }       
while (s.length <= rs + 2) {   
 s += '0';       
}            
return s;   
}          
//获取路径的方式不能直接引入common.js来实现。目录结构不一致
function getPath(){
	var curWwwPath=window.document.location.href;  
	//获取主机地址之后的目录，如： uimcardprj/share/meun.jsp 
	var pathName=window.document.location.pathname;  
	var pos=curWwwPath.indexOf(pathName);  
	//获取主机地址，如： http://localhost:8083  
	var localhostPaht=curWwwPath.substring(0,pos);
	//获取带"/"的项目名，如：/uimcardprj  
	var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1); 
	var contextPath=localhostPaht+projectName;
	if(curWwwPath.substr(0,4)=="http"){
		//这部分是以http://为开头的处理
		return  contextPath;
	}else{
		return "https://mls.xinyonghome.com/mls-web";
	}
	//return  contextPath;
}
//校验手机号
function checkphone(phoneNo) {
	var phoneNo = $("#phoneNo").val();
	if (phoneNo == "" || undefined == phoneNo) {
		common.alert("手机号不能为空");
		return false;
	} else {
		if (!(/^1(3|4|5|7|8)\d{9}$/.test(phoneNo))) {
			common.alert("手机号格式错误");
			return false;
		}else{
			return true;
		}
	}
}
//将数字转换为每三位以逗号分隔
function formatNum(strNum) {
	if (strNum.length <= 3) {
		return strNum;
	}
	if (!/^(\+|-)?(\d+)(\.\d+)?$/.test(strNum)) {
		return strNum;
	}
	var a = RegExp.$1, b = RegExp.$2, c = RegExp.$3;
	var re = new RegExp();
	re.compile("(\\d)(\\d{3})(,|$)");
	while (re.test(b)) {
		b = b.replace(re, "$1,$2$3");
	}
	return a + "" + b + "" + c;
}
//60秒倒计时
function downShow(){
	if (countdown == 0) { 
		$("#code").removeAttr("disabled");
		$(".common_log_codes").remove("active");
		$("#code").removeClass("active");
		$("#code").html("再次获取验证码");
		return;
	}else { 
		$("#code").html(countdown);
		countdown--; 
		$("#code").attr("disabled",true);
		$(".common_log_codes").addClass("active");
	} 
}
//获取页面请求参数
function getrequest(name){
     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
     var r = window.location.search.substr(1).match(reg);
     if(r!=null)return  unescape(r[2]); return null;
}
//去掉字符串中所有的空格	
function trim(str) {
	return str.replace(/(^\s+)|(\s+$)/g, "");
}
var ajaxError = function(jqXHR, textStatus, errorThrown) {
	weui.Loading.hide();
	var contextPath=getPath();
	if (textStatus == "timeout") {
		common.alert("加载超时，请重试");
	}else if("</div></body></html>" === removeAllSpace(jqXHR.responseText).substr(removeAllSpace(jqXHR.responseText).length-20)){ //判断用户是否登录 没登陆跳转到登陆页面
		//window.location.href = contextPath+"/user/login.html";
		common.alert(textStatus + ":" + errorThrown);
	} else if(textStatus == "error") {
		common.alert("网络开小差了");
	}else if(textStatus == "parsererror" && errorThrown.message == "Unexpected token < in JSON at position 0") {
		//window.location.href = contextPath+"/user/login.html";
		common.alert("返回json格式错误");
	} else {
		common.alert(textStatus + ":" + errorThrown);
	}
}
var ajaxError1 = function(jqXHR, textStatus, errorThrown) {
	weui.Loading.hide();
	var contextPath=getPath();
	if (textStatus == "timeout") {
		common.alert("加载超时，请重试");
	}else if("</div></body></html>" === removeAllSpace(jqXHR.responseText).substr(removeAllSpace(jqXHR.responseText).length-20)){ //判断用户是否登录 没登陆跳转到登陆页面
		/*window.location.href = contextPath+"/user/login.html";*/
		common.alert(textStatus + ":" + errorThrown);
	} else if(textStatus == "error") {
		common.alert("网络开小差了");
	} else {
		common.alert(textStatus + ":" + errorThrown);
	}
}

function toLogin(data){
	var contextPath=getPath();
	if("NO_LOGIN_NO" == data.login){
		window.location.href = contextPath+"/user/login.html";
	}
	var str = Object.prototype.toString.call(data) === "[object String]";//判断该字符是否为字符串
	if(str && "</div></body></html>" === removeAllSpace(data).substr(removeAllSpace(data).length-20)){ //判断用户是否登录 没登陆跳转到登陆页面
		/*window.location.href = contextPath+"/user/login.html";*/
		common.alert(textStatus + ":" + errorThrown);
	}
}

var ajaxComplete = function() {
	console.log('结束')
}
var ajaxComplete1 = function() {
	console.log('结束')
}
var ajaxBeforeSend = function(xhr) {
	console.log(xhr)
	console.log('发送前')
}

/**
 * 去掉字符串中所有空格
 * @param str
 * @returns
 */
function removeAllSpace(str) {
	return str.replace(/\s+/g, "");
}
/**
 * 去掉双引号
 * @param str
 * @returns
 */
var str = "adb";
function removeQuote(str){
	var reg = new RegExp('"',"g");  
	str = str.replace(new RegExp('"',"g"), "");  
	console.log(str);
	return str;
}

/**
获取用户登录信息
*/
var sysName = "";
function loadSysName(){
	$.ajax({
			url:contextPath+'/productController/loadSysName.do',
		type:'GET', //GET
		data:{},
		//dataType:'json',    //返回的数据格式：json/xml/html/script/jsonp/text
		success:function(data,textStatus,jqXHR){
			//common.alert(data);
			sysName = data;
			
		},
		error:ajaxError,
	})
}


/**
 * 从写toFixed方法
 * @param d
 * @returns
 */
Number.prototype.toFixed = function(d){
    var s = this+"";
    if(!d)d=0;
    console.log(d);
    if(s.indexOf(".")==-1)
    	s+=".";
    	s+=new Array(d+1).join("0");
    if (new RegExp("^(-|\\+)?(\\d+(\\.\\d{0,"+ (d+1) +"})?)\\d*$").test(s)){
		var s="0"+ RegExp.$2, pm=RegExp.$1, a=RegExp.$3.length, b=true;
		if (a==d+2){
			a=s.match(/\d/g); 
			if (parseInt(a[a.length-1])>4){
				for(var i=a.length-2; i>=0; i--) {
					a[i] = parseInt(a[i])+1;
					if(a[i]==10){
						a[i]=0; b=i!=1;
					} else 
						break;
				}
			}
			s=a.join("").replace(new RegExp("(\\d+)(\\d{"+d+"})\\d$"),"$1.$2");
		}
		if(b)s=s.substr(1);
		console.log(d,(pm+s).replace(/\.$/, ""));
		return (pm+s).replace(/\.$/, "");
	} 
    return this+"";
};  






/**创建一个解析JSON的对象，获取Key和value值*/
function Json(key, value) { 
	this.key = key; 
	this.value = value; 
	//this.array = new Array(key, value); 
} 

Json.prototype.showKey = function() { 
	//common.alert(this.key); 
} 

Json.prototype.showValue = function() { 
	//common.alert(this.value); 
} 

Json.prototype.showArray = function() { 
	//common.alert(this.array); 
} 

//强制格式化两位小数	
function changeTwoDecimal_f(x) {
  var f_x = parseFloat(x);
  if (isNaN(f_x)) {
      return '';
  }
  var f_x = Math.round(x * 100) / 100;
  var s_x = f_x.toString();
  var pos_decimal = s_x.indexOf('.');
  if (pos_decimal < 0) {
      pos_decimal = s_x.length;
      s_x += '.';
  }
  while (s_x.length <= pos_decimal + 2) {
      s_x += '0';
  }
  return s_x;
}
//日期格式化
Date.prototype.format = function(format)
{
/*
* format="yyyy-MM-dd hh:mm:ss";
*/
var o = {
"M+" : this.getMonth() + 1,
"d+" : this.getDate(),
"h+" : this.getHours(),
"m+" : this.getMinutes(),
"s+" : this.getSeconds(),
"q+" : Math.floor((this.getMonth() + 3) / 3),
"S" : this.getMilliseconds()
}

if (/(y+)/.test(format))
{
format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4
- RegExp.$1.length));
}

for (var k in o)
{
if (new RegExp("(" + k + ")").test(format))
{
format = format.replace(RegExp.$1, RegExp.$1.length == 1
? o[k]
: ("00" + o[k]).substr(("" + o[k]).length));
}
}
return format;
}
/**
 * 信息规范验证类
 * gongliang
 * 2017.8.23
 */
var verify = {
	//邮箱验证
	isEmail : function(value){
		var reg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
		if (!reg.test(value)) {
			return false;
		}
		return true;
	},
	//汉字验证
	isChinese : function(value){
		var reg = /^[\u4e00-\u9fa5]+$/;
		if (!reg.test(value)) {
			return false;
		}
		return true;
	},
	//汉字或者字母或者两者都有
	isChineseAndChar : function(value){
		var reg = /^[\u4e00-\u9fa5|a-zA-Z]+$/;
		if (!reg.test(value)) {
			return false;
		}
		return true;
	},
	//汉字或者字母或者两者都有
	isChineseAndNum : function(value){
		var reg = /^[\u4e00-\u9fa5|\d]+$/;
		if (!reg.test(value)) {
			return false;
		}
		return true;
	},
	//是否为数字
	isNum : function(value){
		var reg = /^\d+$/;
		if (!reg.test(value)) {
			return false;
		}
		return true;
	},
	//是否为数字或者字母
	isNumAndChar : function(value){
		var reg = /^[0-9|a-zA-z]+$/;
		if (!reg.test(value)) {
			return false;
		}
		return true;
	},
	//是否为数字或者字母或者汉字
	isNumAndCharAndChinese : function(value){
		var reg = /^[\u4e00-\u9fa5|\d|a-zA-z]+$/;
		if (!reg.test(value)) {
			return false;
		}
		return true;
	},
	checkphone : function (phoneNo) {
		if (phoneNo == "" || undefined == phoneNo) {
			common.alert("手机号不能为空");
			return false;
		} else {
			if (!(/^1(3|4|5|7|8)\d{9}$/.test(phoneNo))) {
//				common.alert("手机号格式错误");
				return false;
			}else{
				return true;
			}
		}
	},
	checkTelePhone : function(telephone){
		var reg = /^(0\d{2,3}-\d{7,8})(-\d{1,4})?$/;
		if (!reg.test(telephone)) {
			return false;
		}
		return true;
	},
	idCheckFunction : function (IDCard) {
		
		if(IDCard == ""){
			return false;
		}    	
		
		var num = IDCard.toUpperCase();           //身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X。         
		if (!(/(^\d{15}$)|(^\d{17}([0-9]|X)$)/.test(num))) {      
			//alert('输入的身份证号长度不对，或者号码不符合规定！\n15位号码应全为数字，18位号码末位可以为数字或X。');               
			return false;          
		}   
		//验证前2位，城市符合  
		var aCity={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江 ",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外"};  
		if(aCity[parseInt(num.substr(0,2))]==null){  
			return false;  
		}  
		//alert('城市:'+aCity[parseInt(num.substr(0,2))]);  
		
		//下面分别分析出生日期和校验位  
		var len, re; len = num.length;   
		if (len == 15) {  
			re = new RegExp(/^(\d{6})(\d{2})(\d{2})(\d{2})(\d{3})$/);  
			var arrSplit = num.match(re);  //检查生日日期是否正确  
			var dtmBirth = new Date('19' + arrSplit[2] + '/' + arrSplit[3] + '/' + arrSplit[4]);  
			var bGoodDay; bGoodDay = (dtmBirth.getYear() == Number(arrSplit[2])) && ((dtmBirth.getMonth() + 1) == Number(arrSplit[3])) && (dtmBirth.getDate() == Number(arrSplit[4]));  
			if (!bGoodDay) {          
				return false;  
			} else { //将15位身份证转成18位 //校验位按照ISO 7064:1983.MOD 11-2的规定生成，X可以认为是数字10。         
				var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2);          
				var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2');       
				var nTemp = 0, i;             
				num = num.substr(0, 6) + '19' + num.substr(6, num.length - 6);            
				for(i = 0; i < 17; i ++) {                  
					nTemp += num.substr(i, 1) * arrInt[i];         
				}  
				num += arrCh[nTemp % 11];  
				return true;  
			}  
		}  
		if (len == 18) {  
			re = new RegExp(/^(\d{6})(\d{4})(\d{2})(\d{2})(\d{3})([0-9]|X)$/);  
			var arrSplit = num.match(re);  //检查生日日期是否正确  
			var dtmBirth = new Date(arrSplit[2] + "/" + arrSplit[3] + "/" + arrSplit[4]);  
			var bGoodDay; bGoodDay = (dtmBirth.getFullYear() == Number(arrSplit[2])) && ((dtmBirth.getMonth() + 1) == Number(arrSplit[3])) && (dtmBirth.getDate() == Number(arrSplit[4]));  
			if (!bGoodDay) {  
				return false;  
			}  
			else { //检验18位身份证的校验码是否正确。 //校验位按照ISO 7064:1983.MOD 11-2的规定生成，X可以认为是数字10。  
				var valnum;  
				var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2);  
				var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2');  
				var nTemp = 0, i;  
				for(i = 0; i < 17; i ++) {  
					nTemp += num.substr(i, 1) * arrInt[i];  
				}  
				valnum = arrCh[nTemp % 11];  
				if (valnum != num.substr(17, 1)) {  
					return false;  
				}  
				return true;  
			}  
		} 
		return true; 
	}
	
};
/**
 * 去掉数组中的重复记录
 * @param arr
 * @returns
 */
function unique(arr) {
    var result = [], hash = {};
    for (var i = 0, elem; (elem = arr[i]) != null; i++) {
        if (!hash[elem]) {
            result.push(elem);
            hash[elem] = true;
        }
    }
    return result;
}
/**
 * 密码校验
 * @param psw
 * @returns
 */
function checkPassword(password){
	if (password.indexOf(" ") != -1) {
		common.alert("密码不能输入空格");
		return false;
	}else if(password.length<6||password.length>16){
		common.alert("请输入6-16位密码");
		return false;
	}else if(!/[\x00-\xff]+/g.test(password)){
		common.alert("密码请输入英文字母或者数字或者标点符号");
		return false;
	}else{
		return true;
	}
}
/**
 * 判断是否非空
 * @param str
 * @returns
 */
function isNull(str){  
    return str == null || str.value == "";  
}  
  
/** 
 * java String hashCode 的实现 
 * @param strKey 
 * @return intValue 
 */  
function hashCode(strKey)  
{  
    var hash = 0;  
    if(!isNull(strKey))  
    {  
        for (var i = 0; i < strKey.length; i++)  
        {  
            hash = hash * 31 + strKey.charCodeAt(i);  
            hash = intValue(hash);  
        }  
    }  
    return hash;  
}  

/** 
 * 将js页面的number类型转换为java的int类型 
 * @param num 
 * @return intValue 
 */  
function intValue(num)  
{  
    var MAX_VALUE = 0x7fffffff;  
    var MIN_VALUE = -0x80000000;  
    if(num > MAX_VALUE || num < MIN_VALUE)  
    {  
        return num &= 0xFFFFFFFF;  
    }  
    return num;  
}  