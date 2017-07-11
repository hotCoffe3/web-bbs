package action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.impl.PostDaoImpl;
import service.impl.PostServiceImpl;
import bean.Post;
@WebServlet("/TypePageServlet")
public class TypePageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	int jishu=1;
    public TypePageServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Post> list=new ArrayList<Post>();
		int typeId=Integer.parseInt(request.getParameter("typeId"));
		request.setAttribute("typeId", typeId);
		if (typeId==1) {
			request.setAttribute("titleName", "学无止境");
		}else if(typeId==2)
		{
			request.setAttribute("titleName", "职来职往");
		}else if(typeId==3)
		{
			request.setAttribute("titleName", "社会交际");
		}else
		{
			request.setAttribute("titleName", "游戏平台");
		}
		PostServiceImpl psi=new PostServiceImpl();
		String method=request.getParameter("method")==null?"":request.getParameter("method");
		int num=5;//每页记录数
		int count=new PostDaoImpl().getTotalCount(typeId);
		int totleCount=count% num == 0 ? count / num :count/ num + 1;//总页数
		int endPage = num;
		int startPage=1;
		response.setCharacterEncoding("utf-8");
		request.setAttribute("str", "str");
		if(count==0){	
			request.setAttribute("str", null);
			request.getRequestDispatcher("/page/endlessLearning.jsp").forward(request, response);
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
				list=psi.getPostByTypeId(typeId, jishu);
				request.setAttribute("list", list);
				request.getRequestDispatcher("/page/endlessLearning.jsp").forward(request, response);
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
				list=psi.getPostByTypeId(typeId, jishu);
				request.setAttribute("list", list);
				request.getRequestDispatcher("/page/endlessLearning.jsp").forward(request, response);
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
				list=psi.getPostByTypeId(typeId, jishu);
				request.setAttribute("list", list);
				request.getRequestDispatcher("/page/endlessLearning.jsp").forward(request, response);
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
					list=psi.getPostByTypeId(typeId, jishu);
					request.setAttribute("list", list);
					request.getRequestDispatcher("/page/endlessLearning.jsp").forward(request, response);
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
					list=psi.getPostByTypeId(typeId, jishu);
					request.setAttribute("list", list);
					request.getRequestDispatcher("/page/endlessLearning.jsp").forward(request, response);
				}
				else
				{
					response.getWriter().write("<script type='text/javascript'>alert('您未输入正确页码数，已自动跳到第一页');"
							+ "location.href='TypePageServlet?method=homePage&typeId="+typeId+"'</script>");
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
				list=psi.getPostByTypeId(typeId, jishu);
				request.setAttribute("list", list);
				request.getRequestDispatcher("/page/endlessLearning.jsp").forward(request, response);
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
