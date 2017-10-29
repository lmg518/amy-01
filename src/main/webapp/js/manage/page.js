$(document).ready(function() {
  
	//合并方法
	$('#pageId1').on('click','.pre1,.next1,.jump',jumpToPage);
	
	
	
	
//分页显示 2
//	$('#pageId1').on('click','.pre1',doPre);
//	$('#pageId1').on('click','.next1',doNext);
	
});

//显示分页信息的方法
function setPagination(pageObject){
	 //绑定总页数
	 $("#pageId1").data("pageCount",pageObject.pageCount);
	 //绑定当前页面
	 $("#pageId1").data("pageCurrent",pageObject.pageCurrent);
	 
	 $('#countNum1').html(pageObject.pageCount);
	 $('#currentPage1').html(pageObject.pageCurrent);
	 
	 console.log("22:"+pageObject.pageCurrent);
	 
	}

//跳转
function jumpToPage(){
	var c=$(this).attr("class");  //获取到当前元素class属性值
	
	//获取到当前页和总页数
	var pageCurrent=$('#pageId1').data("pageCurrent"); //当前页1
	var pageCount=$('#pageId1').data("pageCount");   //总页数2
	
	//console.log("11:"+pageCount);
	//console.log(c);
	if(c=='pre1' && pageCurrent>1){
		pageCurrent--;
	}
	
	if(c=='next1' && pageCurrent<pageCount){
		pageCurrent++;
	}
	
	if(c=='jump'){
		if($('#jumpNum').val()<=pageCount && $('#jumpNum').val()>0){
			pageCurrent=$('#jumpNum').val();
		}else if($('#jumpNum').val()<=0){
			pageCurrent=1;
			$('#jumpNum').val(1);
		}
		else{
			pageCurrent=pageCount;
			$('#jumpNum').val(pageCount);
		}
	}
	
	
	console.log("44:"+pageCurrent);
	
	//重写绑定pageCurrent的值,
	$('#pageId1').data("pageCurrent",pageCurrent);
	
	console.log("55:"+$('#pageId1').data("pageCurrent"));
	
	doGetObjects();
	
}








//上一页
function doPre(){
	if(currentPage>1){
		pageCurrent--;
	}
	doGetObjects();
}

//下一页
function doNext(){
	var pageCount=$('#pageId1').data("pageCount");  //总页数
	if(currentPage<pageCount){
		pageCurrent++;
	}
	doGetObjects();
}



























