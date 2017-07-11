package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import bean.Pay;
import dao.PayDao;
import dbc.BaseDao;

public class PayDaoImpl implements PayDao {

	@Override
	public boolean doPay(Pay pay) {
		String sql="insert into pay(userid,paytime,payuuid,money) values(?,TO_DATE(?,'yyyy-mm-dd hh24:mi:ss'),?,?)";
		List<Object> ls=new ArrayList<Object>();
		ls.add(pay.getUserId().getId());
		ls.add(pay.getPayTime());
		ls.add(pay.getPayUUId());
		ls.add(pay.getMoney());
		boolean isFlag=BaseDao.update(ls, sql);
		return isFlag;
	}

	@Override
	public List<Pay> findAllPayByUserid(int userid){
		List<Pay> lg=new ArrayList<Pay>();
		String sql="select * from pay where userid="+userid;
		Connection conn=BaseDao.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				Pay pay=new Pay();
				pay.setId(rs.getInt(1));
				pay.setUserId(new UsersDaoImpl().getUsersById(rs.getInt(2)));
				pay.setPayTime(rs.getString(3));
				pay.setEndTime(rs.getString(4));
				pay.setPayUUId(rs.getString(5));
				pay.setMoney(rs.getInt(6));
				lg.add(pay);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally
		{
			BaseDao.getClose(conn, pstmt, rs);
		}
		return lg;
	}

	@Override
	public boolean delPay(Pay pay) {
		String sql="delete from pay where id=?";
		List<Object> ls=new ArrayList<Object>();
		ls.add(pay.getId());
		boolean isFlag=BaseDao.update(ls, sql);
		return isFlag;
	}

	@Override
	public boolean updatePayEndtime(int day,Pay pay) {
		String sql="update pay set endtime=paytime+? where id=?";
		List<Object> ls=new ArrayList<Object>();
		ls.add(day);
		ls.add(pay.getId());
		boolean isFlag=BaseDao.update(ls, sql);
		return isFlag;
	}

	@Override
	public Pay findPayByOrderId(String orderId) {
		Pay pay=new Pay();
		String sql="select * from pay where payuuid='"+orderId+"'";
		Connection conn=BaseDao.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				pay.setId(rs.getInt(1));
				pay.setUserId(new UsersDaoImpl().getUsersById(rs.getInt(2)));
				pay.setPayTime(rs.getString(3));
				pay.setEndTime(rs.getString(4));
				pay.setPayUUId(rs.getString(5));
				pay.setMoney(rs.getInt(6));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally
		{
			BaseDao.getClose(conn, pstmt, rs);
		}
		return pay;
	}

}
