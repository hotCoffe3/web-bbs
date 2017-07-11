package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.Chat;
import bean.Post;
import dao.NewsDao;
import dbc.BaseDao;

public class NewsDaoImpl implements NewsDao {


	@Override
	public int isOld(int postId) {
		int num=0; 
		String sql="select countdis from post where id="+postId;
		Connection conn=BaseDao.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				num=rs.getInt("countdis");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally
		{
			BaseDao.getClose(conn, pstmt, rs);
		}
		return num;
	}

	@Override
	public int isNew(int postId) {
		int num=0; 
		String sql="select count(postid)s from discuss where postid="+postId;
		Connection conn=BaseDao.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				num=rs.getInt("s");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally
		{
			BaseDao.getClose(conn, pstmt, rs);
		}
		return num;
	}

	@Override
	public boolean isNews(int old, int news) {
		boolean isFlag=false;
		if(news>old)
		{
			isFlag=true;
		}
		return isFlag;
	}

	@Override
	public Post doNews(int postId) {
		Post post=new Post();
		post = new PostDaoImpl().getPostByid(postId);
		int newcount=new NewsDaoImpl().isNew(postId);
		String sql="UPDATE post SET countdis ="+ newcount+" WHERE id ="+postId;
		Connection conn=BaseDao.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally
		{
			BaseDao.getClose(conn, pstmt, rs);
		}
		return post;
	}

	
	
	//以下是chat
	@Override
	public int isNewChatRecord(int loginId) {
		int num=0; 
		String sql="select count(id)s from chat where usersid="+loginId+" and record=0";
		Connection conn=BaseDao.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				num=rs.getInt("s");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally
		{
			BaseDao.getClose(conn, pstmt, rs);
		}
		return num;
	}

	@Override
	public boolean doNewChat(int loginId,int usersId) {
		String sql="UPDATE chat SET record =1 WHERE usersid ="+loginId+" and loginid="+usersId;
		Connection conn=BaseDao.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		boolean isFlag=false;
		try {
			pstmt=conn.prepareStatement(sql);
			if(pstmt.executeUpdate()>0)
			{
				isFlag=true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally
		{
			BaseDao.getClose(conn, pstmt, rs);
		}
		return isFlag;
	}

	@Override
	public List<Chat> getChatMes(int loginId) {
		List<Chat> list=new ArrayList<Chat>();
		String sql="select * from chat where usersid="+loginId +" and record=0 order by time desc";
		Connection conn=BaseDao.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				Chat chat=new Chat();
				chat.setContent(rs.getString("content"));
				chat.setId(rs.getInt("id"));
				chat.setLoginId(rs.getInt("loginId"));
				chat.setTime(rs.getString("time"));
				chat.setUsersId(rs.getInt("usersId"));
				list.add(chat);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally
		{
			BaseDao.getClose(conn, pstmt, rs);
		}
		return list;
	}
}
