package cn.amy.filter;

import java.io.IOException;
import java.util.StringTokenizer;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.fastjson.JSONObject;


/**
 * 安全过滤器
 * @author hgs
 *
 */
public class SecurityFilter implements Filter {
	private String loginURL;
	private String unfilteredURIs;
	private static final Logger logger = LoggerFactory.getLogger(SecurityFilter.class);
	/**
	 * 在web.xml中的filter初始化参数配置
	 * <init-param>
	 * 		<param-name>loginRole</param-name>
	 *		<param-value></param-value>
	 * </init-param>
	 * 
	 * 值=*，只要loginRole有值就可以通过
	 * 值=？，只有session中的loginRole匹配才能通过
	 */
	private String loginRole;
	
	public static boolean loaded = false;
	
	//标示符：表示当前用户未登录
    String NO_LOGIN_NO = "NO_LOGIN_NO";

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest hrequest = (HttpServletRequest) request;
		HttpServletResponse hresponse = (HttpServletResponse) response;
		String requestURI = hrequest.getRequestURI();
		logger.info("过滤器过滤的URL为：{}",requestURI);
		logger.info("-----------url----"+"http://"+hrequest.getServerName()+":"+hrequest.getServerPort()+hrequest.getContextPath() + loginURL);
		if (requestURI.matches(unfilteredURIs)) {
			chain.doFilter(request, response);
			return;
		}
		
		HttpSession cs = (HttpSession) hrequest.getSession(true);
		String sessionLoginRole = null;
		if (cs != null) {
			sessionLoginRole = (String) cs.getAttribute("consoleRole"); 
		}
		if (requestURI.matches(unfilteredURIs)) {
			requestURI = requestURI.toLowerCase();
			if (requestURI.endsWith(".gif") || requestURI.endsWith(".jpeg") || requestURI.endsWith(".png")
					|| requestURI.endsWith(".css")) {
				hresponse.setHeader("Cache-Control", "max-age=3600");
			}
			chain.doFilter(request, response);
			return;
		}
		if (cs != null && sessionLoginRole != null && (sessionLoginRole.equals(loginRole)||loginRole.equals("*"))) {
			chain.doFilter(request, response);

			hresponse.setHeader("Pragma", "no-cache");
			hresponse.setHeader("Cache-Control", "no-cache");
			hresponse.setDateHeader("Expires", 0);
		} else {
			String requestType = hrequest.getHeader("X-Requested-With"); 
			cs.setAttribute("lastRequestURI", requestURI);
			if(requestType!=null && "XMLHttpRequest".equals(requestType)){
				JSONObject json = new JSONObject();
				json.put("login", this.NO_LOGIN_NO);
                response.getWriter().write(json.toJSONString());
            }else{
                hresponse.sendRedirect(hrequest.getContextPath() + loginURL);
            }
			return;
		}
	}

	public void destroy() {
	}

	protected String jointString(String str) {
		StringBuffer buf = new StringBuffer();
		for (StringTokenizer st = new StringTokenizer(str != null ? str : "", "\n", false); st.hasMoreTokens(); buf
				.append(st.nextToken().trim()))
			;
		return buf.toString();
	}

	public void init(FilterConfig config) throws ServletException {
		loginURL = config.getInitParameter("loginURL").trim();
		loginRole = config.getInitParameter("loginRole").trim();
		unfilteredURIs = jointString(config.getInitParameter("unfilteredURIs"));
	}
	
	public static void main(String args[]) {
		String x="/mlo-web/common/css/common.css";
		System.out.println(x.matches("/mlo-web/common/.*"));
		
		
	}
}
