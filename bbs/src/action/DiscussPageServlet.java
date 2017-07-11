package action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.impl.DiscussServiceImpl;
import service.impl.LoginServiceImpl;
import bean.Discuss;
import bean.Post;
import bean.UserFace;
import bean.Users;
import dao.impl.PostDaoImpl;
import dao.impl.UserFaceDaoImpl;
import dao.impl.UsersDaoImpl;

@WebServlet("/GetPostMessage")
public class DiscussPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	int jishu=1;
    public DiscussPageServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		request.setAttribute("postId", postId);
		List<Discuss> list=new ArrayList<Discuss>();
		
		UserFace posterface=new UserFaceDaoImpl().findFacebyUser(poster);
		request.setAttribute("posterface", posterface);
//		discussList=(ArrayList<Discuss>) new DiscussDaoImpl().getDiscussByPostId(post);
//		request.setAttribute("discussList", discussList);
		
		if(request.getSession().getAttribute("loginId")!=null){
			int currentUserId=(int)request.getSession().getAttribute("loginId");
			Users currentUser=new UsersDaoImpl().getUsersById(currentUserId);
			request.setAttribute("currentUser", currentUser);
		}
		
		
		
		
		
		
		DiscussServiceImpl dsi=new DiscussServiceImpl();
		//PostServiceImpl psi=new PostServiceImpl();
		String method=request.getParameter("method")==null?"homePage":request.getParameter("method");
		int num=9;//每页记录数
		int count=new DiscussServiceImpl().getNumByPostId(postId);
		int totleCount=count% num == 0 ? count / num :count/ num + 1;//总页数
		int endPage = num;
		int startPage=1;
		response.setCharacterEncoding("utf-8");
		if(count==0){	
			request.setAttribute("totlePage", 1);
			request.setAttribute("current", 1);
			request.setAttribute("discussList", list);
			request.getRequestDispatcher("page/postmessage.jsp").forward(request, response);
		}else
		{
			if(!method.equals(""))
			{
			switch (method) {
			case "homePage":
				jishu=1;
				startPage=1;			
				request.setAttribute("startPage", startPage);
				request.setAttribute("lastPage",null );	
				request.setAttribute("totlePage", totleCount);
				request.setAttribute("current", 1);
				if(count>num)
				{
					endPage=num;
					request.setAttribute("nextPage", "下一页");
					request.setAttribute("endPage", endPage);
				}else
				{
					endPage=count;
					request.setAttribute("endPage", endPage);
					request.setAttribute("nextPage", null);
				}	
				list=dsi.getPostByTypeId(postId, jishu);
				request.setAttribute("discussList", list);
				request.getRequestDispatcher("page/postmessage.jsp").forward(request, response);
				break;
			case "nextPaging":
				jishu++;
				startPage=1+jishu*num-num;
				request.setAttribute("startPage", startPage);
				request.setAttribute("lastPage","上一页" );	
				request.setAttribute("totlePage", totleCount);
				request.setAttribute("current", jishu);
				if(count>jishu*num)
				{
					endPage=num*jishu;
					request.setAttribute("nextPage", "下一页");
					request.setAttribute("endPage", endPage);;
				}else
				{
					endPage=count;
					request.setAttribute("endPage", endPage);
					request.setAttribute("nextPage", null);
				}
				list=dsi.getPostByTypeId(postId, jishu);
				request.setAttribute("discussList", list);
				request.getRequestDispatcher("page/postmessage.jsp").forward(request, response);
				break;
			case "lastPaging":
				jishu--;
				startPage=1+jishu*num-num;
				request.setAttribute("startPage", startPage);
				request.setAttribute("nextPage","下一页" );	
				request.setAttribute("totlePage", totleCount);
				request.setAttribute("current", jishu);
				if(jishu>0)
				{
					endPage=num*jishu;
					request.setAttribute("lastPage", "上一页");
					request.setAttribute("endPage", endPage);;
				}else
				{
					endPage=num;
					request.setAttribute("endPage", endPage);
					request.setAttribute("lastPage", null);
				}
				list=dsi.getPostByTypeId(postId, jishu);
				request.setAttribute("discussList", list);
				request.getRequestDispatcher("page/postmessage.jsp").forward(request, response);
				break;
			case "jump":
				String text=request.getParameter("jumpname")==null?"0":request.getParameter("jumpname");	
				int texta=Integer.parseInt(text);	
				if(texta>1&&totleCount>=texta)
				{
					request.setAttribute("lastPage", "上一页");
					jishu=texta;
					startPage=1+jishu*num-num;
					request.setAttribute("startPage", startPage);
					request.setAttribute("totlePage", totleCount);
					request.setAttribute("current", jishu);
					if(totleCount>texta)
					{
						endPage=jishu*num;
						request.setAttribute("endPage", endPage);
						request.setAttribute("nextPage", "下一页");
					}else
					{
						endPage=count;
						request.setAttribute("endPage", endPage);
						request.setAttribute("nextPage",null);
					}
					list=dsi.getPostByTypeId(postId, jishu);
					request.setAttribute("discussList", list);
					request.getRequestDispatcher("page/postmessage.jsp").forward(request, response);
				}else if(texta==1)
				{
					startPage=1;
					jishu=1;
					request.setAttribute("startPage", startPage);
					request.setAttribute("lastPage",null );	
					request.setAttribute("totlePage", totleCount);
					request.setAttribute("current", 1);
					if(count>num)
					{
						endPage=num;
						request.setAttribute("nextPage", "下一页");
						request.setAttribute("endPage", endPage);
					}else
					{
						endPage=count;
						request.setAttribute("endPage", endPage);
						request.setAttribute("nextPage", null);
					}
					list=dsi.getPostByTypeId(postId, jishu);
					request.setAttribute("discussList", list);
					request.getRequestDispatcher("page/postmessage.jsp").forward(request, response);
				}
				else
				{
					response.getWriter().write("<script type='text/javascript'>alert('您未输入正确页码数，自动跳到第一页');"
							+ "location.href='GetPostMessage?method=homePage&postId="+postId+"'</script>");
				}
				break;
			case "endPage":
				jishu=totleCount;
				if(count<=num)
				{
					startPage=1;			
					request.getSession().setAttribute("startPage", startPage);
					request.setAttribute("lastPage",null );	
					request.setAttribute("totlePage", totleCount);
					request.setAttribute("current", 1);
					endPage=count;
					request.setAttribute("endPage", endPage);
					request.setAttribute("nextPage", null);
				}else
				{
					startPage=(totleCount-1)*num+1;
					endPage=count;
					request.setAttribute("startPage", startPage);
					request.setAttribute("lastPage","上一页" );
					request.setAttribute("nextPage", null);
					request.setAttribute("totlePage", totleCount);
					request.setAttribute("current", totleCount);
					request.setAttribute("endPage", endPage);
				}
				list=dsi.getPostByTypeId(postId, jishu);
				request.setAttribute("discussList", list);
				request.getRequestDispatcher("page/postmessage.jsp").forward(request, response);
				break;
			default:
				break;
			}
		}}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}

}
