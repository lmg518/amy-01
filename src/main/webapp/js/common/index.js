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
var contextPath = getPath();

//swiper初始化 轮播图片
var banner = new Swiper('.swiper-banner', {
	pagination: '.swiper-pagination1',
	loop : true,
	autoplay:1000,
	//pagination : '#swiper-pagination1',
});

$(document).ready(function(){
	//弹出注册页面  使用bootstrap
	$('#queryFormId').on("click",".btn-add",showEditDialog);
	loadHouseInfo();
	
	$(".img_url").click(showHouseInfo); //图片添加点击事件
})

//跳转到show页面将id 传过去
function showHouseInfo(){
	var house_info_id=$(this).children().first()[0].value; //获取房源id
	console.log(house_info_id);
	document.location.href="showHouseInfo.do?house_info_id="+house_info_id;
}

function showEditDialog(){
	//var url="project/editUil.do"
	var url="editUil.do"
		
	var title;	
	if($(this).hasClass("btn-update")){
		title="修改项目"
		//将id 绑定到 打开的模态框上
		$("#modal-dialog").data("id",$(this).parent().parent().data("id"));
	}
	if($(this).hasClass("btn-add")){
		title="添加项目"
	}
		
	$('#modal-dialog .modal-title').html(title);  //更改标题名
	
	$('#modal-dialog .modal-body').load(url,function(){
		$('#modal-dialog').modal('show');
	});
}

/**
 * 查询房源信息
 */
function loadHouseInfo(){
	var province = $("#province").val();//省份
	var createTime = $("#createTime").val();//时间
	var predictSum = $("#predictSum").val();//数量
	var data = {
			province:province,
			//createTime:createTime,
			//predictSum:predictSum
	};
	$.ajax({
		url : contextPath + '/indexUI.do',
		type : "GET",
		data : data,
		dataType : 'json',
		success : function(data) {
			console.log("houseInfo",data);
		},
		error : function(){
			
		}
	});
	
	
}