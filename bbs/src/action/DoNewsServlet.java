package action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.impl.LoginServiceImpl;
import service.impl.NewsServiceImpl;
import service.impl.PostServiceImpl;
import service.impl.UsersServiceImpl;
import bean.Post;
import bean.Users;
import dao.impl.PostDaoImpl;
@WebServlet("/DoNewsServlet")
public class DoNewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public DoNewsServlet() {
        super();
       
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idString=request.getParameter("postId");
		int postId=Integer.parseInt(idString);
		Users poster=new PostDaoImpl().getPostByid(postId).getUsersId();
		request.setAttribute("poster", poster);
		String typeId=poster.getTypeId().getId()+"";
		request.setAttribute("typeId", typeId);
		new NewsServiceImpl().doNews(postId);
		
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
			int postsId=post.getId();
			int old=nsi.isOld(postsId);
			int news=nsi.isNew(postsId);
			if(nsi.isNews(old, news))
			{
				s=s+news-old;
				listPost.add(post);	
				
			}
		}
		request.getSession().setAttribute("listPost", listPost);
		request.getSession().setAttribute("s", s);		
		request.getRequestDispatcher("/GetPostMessage?postId="+postId).forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}

}
