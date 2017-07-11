package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.impl.UsersServiceImpl;
import bean.Register;


@WebServlet("/fixPassword")
public class FixPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public FixPassword() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String method=request.getParameter("method");
		int usersid=(int)request.getSession().getAttribute("loginId");
		if(method.equals("address"))
		{
			String address=request.getParameter("addressText");
			if(new UsersServiceImpl().fixUsersMessage(usersid, address))
			{
				PrintWriter out=response.getWriter();
				out.println("保存成功");
				out.flush();
			}else
			{
				PrintWriter out=response.getWriter();
				out.println("保存失败");
				out.flush();
			}
		}else if(method.equals("fixpassword"))
		{
			String password=request.getParameter("addressTexts");
			if(new UsersServiceImpl().fixUsersPassword(usersid, password)){
				Register register=(Register)request.getSession().getAttribute("ClientMessageAfterLogin");
				register.setPassword(password);
				request.getSession().setAttribute("ClientMessageAfterLogin", register);
				PrintWriter out=response.getWriter();
				out.println("修改成功");
				out.flush();
			}else
			{
				PrintWriter out=response.getWriter();
				out.println("修改失败");
				out.flush();
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}

}
