package cn.amy.common;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

public class ExceptionController {

	 /** 基于@ExceptionHandler异常处理 */  
	private static final Logger logger = LoggerFactory.getLogger(ExceptionController.class);
	
    @ExceptionHandler(value={Exception.class})  
    public @ResponseBody String exp(HttpServletRequest request, Exception ex) {  
        logger.error(request.getRequestURI()+"错误，异常信息：",ex);
        JSONObject json = new JSONObject();
        json.put("success", false);
		json.put("message", "服务异常，"+ex.getCause().getMessage());
        return json.toJSONString();
    }
}
