function $(id){
	return document.getElementById(id);
}


function $F(id){
	return $(id).value;
}


function getAjax(){
	
	 var xhr=null;
	 if(window.XMLHttpRequest){
	    //非ie
	    xhr=new XMLHttpRequest();

		}else{
		//ie浏览器
		xhr=new ActiveXObject('MicroSoft.XMLHttp');	
		}
		return xhr;
	}