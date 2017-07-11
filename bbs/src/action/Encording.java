package action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import service.impl.LoginServiceImpl;
import service.impl.NewsServiceImpl;
import service.impl.PostServiceImpl;
import service.impl.UsersServiceImpl;
import bean.Post;

/**
 * Servlet Filter implementation class Encording
 */
@WebFilter("/*")
public class Encording implements Filter {

    /**
     * Default constructor. 
     */
    public Encording() {
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
		HttpServletRequest re=(HttpServletRequest) request;
		HttpSession session=re.getSession();
		ServletContext application=request.getServletContext();
		String path=application.getInitParameter("users");
		session.setAttribute("users", path);
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");

			
		
		chain.doFilter(request, response);
	}

	
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
