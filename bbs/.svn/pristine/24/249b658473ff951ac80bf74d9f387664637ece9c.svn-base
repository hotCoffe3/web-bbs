package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bean.ContentType;
import dao.ContentTypeDao;
import dbc.BaseDao;

public class ContentTypeDaoImpl implements ContentTypeDao {
	public ContentType getContentTypeById(int id) {
		ContentType ct=new ContentType();
		String sql="select * from contenttype where id="+id;
		Connection conn=BaseDao.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				ct.setId(rs.getInt("id"));
				ct.setType(rs.getString("type"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally
		{
			BaseDao.getClose(conn, pstmt, rs);
		}
		return ct;
	}

}
