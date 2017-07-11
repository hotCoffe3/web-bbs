package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.UserFace;
import bean.Users;
import dao.UserFaceDao;
import dbc.BaseDao;

public class UserFaceDaoImpl implements UserFaceDao {

	@Override
	public boolean DoUserFace(UserFace userface) {
		String sql="insert into userface(userid,userface) values(?,?)";
		List<Object> ls=new ArrayList<Object>();
		ls.add(userface.getUsersId().getId());
		ls.add(userface.getFace());
		boolean isFlag=BaseDao.update(ls, sql);
		return isFlag;
	}

	@Override
	public boolean delUserFace(int id) {
		String sql="delete from userface where id=?";
		List<Object> ls=new ArrayList<Object>();
		ls.add(id);
		boolean isFlag=BaseDao.update(ls, sql);
		return isFlag;
	}

	@Override
	public UserFace findFacebyUser(Users user) {
		UserFace userface=new UserFace();
		String sql="select * from userface where userid="+user.getId();
		Connection conn=BaseDao.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				userface.setId(rs.getInt(1));
				userface.setUsersId(user);
				userface.setFace(rs.getString(3));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally
		{
			BaseDao.getClose(conn, pstmt, rs);
		}
		return userface;
	}

	@Override
	public boolean updateFace(UserFace userface, String userfaceimg) {
		String sql="update userface set userface=? where id=?";
		List<Object> ls=new ArrayList<Object>();
		ls.add(userfaceimg);
		ls.add(userface.getId());
		boolean isFlag=BaseDao.update(ls, sql);
		return isFlag;
	}

}
