// 自定义控件必须实现initialize方法，并且将控件的DOM元素返回   
// 在本方法中创建个div元素作为控件的容器，并将其添加到地图容器中   
ZoomControl.prototype.initialize = function(map){    
	// 创建一个DOM元素   
	var div = document.createElement("div");    
	// 添加文字说明    
	div.appendChild(document.createTextNode("放大2级"));    
	// 设置样式    
	div.style.cursor = "pointer";    
	div.style.border = "1px solid gray";    
	div.style.backgroundColor = "white";    
	// 绑定事件，点击一次放大两级    
	div.onclick = function(e){  
	map.zoomTo(map.getZoom() + 2);    
	}    
	// 添加DOM元素到地图中   
	map.getContainer().appendChild(div);    
	// 将DOM元素返回  
	return div;    
}

