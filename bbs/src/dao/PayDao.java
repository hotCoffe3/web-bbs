package dao;

import java.util.List;

import bean.Pay;

public interface PayDao {
	public List<Pay> findAllPayByUserid(int userid);//查找所有充值记录
	public Pay findPayByOrderId(String orderId);//通过账单号查找账单
	public boolean doPay(Pay pay);//生成充值账单
	public boolean delPay(Pay pay);//删除充值账单
	public boolean updatePayEndtime(int day,Pay pay);//更新账单
}
