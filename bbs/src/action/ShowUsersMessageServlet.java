package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.impl.LoginServiceImpl;
import service.impl.PostServiceImpl;
import service.impl.UsersServiceImpl;
import bean.Post;

@WebServlet("/showUsersMessageServlet")
public class ShowUsersMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public ShowUsersMessageServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int usersId=Integer.parseInt(request.getParameter("usersId"));
		String biaozhi=request.getParameter("biaozhi");
		List<Post> list=new PostServiceImpl().getPostByUsersId(usersId);
		request.getSession().setAttribute("usersPostList", list);
		request.getSession().setAttribute("panduan", usersId);
		String nickName=new LoginServiceImpl().findNickNameByUsersId(usersId).getNickName();
		request.getSession().setAttribute("nickName", nickName);
		request.getSession().setAttribute("showUsers", new UsersServiceImpl().getUsersById(usersId));
		if(biaozhi!=null)
		{
			response.sendRedirect(request.getContextPath()+"/usersPostPagingServlet?biaozhi=haha&method=homePage");
		}else
		{
			response.sendRedirect(request.getContextPath()+"/usersPostPagingServlet?method=homePage");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}

}
