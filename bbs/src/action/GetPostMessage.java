package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.impl.LoginServiceImpl;
import bean.Discuss;
import bean.Post;
import bean.Users;
import dao.impl.DiscussDaoImpl;
import dao.impl.PostDaoImpl;
import dao.impl.UsersDaoImpl;
//@WebServlet("/GetPostMessage")
public class GetPostMessage extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String idString=request.getParameter("postId");
		int postId=Integer.parseInt(idString);
		Users poster=new PostDaoImpl().getPostByid(postId).getUsersId();
		request.setAttribute("poster", poster);
		
		String typeId=poster.getTypeId().getId()+"";
		request.setAttribute("typeId", typeId);
		
		String nickName=new LoginServiceImpl().findNickNameByUsersId(poster.getId()).getNickName();
		request.setAttribute("nickName", nickName);
		
		Post post=new PostDaoImpl().getPostByid(postId);
		request.setAttribute("post", post);
		
		ArrayList<Discuss> discussList=new ArrayList<Discuss>();
		discussList=(ArrayList<Discuss>) new DiscussDaoImpl().getDiscussByPostId(post);
		request.setAttribute("discussList", discussList);
		
		if(request.getSession().getAttribute("loginId")!=null){
			int currentUserId=(int)request.getSession().getAttribute("loginId");
			Users currentUser=new UsersDaoImpl().getUsersById(currentUserId);
			request.setAttribute("currentUser", currentUser);
		}
		
		request.getRequestDispatcher("page/postmessage.jsp").forward(request, response);
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
