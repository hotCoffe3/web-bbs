package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.impl.DiscussDaoImpl;

public class DelDiscussServlet extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int discussId=Integer.parseInt(request.getParameter("discussId"));
		boolean delDiscuss=new DiscussDaoImpl().deleteDiscuss(discussId);
		
		if(delDiscuss==true){
			response.getWriter().print("删除回复成功");
		}else{
			response.getWriter().print("删除回复失败");
		}
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
