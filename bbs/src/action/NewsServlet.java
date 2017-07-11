package action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Post;
import service.impl.LoginServiceImpl;
import service.impl.NewsServiceImpl;
import service.impl.PostServiceImpl;
import service.impl.UsersServiceImpl;

@WebServlet("/NewsServlet")
public class NewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public NewsServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int usersId=(int)request.getSession().getAttribute("loginId");
		String nickName=new LoginServiceImpl().findNickNameByUsersId(usersId).getNickName();
		request.getSession().setAttribute("nickName", nickName);
		request.getSession().setAttribute("showUsers", new UsersServiceImpl().getUsersById(usersId));
		List<Post> list=new PostServiceImpl().getPostByUsersId(usersId);
		NewsServiceImpl nsi=new NewsServiceImpl();
		int s=0;
		List<Post> listPost=new ArrayList<Post>();
		for(Post post:list)
		{
			int postId=post.getId();
			int old=nsi.isOld(postId);
			int news=nsi.isNew(postId);
			if(nsi.isNews(old, news))
			{
				s=s+news-old;
				listPost.add(post);	
				
			}
			
		}
		request.getSession().setAttribute("listPost", listPost);
		request.getSession().setAttribute("s", s);
		int record=nsi.isNewChatRecord(usersId);
		request.getSession().setAttribute("recordNews", record);
		request.getSession().setAttribute("chatList", nsi.getChatMes(usersId));		
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}

}
