package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.Register;
import bean.Users;
import bean.UsersType;
import dao.UsersDao;
import dbc.BaseDao;

public class UsersDaoImpl implements UsersDao {
	public Users getUsersById(int id) {
		Users users=new Users();
		String sql="select * from users where id="+id;
		Connection conn=BaseDao.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				users.setAddress(rs.getString("address"));
				users.setAge(rs.getInt("age"));
				users.setId(rs.getInt("id"));
				users.setMajor(rs.getString("major"));
				users.setName(rs.getString("name"));
				users.setPhone(rs.getString("phone"));
				users.setSchool(rs.getString("school"));
				users.setSex(rs.getString("sex"));
				users.setTypeId(new UsersTypeDaoImpl().getUsersTypeById(rs.getInt("typeId")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally
		{
			BaseDao.getClose(conn, pstmt, rs);
		}
		return users;
	}

	public List<Users> findAll()
	{
		List<Users> list=new ArrayList<Users>();
		
		String sql="select * from users";
		new BaseDao();
		Connection conn=BaseDao.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				Users users=new Users();
				users.setAddress(rs.getString("address"));
				users.setAge(rs.getInt("age"));
				users.setId(rs.getInt("id"));
				users.setMajor(rs.getString("major"));
				users.setName(rs.getString("name"));
				users.setPhone(rs.getString("phone"));
				users.setSchool(rs.getString("school"));
				users.setSex(rs.getString("sex"));
				users.setTypeId(new UsersTypeDaoImpl().getUsersTypeById(rs.getInt("typeId")));
				list.add(users);
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
	public String checkPhoneexist(String phone)
	{
		String sql="select phone from users where phone='"+phone+"'";
		Connection conn=BaseDao.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String str="";
		try
		{
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				str=rs.getString(1);
			}
		} catch (Exception e)
		{
			e.printStackTrace();
			// TODO: handle exception
		}
		finally
		{
			BaseDao.getClose(conn, pstmt, rs);
		}
		return str;
	}

	@Override
	public Users getUsersByPhone(String phone)
	{
		Users users=new Users();
		String sql="select * from users where phone='"+phone+"'";
		new BaseDao();
		Connection conn=BaseDao.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				users.setAddress(rs.getString("address"));
				users.setAge(rs.getInt("age"));
				users.setId(rs.getInt("id"));
				users.setMajor(rs.getString("major"));
				users.setName(rs.getString("name"));
				users.setPhone(rs.getString("phone"));
				users.setSchool(rs.getString("school"));
				users.setSex(rs.getString("sex"));
				users.setTypeId(new UsersTypeDaoImpl().getUsersTypeById(rs.getInt("typeId")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally
		{
			BaseDao.getClose(conn, pstmt, rs);
		}
		return users;
	}

	@Override
	public Users getUsers(String sql)
	{
		Users users=new Users();
		Connection conn=BaseDao.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				users.setAddress(rs.getString("address"));
				users.setAge(rs.getInt("age"));
				users.setId(rs.getInt("id"));
				users.setMajor(rs.getString("major"));
				users.setName(rs.getString("name"));
				users.setPhone(rs.getString("phone"));
				users.setSchool(rs.getString("school"));
				users.setSex(rs.getString("sex"));
				users.setTypeId(new UsersTypeDaoImpl().getUsersTypeById(rs.getInt("typeId")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally
		{
			BaseDao.getClose(conn, pstmt, rs);
		}
		return users;
	}

	@Override
	public Users getUsers(Register register) {	
		return new UsersDaoImpl().getUsersByPhone(register.getPhone());
	}

	@Override
	public boolean fixUsersMessage(int usersid, String address) {
		boolean isFlag=false;
		String sql="update users set address='"+address+"' where id="+usersid;
		Connection conn=BaseDao.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			pstmt=conn.prepareStatement(sql);
			if(pstmt.executeUpdate()>0)
			{
				isFlag=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally
		{
			BaseDao.getClose(conn, pstmt, rs);
		}
		return isFlag;
	}

	@Override
	public boolean fixUsersPassword(int usersid, String password) {
		boolean isFlag=false;
		String sql="update login set password='"+password+"' where usersid="+usersid;
		Connection conn=BaseDao.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			pstmt=conn.prepareStatement(sql);
			if(pstmt.executeUpdate()>0)
			{
				isFlag=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally
		{
			BaseDao.getClose(conn, pstmt, rs);
		}
		return isFlag;
	}

	@Override
	public boolean updateUsersType(int typeid,int userid) {
		String sql="update users set typeid=? where id=?";
		List<Object> ls=new ArrayList<Object>();
		ls.add(typeid);
		ls.add(userid);
		boolean isFlag=BaseDao.update(ls, sql);
		return isFlag;
	}
}
