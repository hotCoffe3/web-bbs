package action;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.xml.internal.ws.api.policy.PolicyResolver.ServerContext;

import bean.Discuss;
import bean.Post;
import bean.Users;
import dao.impl.DiscussDaoImpl;
import dao.impl.PostDaoImpl;
import dao.impl.UsersDaoImpl;

public class DealDiscuss extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String replyContent=request.getParameter("replyContent");
		int postId=Integer.parseInt((String)request.getParameter("postId"));

		int currentUserId=(int)request.getSession().getAttribute("loginId");
		Post post=new PostDaoImpl().getPostByid(postId);
		Users user=new UsersDaoImpl().getUsersById(currentUserId);
		String currentTime=new Date().toLocaleString();
//		byte[] b=replyContent.getBytes("iso-8859-1");
//		replyContent=new String(b,"utf-8");
			
		Discuss discuss=new Discuss();
		discuss.setContent(replyContent);
		discuss.setPostId(post);
		discuss.setTime(currentTime);
		discuss.setUserid(user);
		boolean doDiscuss=new DiscussDaoImpl().doDiscuss(discuss);
		
		
			
		if(doDiscuss==true){
			response.getWriter().print("1");
		}else{
			response.getWriter().print("0");
		}
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}
}