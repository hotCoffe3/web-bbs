package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.Post;
import dao.PostDao;
import dbc.BaseDao;

public class PostDaoImpl implements PostDao {
	int totlePage=0;
	public Post getPostByid(int id) {
		Post post=new Post();
		String sql="select * from post where id="+id;
		Connection conn=BaseDao.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				post.setContent(rs.getString("content"));
				post.setDate(rs.getString("time"));
				post.setId(rs.getInt("id"));
				post.setTitle(rs.getString("title"));
				post.setTypeId(new ContentTypeDaoImpl().getContentTypeById(rs.getInt("typeId")));
				post.setUsersId(new UsersDaoImpl().getUsersById(rs.getInt("usersId")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally
		{
			BaseDao.getClose(conn, pstmt, rs);
		}
		
		return post;
	}

	@Override
	public List<Post> getPostByUsersId(int usersId) {
		List<Post> list=new ArrayList<Post>();
		String sql="select * from post where usersid="+usersId;
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

	@Override
	public List<Post> getPostByTypeId(int typeId, int num) {
		List<Post> list=new ArrayList<Post>();
		int id=5;//每页显示条数
		int endPage = num*id;
		int totleCount = new PostDaoImpl().getTotalCount(typeId);
		int startPage = 1 + (num - 1) * id;
		String sql="select * from( select rownum rn,s.* from (select * from post where typeid="+typeId+")s)ss where ss.rn>="+startPage+" and ss.rn<="+endPage;
		totlePage = totleCount % id == 0 ? totleCount / id : totleCount / id + 1;
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
		} catch (Exception e) {
			
		}finally
		{
			BaseDao.getClose(conn, pstmt, rs);
		}
		return list;
	}

	@Override
	public int getTotalCount(int typeId) {
		int num=0;
		String sql="select id from post where typeId="+typeId;
		Connection conn=BaseDao.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while (rs.next()) {
				num = rs.getRow();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally
		{
			BaseDao.getClose(conn, pstmt, rs);
		}
		return num;
	}

	@Override
	public boolean doPost(Post post) {
		boolean isFlag=false;
		String sql="insert into post(usersid,content,typeid,title,time) values(?,?,?,?,TO_DATE(?,'yyyy-mm-dd hh24:mi:ss'))";
		List<Object> ls=new ArrayList<Object>();
		ls.add(post.getUsersId().getId());
		ls.add(post.getContent());
		ls.add(post.getTypeId().getId());
		ls.add(post.getTitle());
		ls.add(post.getDate());
		isFlag=BaseDao.update(ls, sql);
		return isFlag;
	}

	@Override
	public boolean deletepost(int postId)
	{
		// TODO Auto-generated method stub
		boolean isFlag=false;
		String sql=" delete from post where id="+postId;
		Connection conn=BaseDao.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try
		{
			pstmt=conn.prepareStatement(sql);
			int num=pstmt.executeUpdate();
			if(num>0)
			{
				isFlag=true;
			}
			
		}
		catch (Exception e)
		{
			e.printStackTrace();
			// TODO: handle exception
		}
		finally
		{
			BaseDao.getClose(conn, pstmt, rs);
		}
		
		return isFlag;
	}
}
