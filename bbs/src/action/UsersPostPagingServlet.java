package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Post;

/**
 * Servlet implementation class UsersPostServlet
 */
@WebServlet("/usersPostPagingServlet")
public class UsersPostPagingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	int jishu=0;//用于下一页上一页计数  
    public UsersPostPagingServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String biaozhi=request.getParameter("biaozhi");
		if(biaozhi!=null)
		{
			request.setAttribute("biaozhi", "haha");
		}
		String method=request.getParameter("method")==null?"":request.getParameter("method");
		@SuppressWarnings("unchecked")
		List<Post> list=(List<Post>)request.getSession().getAttribute("usersPostList");
		int num=4;//每页记录数
		int count=list.size();
		int totleCount=count% num == 0 ? count / num :count/ num + 1;//总页数
		int endPage = 4;
		int startPage=1;
		response.setCharacterEncoding("utf-8");
		if(count==0)
		{
			request.setAttribute("noSearchTow", "noSearchTow");
			request.getRequestDispatcher("page/showUsersMessage.jsp")
			.forward(request, response);
		}else
		{
		if(!method.equals(""))
		{
			switch (method) {
			case "homePage":
				jishu=0;
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
				request.getRequestDispatcher("page/showUsersMessage.jsp").forward(request, response);
				break;
			case "nextPaging":
				jishu++;
				startPage=1+jishu*num;
				request.setAttribute("startPage", startPage);
				request.setAttribute("lastPage","上一页" );	
				request.setAttribute("totlePage", totleCount);
				request.setAttribute("current", jishu+1);
				if(count>jishu*num+num)
				{
					endPage=num*jishu+num;
					request.setAttribute("nextPage", "下一页");
					request.setAttribute("endPage", endPage);;
				}else
				{
					endPage=count;
					request.setAttribute("endPage", endPage);
					request.setAttribute("nextPage", null);
				}
				request.getRequestDispatcher("page/showUsersMessage.jsp").forward(request, response);
				break;
			case "lastPaging":
				jishu--;
				startPage=1+jishu*num;
				request.setAttribute("startPage", startPage);
				request.setAttribute("nextPage","下一页" );	
				request.setAttribute("totlePage", totleCount);
				request.setAttribute("current", jishu+1);
				if(jishu>0)
				{
					endPage=num*jishu+num;
					request.setAttribute("lastPage", "上一页");
					request.setAttribute("endPage", endPage);;
				}else
				{
					endPage=num;
					request.setAttribute("endPage", endPage);
					request.setAttribute("lastPage", null);
				}
				request.getRequestDispatcher("page/showUsersMessage.jsp").forward(request, response);
			case "jump":
				String text=request.getParameter("jumpname")==null?"0":request.getParameter("jumpname");	
				int texta=Integer.parseInt(text);	
				if(texta>1&&totleCount>=texta)
				{
					request.setAttribute("lastPage", "上一页");
					jishu=texta-1;
					startPage=1+jishu*num;
					request.setAttribute("startPage", startPage);
					request.setAttribute("totlePage", totleCount);
					request.setAttribute("current", jishu+1);
					if(totleCount>texta)
					{
						endPage=jishu*num+num;
						request.setAttribute("endPage", endPage);
						request.setAttribute("nextPage", "下一页");
					}else
					{
						endPage=count;
						request.setAttribute("endPage", endPage);
						request.setAttribute("nextPage",null);
					}
					request.getRequestDispatcher("page/showUsersMessage.jsp").forward(request, response);
				}else if(texta==1)
				{
					jishu=0;
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
					request.getRequestDispatcher("page/showUsersMessage.jsp").forward(request, response);
				}else
				{
					response.getWriter().write("<script type='text/javascript'>alert('您未输入正确页码数，已自动跳到第一页');"
							+ "location.href='usersPostPagingServlet?method=homePage'</script>");
					
				}
				break;
			case "endPage":
				jishu=totleCount-1;
				if(count<=num)
				{
					startPage=1;			
					request.setAttribute("startPage", startPage);
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
				request.getRequestDispatcher("page/showUsersMessage.jsp").forward(request, response);
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
