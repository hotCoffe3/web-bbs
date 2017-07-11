package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.Post;
import dao.IndexShowDao;
import dbc.BaseDao;

public class IndexShowDaoImpl implements IndexShowDao {
	public List<Post> getIndexShow(int num) {
		
		List<Post> list=new ArrayList<Post>();
		String sql="select * from(select count(postid)as s,postid"
				+ "  from discuss group by postid order by s desc)where rownum<="+num;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		conn=BaseDao.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				Post post=new PostDaoImpl().getPostByid(rs.getInt("postId"));
				post.setCount(rs.getInt("s"));//存储评论条数
				list.add(post);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Post> getIndexNew(int num) {
		List<Post> list=new ArrayList<Post>();
		String sql="select * from (select * from post order by time desc) where rownum<="+num;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		conn=BaseDao.getConnection();
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
				post.setUsersId(new UsersDaoImpl().getUsersById(rs.getInt("usersId")));
				post.setTypeId(new ContentTypeDaoImpl().getContentTypeById(rs.getInt("typeId")));
				//post.setCount(rs.getInt("s"));//存储评论条数
				list.add(post);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return list;
	}

}
