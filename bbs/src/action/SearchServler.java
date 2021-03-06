package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.impl.SearchServiceImpl;
import bean.Post;

@WebServlet("/searchServlet")
public class SearchServler extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public SearchServler() {
        super();       
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String select=request.getParameter("select");
		String str=request.getParameter("text");
		if(select.equals("content"))
		{
			List<Post> list=new SearchServiceImpl().findPostByContent(str);
			request.getSession().setAttribute("postList", list);
			response.sendRedirect(request.getContextPath()+"/PageServlet?method=homePage");
		}else if(select.equals("title"))
		{
			List<Post> list=new SearchServiceImpl().findPostByTitle(str);
			request.getSession().setAttribute("postList", list);
			response.sendRedirect(request.getContextPath()+"/PageServlet?method=homePage");
		}else
		{
			List<Post> list =new SearchServiceImpl().findPostByNickName(str);
			request.getSession().setAttribute("postList", list);
			response.sendRedirect(request.getContextPath()+"/PageServlet?method=homePage");
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}
}
