package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bean.UsersType;
import dao.UsersTypeDao;
import dbc.BaseDao;

public class UsersTypeDaoImpl implements UsersTypeDao {
	public UsersType getUsersTypeById(int id) {
		UsersType ut=new UsersType();
		String sql="select * from usertype where id="+id;
		Connection conn=BaseDao.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				ut.setId(rs.getInt("id"));
				ut.setType(rs.getString("type"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally
		{
			BaseDao.getClose(conn, pstmt, rs);
		}
		return ut;
	}

}
