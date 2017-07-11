package demo;

import java.sql.Connection;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import action.FindMessage;
import bean.Chat;
import bean.ContentType;
import bean.Login;
import bean.Post;
import dao.impl.ContentTypeDaoImpl;
import dao.impl.LoginDaoImpl;
import dao.impl.NewsDaoImpl;
import dao.impl.SearchDaoImpl;
import dbc.BaseDao;


public class Test {
	@org.junit.Test
	public void test1()
	{
		ContentTypeDaoImpl ctdi=new ContentTypeDaoImpl();
		ContentType ct=ctdi.getContentTypeById(1);
		System.out.println(ct.getType());
	}
	@org.junit.Test
	public void testConn()
	{
		BaseDao db=new BaseDao();
		Connection conn= db.getConnection();
		if(conn!=null)
		{
			System.out.println("连接成功");
		}
	}
	@org.junit.Test
	public void testshowindex()
	{
		SearchDaoImpl fp=new SearchDaoImpl();
		List<Post> list=fp.findPostByContent("亮文");
		for(Post post:list)
		{
			System.out.println(post.getContent());
		}
	}
	@org.junit.Test
	public void test2()
	{
		LoginDaoImpl l=new LoginDaoImpl();
		List<Login> list=l.findNickName(null);
		for(Login login:list)
		{
			System.out.println(login.getUsersId());
		}
	}

	@org.junit.Test
	public void test(){
		List<Chat> list=new ArrayList<Chat>();
		list=new NewsDaoImpl().getChatMes(35);
		System.out.println(list.size());
	}
	@org.junit.Test
	public void test3() throws ParseException{
		FindMessage fm=new FindMessage();
		System.out.println(fm.findmessage("G:\\eclipse\\WorkSpace\\bbs\\WebContent\\users/即蕴涵/15"));
	}
	
}
