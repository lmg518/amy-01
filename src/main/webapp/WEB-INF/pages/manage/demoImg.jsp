<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri= "http://java.sun.com/jsp/jstl/core" prefix= "c" %> 
<c:set var="basePath" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
<script type="text/javascript" src="${basePath}/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${basePath}/jquery/jquery.validate.min.js"></script>
<script type="text/javascript" src="${basePath}/jquery/jquery.form.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	
	//$(".upload").click(upload);
	
	
	
})

function upload(){
	$("#tf").ajaxSubmit({
		type:'post',
		url:"fileUpload.do",
		dataType:'json',
	});
}



</script>

</head>
<body>
      <!-- <form id="userForm" method="post" action="./fileUpload.do" enctype="multipart/form-data" class="bl-form bl-formhor fl">
      <input type="file" name="upload"> <input type="submit"
			value="提交">
     </form> -->
     
     
     <form id="tf" method="post" action="fileUpload.do" enctype="multipart/form-data">
            <input type="file" name="img"/>
            <input type="text" name="name"/>
            <input type="submit" class="upload" value="上传"/>
     </form>
     



</body>

 



</html>




   