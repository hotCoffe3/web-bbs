package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.Chat;
import bean.Discuss;
import dao.ChatDao;
import dbc.BaseDao;

public class ChatDaoImpl implements ChatDao {

	@Override
	public boolean sendMessage(Chat chat) {
		String sql="insert into chat(loginid,content,time,usersid) values(?,?,TO_DATE(?,'yyyy-mm-dd hh24:mi:ss'),?)";
		List<Object> ls=new ArrayList<Object>();
		ls.add(chat.getLoginId());
		ls.add(chat.getContent());
		ls.add(chat.getTime());
		ls.add(chat.getUsersId());
		boolean isFlag=BaseDao.update(ls, sql);
		return isFlag;
	}

	@Override
	public List<Chat> getMessage(int loginId,int usersId) {
		List<Chat> list=new ArrayList<Chat>();
		
		String sql="select * from chat where loginid="+loginId+" and usersid="+usersId+
				" or loginid="+usersId+" and usersid="+loginId+" order by time";
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
				chat.setLoginId(rs.getInt("loginid"));
				chat.setTime(rs.getString("time"));
				chat.setUsersId(rs.getInt("usersid"));
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
