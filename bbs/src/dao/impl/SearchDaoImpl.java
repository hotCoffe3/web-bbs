package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.Login;
import bean.Post;
import dao.SearchDao;
import dbc.BaseDao;

public class SearchDaoImpl implements SearchDao {

	public List<Post> findPostByContent(String content) {
		List<Post> list=new ArrayList<Post>();
		if(content!=null&&!content.equals(""))
		{
			content="'%"+content+"%'";
		}else
		{
			content="'%亮文%'";
		}
		String sql="select * from post where content like "+content;
		Connection conn=BaseDao.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				Post post=new Post();
				post.setContent(rs.getString("content"));
				post.setDate(rs.getString("time"));
				post.setId(rs.getInt("id"));
				post.setTitle(rs.getString("title"));
				post.setTypeId(new ContentTypeDaoImpl().getContentTypeById(rs.getInt("typeId")));
				post.setUsersId(new UsersDaoImpl().getUsersById(rs.getInt("usersId")));
				list.add(post);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally
		{
			BaseDao.getClose(conn, pstmt, rs);
		}
		return list;
	}

	public List<Post> findPostByTitle(String title) {
		List<Post> list=new ArrayList<Post>();
		if(title!=null&&!title.equals(""))
		{
			title="'%"+title+"%'";
		}else
		{
			title="'%亮文%'";
		}
		String sql="select * from post where title like "+title;
		Connection conn=BaseDao.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				Post post=new Post();
				
				post.setContent(rs.getString("content"));
				post.setDate(rs.getString("time"));
				post.setId(rs.getInt("id"));
				post.setTitle(rs.getString("title"));
				post.setTypeId(new ContentTypeDaoImpl().getContentTypeById(rs.getInt("typeId")));
				post.setUsersId(new UsersDaoImpl().getUsersById(rs.getInt("usersId")));
				list.add(post);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally
		{
			BaseDao.getClose(conn, pstmt, rs);
		}
		return list;
	}

	public List<Post> findPostByNickName(String nickName) {
		List<Post> list=new ArrayList<Post>();	
		LoginDaoImpl logindi=new LoginDaoImpl();
		List<Login> listLogin=logindi.findNickName(nickName);
		Connection conn=BaseDao.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {

			for(Login login:listLogin)
			{
				String sql="select * from post where usersid="+login.getUsersId();	
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				while(rs.next())
				{
					Post post=new Post();
					post.setContent(rs.getString("content"));
					post.setDate(rs.getString("time"));
					post.setId(rs.getInt("id"));
					post.setTitle(rs.getString("title"));
					post.setTypeId(new ContentTypeDaoImpl().getContentTypeById(rs.getInt("typeId")));
					post.setUsersId(new UsersDaoImpl().getUsersById(rs.getInt("usersId")));
					list.add(post);
				}
			}
		} catch (SQLException e) {
				e.printStackTrace();
		}
		finally
		{
			BaseDao.getClose(conn, pstmt, rs);
		}
		return list;
	}

}
