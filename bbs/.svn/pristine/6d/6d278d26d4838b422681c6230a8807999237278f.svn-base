package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Login;
import bean.Users;
import bean.UsersType;
import dao.LoginDao;
import dbc.BaseDao;

public class LoginDaoImpl implements LoginDao
{
	public List<Login> login(String nickname)
	{
		List<Login> list=new ArrayList<Login>();
		Connection conn=BaseDao.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from login where nickname='"+nickname+"'";
		
		try
		{
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs!=null)
			{
				while(rs.next())
				{
					Login login=new Login(rs.getInt("id"),rs.getString("nickname"),new LoginDaoImpl().findtypeBytypeid(rs.getInt("usertype")),rs.getString("password"),rs.getInt("usersid"));
					
					list.add(login);
				}
			}
		} catch (Exception e)
		{
			e.printStackTrace();
			// TODO: handle exception
		}
		finally{
			BaseDao.getClose(conn, pstmt, rs);
		}
		return list;
	}
//	public static void main(String[] args)
//	{
//		List<Login> list=new ArrayList<Login>();
//		list=new LoginDaoImpl().login("wenge");
//		System.out.println(list.size());
//		for(Login login:list)
//		{
//			System.out.println(login.getNickName()+" "+login.getPassword());
//		}
//	}

	public UsersType findtypeBytypeid(int typeid)
	{
		UsersType type=null;
		Connection conn=BaseDao.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try
		{
			String sql="select type from usertype where id="+typeid;
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				type=new UsersType(typeid,rs.getString("type"));
			}
		} catch (Exception e)
		{
			// TODO: handle exception
		}
		finally
		{
			BaseDao.getClose(conn, pstmt, rs);
		}
		return type;
	}

	public List<UsersType> findAll()
	{
		List<UsersType> list=new ArrayList<UsersType>();
		String sql="select * from usertype";
		Connection conn=BaseDao.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try
		{
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				UsersType type=new UsersType(rs.getInt(1),rs.getString(2));
				list.add(type);
			}
			
		} catch (Exception e)
		{
			// TODO: handle exception
		}
		return list;
	}

	public List<Login> findAllAccount()
	{
		List<Login> list=new ArrayList<Login>();
		String sql="select * from login";
		Connection conn=BaseDao.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try
		{
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				Login login=new Login(rs.getInt("id"),rs.getString("nickname"),new UsersTypeDaoImpl().getUsersTypeById(rs.getInt("usertype")),rs.getString("password"),rs.getInt("usersid"));
				list.add(login);
			}
			
		} catch (Exception e)
		{
			// TODO: handle exception
		}
		return list;
	}

	public Login findNickNameByUsersId(int usersId) {
		Login login=new Login();
		String sql="select * from login where usersid="+usersId;
		Connection conn=BaseDao.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try
		{
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				login.setId(rs.getInt("id"));
				login.setNickName(rs.getString("nickName"));
				login.setPassword(rs.getString("password"));
				login.setTypeid(new UsersTypeDaoImpl().getUsersTypeById(rs.getInt("id")));
				login.setUsersId(usersId);
			}
			
		} catch (Exception e)
		{
			// TODO: handle exception
		}
		return login;
	}

	public List<Login> findNickName(String nickName) {
		List<Login> list=new ArrayList<Login>();
		Connection conn=BaseDao.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		if(nickName==null||nickName.equals(""))
		{
			nickName="nickName";
		}
		String sql="select * from login where upper(nickname)=upper('"+nickName+"')";
		
		try
		{
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs!=null)
			{
				while(rs.next())
				{
					Login login=new Login();
					login.setId(rs.getInt("id"));
					login.setNickName(rs.getString("nickName"));
					login.setPassword(rs.getString("password"));
					login.setTypeid(new UsersTypeDaoImpl().getUsersTypeById(rs.getInt("usertype")));
					login.setUsersId(rs.getInt("usersId"));
					list.add(login);
				}
			}
		} catch (Exception e)
		{
			e.printStackTrace();
			// TODO: handle exception
		}
		finally{
			BaseDao.getClose(conn, pstmt, rs);
		}
		return list;
	}

	@Override
	public Login keeploginmessage(String nickname)
	{
		List<Login> list=new ArrayList<Login>();
		list=new LoginDaoImpl().findAllAccount();
		Login login=null;
		if(list.size()>0)
		{
			for(Login l:list)
			{
				login=new Login(l.getId(), l.getNickName(), l.getTypeid(), l.getPassword(), l.getUsersId());
			}
		}
		return login;
	}

	@Override
	public Login findLoginByUserId(int userid) {
		Login lo=new Login();
		Connection conn=BaseDao.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from login where usersid="+userid;
		try
		{
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs!=null)
			{
				if(rs.next())
				{
					lo.setId(rs.getInt("id"));
					lo.setNickName(rs.getString("nickName"));
					lo.setPassword(rs.getString("password"));
					lo.setTypeid(new UsersTypeDaoImpl().getUsersTypeById(rs.getInt("usertype")));
					lo.setUsersId(rs.getInt("usersId"));
				}
			}
		} catch (Exception e)
		{
			e.printStackTrace();
			// TODO: handle exception
		}
		finally{
			BaseDao.getClose(conn, pstmt, rs);
		}
		return lo;
	}

	@Override
	public boolean updateUsertype(int typeid,Users user) {
		String sql="update login set usertype=? where usersid=?";
		List<Object> ls=new ArrayList<Object>();
		ls.add(typeid);
		ls.add(user.getId());
		boolean isFlag=BaseDao.update(ls, sql);
		return isFlag;
	}
}
