package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.impl.UsersServiceImpl;
import bean.Login;
import bean.Users;

import com.sun.jndi.cosnaming.IiopUrl.Address;

import dao.impl.LoginDaoImpl;
import dao.impl.UsersDaoImpl;

/**
 * Servlet implementation class Findpassword
 */
@WebServlet("/findpassword")
public class Findpassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Findpassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String account=request.getParameter("account");
		String phone=request.getParameter("phone");
		String name=request.getParameter("name");
		String address= request.getParameter("address");
		HttpSession session=request.getSession();
		PrintWriter out=response.getWriter();
		int a=0;
		if(!account.equals(""))
		{
			a=1;
		}
		int b=0;
		if(!phone.equals(""))
		{
			b=1;
		}
		int c=0;
		if(!name.equals(""))
		{
			c=1;
		}
		int d=0;
		if(!address.equals(""))
		{
			d=1;
		}
		
		if(a*b!=0)
		{
			Users users=new UsersDaoImpl().getUsersByPhone(phone);
			int id=users.getId();
			Login login=new LoginDaoImpl().findNickNameByUsersId(id);
			if(id!=0)
			{
				System.out.println("这是"+login.getNickName());
				if(login.getNickName().equals(account))
				{
					session.setAttribute("allusermessage", users);
					session.setAttribute("allloginmessage", login);
					out.print("yes");
				}
				else
				{
					out.print("用户不存在");
				}
			}
			else
			{
				out.print("用户不存在");
			}
		}
		else if(c*d!=0)
		{
			System.out.println(address+"\t"+name);
			String sql="select * from users where address='"+address+"' and name='"+name+"'";
			Users users=new UsersDaoImpl().getUsers(sql);
			int id=users.getId();
			Login login=new LoginDaoImpl().findNickNameByUsersId(id);
			if(id!=0)
			{
				if(login.getNickName().equals(account))
				{
					session.setAttribute("allusermessage", users);
					session.setAttribute("allloginmessage", login);
					out.print("yes");
				}
				else
				{
					out.print("用户不存在");
				}
			}
			else
			{
				out.print("用户不存在");
			}
		}
		else if(a*c!=0)
		{
			String sql="select * from users where account='"+account+"' and name='"+name+"'";
			
			Users users=new UsersDaoImpl().getUsers(sql);
			int id=users.getId();
			Login login=new LoginDaoImpl().findNickNameByUsersId(id);
			if(id!=0)
			{
				if(login.getNickName().equals(account))
				{
					session.setAttribute("allusermessage", users);
					session.setAttribute("allloginmessage", login);
					out.print("yes");
				}
				else
				{
					out.print("用户不存在");
				}
			}
			else
			{
				out.print("用户不存在");
			}
		}
		else if(a*d!=0)
		{
			
			
			
			String sql="select * from users where account='"+account+"' and address='"+address+"'";
			
			Users users=new UsersDaoImpl().getUsers(sql);
			int id=users.getId();
			Login login=new LoginDaoImpl().findNickNameByUsersId(id);
			if(id!=0)
			{
				if(login.getNickName().equals(account))
				{
					session.setAttribute("allusermessage", users);
					session.setAttribute("allloginmessage", login);
					out.print("yes");
				}
				else
				{
					out.print("用户不存在");
				}
			}
			else
			{
				out.print("用户不存在");
			}
		}
		else if(b*d!=0)
		{
			
			
			String sql="select * from users where phone='"+phone+"' and address='"+address+"'";
			
			Users users=new UsersDaoImpl().getUsers(sql);
			int id=users.getId();
			Login login=new LoginDaoImpl().findNickNameByUsersId(id);
			if(id!=0)
			{
				if(login.getNickName().equals(account))
				{
					session.setAttribute("allusermessage", users);
					session.setAttribute("allloginmessage", login);
					out.print("yes");
				}
				else
				{
					out.print("用户不存在");
				}
			}
			else
			{
				out.print("用户不存在");
			}
		}
		else
		{
			out.print("请填写完整信息！");
		}
		out.flush();
		out.close();
	}

}
