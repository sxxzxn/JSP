package net.fullstack7.filters;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.annotation.WebInitParam;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class LoginCheckFilter2
 */
@WebFilter(
 filterName="LoginCheckFilter2",
	urlPatterns = { "/bbs/modify.do" },
	initParams = {
			@WebInitParam(name = "FILTER_INIT_PARAM2", value = "필터 초기화 변수2")
})
public class LoginCheckFilter2 extends HttpFilter implements Filter {
	private FilterConfig filterConfig;
    /**
     * @see HttpFilter#HttpFilter()
     */
    public LoginCheckFilter2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		
		String filterInitName = filterConfig.getInitParameter("FILTER_INIT_PARAM1");
		String methodName = req.getMethod();
		req.getQueryString();
		
		HttpSession session = req.getSession();
		
		System.out.println("=========================================");
		System.out.println("LoginCheckFilter2 >> doFilter() >> filterInitName : " + filterInitName);
		System.out.println("LoginCheckFilter2 >> doFilter() >> methodName : " + methodName);
		
		// 특정 방식으로 접근했을 때 사용해서 만들 수 있음
//		if(methodName.equals("GET")) {
//			
//		}
		
		if(session.getAttribute("loginMember") == null) {
			res.setContentType("text/html;charset=UTF-8");
			PrintWriter wrt = res.getWriter();
			StringBuilder sb = new StringBuilder();
			sb.append("<script>");
			sb.append("alert('로그인 후 사용 가능');");
			sb.append("window.location.href='/mvc/bbs/list.do';");
			sb.append("</script>");
			System.out.println("LoginCheckFilter2 >> doFilter() >> script : " + sb.toString());
			wrt.print(sb.toString());
			wrt.close();
			return;
		}else {
			chain.doFilter(request, response);
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		filterConfig = fConfig;
		String filterName = filterConfig.getFilterName();
		System.out.println("=========================================");
		System.out.println("LoginCheckFilter2 start");
		System.out.println("초기화 시점에 한 번만 호출 초기화 시에 필요한 로직이 있으면 추가");
		System.out.println("LoginCheckFilter2 >> init() >> filterName: " + filterName);
		System.out.println("=========================================");
	}

}
