package cn.amy.util;

//封装结果集 的类 包括错误的信息
public class JsonResult {
	public static final int SUCCESS=1;
	public static final int ERROR=0;
	
	
	
	private int state; //返回结果的状态值
	private String message;
	private Object data;  //封装结果集
	
	
	public JsonResult() {
		this.state=SUCCESS; //结果集状态值默认是1
		this.message="OK";
	}
	//构造方法重载  data用于封装 dao查询的结果集
	public JsonResult(Object data) {
		this();
		this.data=data;
	}
	
	
	
	
	//错误的结果信息
	public JsonResult(Throwable e){
		this.state=ERROR;
		this.message=e.getMessage();
	}
	

	public String getMessage() {
		return message;
	}

	public int getState() {
		return state;
	}

	public Object getData() {
		return data;
	}
	
	@Override
	public String toString() {
		return "JsonResult [state=" + state + ", message=" + message + ", data=" + data + "]";
	}

	
	
	
	
	
	

}
