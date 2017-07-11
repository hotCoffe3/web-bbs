package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.Login;
import bean.Users;
import bean.UsersType;
import dao.Registerdao;
import dbc.BaseDao;

public class RegisterDaoImpl implements Registerdao
{

	public boolean doNewUser(Users user)
	{
		boolean isFlag=false;
		Connection conn=BaseDao.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try
		{
			String sql="insert into users(name,address,sex,phone,age,school,major,typeid) values(?,?,?,?,?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getAddress());
			pstmt.setString(3, user.getSex());
			pstmt.setString(4, user.getPhone());
			pstmt.setInt(5, user.getAge());
			pstmt.setString(6, user.getSchool());
			pstmt.setString(7, user.getMajor());
			pstmt.setInt(8, user.getTypeId().getId());
			int num=pstmt.executeUpdate();
			if(num>0)
			{
				isFlag=true;
			}
		} catch (Exception e)
		{
			e.printStackTrace();
			// TODO: handle exception
		}
		finally{
			BaseDao.getClose(conn, pstmt, rs);
		}
		return isFlag;
	}

	public boolean doNewLogin(Login login)
	{
		boolean isFlag=false;
		Connection conn=BaseDao.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try
		{
			String sql="insert into login(nickname,password,usertype,usersid) values(?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, login.getNickName());
			pstmt.setString(2, login.getPassword());
			pstmt.setInt(3, login.getTypeid().getId());
			pstmt.setInt(4, login.getUsersId());
			int num=pstmt.executeUpdate();
			if(num>0)
			{
				isFlag=true;
			}
		} catch (Exception e)
		{
			e.printStackTrace();
			// TODO: handle exception
		}
		finally{
			BaseDao.getClose(conn, pstmt, rs);
		}
		return isFlag;
	}
	public static void main(String[] args)
	{
		new RegisterDaoImpl().doNewUser(new Users(0, "jiale", "guangg", "female", "12345678910", 12, "guanggong", "diank",new UsersType(4, "普通用户")));
	}
}
