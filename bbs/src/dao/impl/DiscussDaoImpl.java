package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import service.impl.PostServiceImpl;
import bean.Discuss;
import bean.Post;
import dao.DiscussDao;
import dbc.BaseDao;

public class DiscussDaoImpl implements DiscussDao {

	@Override
	public List<Discuss> getDiscussByPostId(Post post) {
		ArrayList<Discuss> list=new ArrayList<Discuss>();
		String sql="select * from discuss where postid='"+post.getId()+"' order by time";
		new BaseDao();
		Connection conn=BaseDao.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				Discuss discuss=new Discuss();
				discuss.setContent(rs.getString("content"));
				discuss.setId(rs.getInt("id"));
				discuss.setPostId(post);
				discuss.setTime(rs.getString("time"));
				discuss.setUserid(new UsersDaoImpl().getUsersById(rs.getInt("usersid")));
				list.add(discuss);
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
	public boolean doDiscuss(Discuss discuss) {
		String sql="insert into discuss(postid,content,time,usersid) values(?,?,TO_DATE(?,'yyyy-mm-dd hh24:mi:ss'),?)";
		List<Object> ls=new ArrayList<Object>();
		ls.add(discuss.getPostId().getId());
		ls.add(discuss.getContent());
		ls.add(discuss.getTime());
		ls.add(discuss.getUserid().getId());
		boolean isFlag=BaseDao.update(ls, sql);
		return isFlag;
	}

	@Override
	public boolean deleteDiscuss(int id) {
		String sql="delete from discuss where id=?";
		List<Object> ls=new ArrayList<Object>();
		ls.add(id);
		boolean isFlag=BaseDao.update(ls, sql);
		return isFlag;
	}

	@Override
	public int getNumByPostId(int postId) {
		int count=0;
		String sql="select count(postid) as c from discuss where postid="+postId;
		Connection conn=BaseDao.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				count=rs.getInt("c");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally
		{
			BaseDao.getClose(conn, pstmt, rs);
		}
		return count;
	}

	@Override
	public List<Discuss> getPostByTypeId(int postId, int num) {
		int count=0;
		ArrayList<Discuss> list=new ArrayList<Discuss>();
		String sql="select * from discuss where postid="+postId+" order by time";
		Connection conn=BaseDao.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				Discuss discuss=new Discuss();
				discuss.setContent(rs.getString("content"));
				discuss.setId(rs.getInt("id"));
				discuss.setPostId(new PostServiceImpl().getPostByid(postId));
				discuss.setTime(rs.getString("time"));
				discuss.setUserid(new UsersDaoImpl().getUsersById(rs.getInt("usersid")));
				list.add(count,discuss);
				count++;
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
	public void deletepost(int postId)
	{
		
		String sql="delete from discuss where postid="+postId;
		Connection conn=BaseDao.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
				pstmt=conn.prepareStatement(sql);
				int num=pstmt.executeUpdate();
			}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}finally
		{
			BaseDao.getClose(conn, pstmt, rs);
		}
		
	}
}