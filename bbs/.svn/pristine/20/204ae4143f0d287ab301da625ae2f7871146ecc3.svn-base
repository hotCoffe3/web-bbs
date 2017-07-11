package action;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintStream;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import dao.impl.ContentTypeDaoImpl;
import dao.impl.PostDaoImpl;
import dao.impl.UsersDaoImpl;

import bean.ContentType;
import bean.Post;
import bean.Register;
import bean.Users;

/**
 * Servlet implementation class Posting
 */
@WebServlet("/posting")
public class Posting extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private String contenttype="";
    private String title="";
    public Posting() {
    	
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String contenttype=request.getParameter("contenttype");
		System.out.println("contenttype"+contenttype);
		String title=request.getParameter("title");
		this.contenttype=contenttype;
		this.title=title;
	}
	@SuppressWarnings("deprecation")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session=request.getSession();
		String login=(String) session.getAttribute("login");
		
		if(login.equals("已登录"))
		{
		String name="";String value="";
        String path=(String) request.getSession().getAttribute("users");
        request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		Register register=(Register) session.getAttribute("ClientMessageAfterLogin");
		String name2=register.getAccount();
		DiskFileItemFactory factory=new DiskFileItemFactory();
		factory.setSizeThreshold(1024*500);
		String fileName="";
		int fo=0;
		File tempFile=new File(path+"/"+name2+"/temp");
		if(!tempFile.exists())
		{
			tempFile.mkdirs();
		}
		factory.setRepository(tempFile);	
		ServletFileUpload upload=new ServletFileUpload(factory);
		upload.setFileSizeMax(1024*1024*5);
		try
		{
			List<FileItem> items=upload.parseRequest(request);
			for(FileItem item:items)
			{
				if(item.isFormField())
				{
					name=item.getFieldName();
					 value=item.getString("utf-8");
				}else
				{
					String fieldName=item.getFieldName();
					 fileName=item.getName();
					String contentType=item.getContentType();
					long size=item.getSize();
					InputStream in=item.getInputStream();
					byte[]buffer=new byte[1024];
					int len=0;
					for(int i=0;i<100000;i++)
					{
						File file=new File(path+"/"+name2+"/"+i);
						if(!file.exists())
						{   
							fo=i;
							file.mkdir();break;
						}
					}
					
					if(!fileName.equals(""))
					{
					fileName=path+"/"+name2+"/"+fo+"/"+fileName;
					OutputStream out=new FileOutputStream(fileName);
					while((len=in.read(buffer))!=-1)
					{
						out.write(buffer,0,len);
					}
					out.close();
					in.close();
					}
				}
			}
			String textaddress=path+"/"+name2+"/"+fo+"/text.txt";
			File file=new File(textaddress);
			PrintStream ps=new PrintStream(new FileOutputStream(file));
			ps.print(value);
			if(session.getAttribute("loginId")!=null)
			{
			
			int id=(Integer) session.getAttribute("loginId");
			Users users=new UsersDaoImpl().getUsersById(id);
			int co= Integer.parseInt(this.contenttype);
			ContentType contentType=new ContentTypeDaoImpl().getContentTypeById(co);
			Post post=new Post();
			post.setContent(path+"/"+name2+"/"+fo);
			post.setDate(new Date().toLocaleString());
			post.setTitle(this.title);
			post.setTypeId(contentType);
			post.setUsersId(users);
			boolean isFlag=new PostDaoImpl().doPost(post);
			if(isFlag)
			{
				session.setAttribute("isflag", "OK");
			}
			else
			{
				session.setAttribute("isflag", "fail");
			}
			response.sendRedirect("./page/postsuccessedorfali.jsp");	
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		}
		else{
			response.getWriter().print("<SCRIPT>alert('你还没登录，请登录后再试！');location.href='./page/login.jsp';</SCRIPT>");
		}
	}
}
