package dbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

public class BaseDao
{
	private static final String url="jdbc:oracle:thin:@127.0.0.1:1521:orcl";
	private static final String user="bbs";
	private static final String password="123456";
	public static  Connection getConnection()
	{
		
		
		Connection conn=null;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn=DriverManager.getConnection(url, user, password);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public static  void getClose(Connection conn,PreparedStatement pstmt,ResultSet rs)
	{
		try {
			if(rs!=null)
			{
				rs.close();
			}
			if(pstmt!=null)
			{
				pstmt.close();
			}
			if(conn!=null)
			{
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static boolean update(List<Object> ls,String sql)
	{
		boolean isflag=false;
		Connection conn=BaseDao.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try
		{
			pstmt=conn.prepareStatement(sql);
			if(ls.size()>0)
			{
				for(int i=0;i<ls.size();i++)
				{
					pstmt.setObject(i+1,ls.get(i));
				}
			}
			int num=pstmt.executeUpdate();
			if(num>0)
				isflag=true;
		} 
		catch (Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			BaseDao.getClose(conn, pstmt, rs);
		}
		return isflag;
	}
}
