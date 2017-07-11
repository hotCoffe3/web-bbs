package action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.impl.ChatServiceImpl;
import service.impl.NewsServiceImpl;
import service.impl.UsersServiceImpl;
import bean.Chat;

/**
 * Servlet implementation class ChatServlet
 */
@WebServlet("/ChatServlet")
public class ChatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ChatServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String usersIdStr=request.getParameter("usersId");
		int usersId=Integer.parseInt(usersIdStr);
		int loginId=(int)request.getSession().getAttribute("loginId");
		List<Chat> list=new ArrayList<Chat>();
		list=new ChatServiceImpl().getMessage(loginId, usersId);
		request.setAttribute("chatInfoId", usersId);
		request.setAttribute("usersinfo", new UsersServiceImpl().getUsersById(usersId));
		request.getSession().setAttribute("chatRecord", list);
		new NewsServiceImpl().doNewChat(loginId, usersId);
		NewsServiceImpl nsi=new NewsServiceImpl();
		int record=nsi.isNewChatRecord(loginId);
		request.getSession().setAttribute("recordNews", record);
		request.getSession().setAttribute("chatList", nsi.getChatMes(loginId));		
		request.getRequestDispatcher("/page/chat.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String usersIdStr=request.getParameter("username");
		int usersId=Integer.parseInt(usersIdStr);
		String content=request.getParameter("chattext");
		int loginId=(int)request.getSession().getAttribute("loginId");
		Chat chat=new Chat();
		chat.setContent(content);
		chat.setLoginId(loginId);
		chat.setTime(new Date().toLocaleString());
		chat.setUsersId(usersId);
		boolean isFlag=new ChatServiceImpl().sendMessage(chat);
		if(isFlag)
		{
			
		}
		List<Chat> list=new ArrayList<Chat>();
		list=new ChatServiceImpl().getMessage(loginId, usersId);
		request.setAttribute("chatInfoId", usersId);
		request.setAttribute("usersinfo", new UsersServiceImpl().getUsersById(usersId));
		request.getSession().setAttribute("chatRecord", list);
		request.getRequestDispatcher("/page/chat.jsp").forward(request, response);

	}

}
