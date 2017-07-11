package action;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Pay;
import bean.Users;
import cn.itcast.commons.CommonUtils;
import dao.impl.PayDaoImpl;


public class CreatePay extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int money=Integer.parseInt((String)request.getParameter("paymon"));
		if(request.getSession().getAttribute("currentUser")!=null){
			Users currentUser=(Users)request.getSession().getAttribute("currentUser");
			Pay pay=new Pay();
			String orderId=CommonUtils.uuid();
			pay.setUserId(currentUser);
			pay.setPayUUId(orderId);
			pay.setPayTime(new Date().toLocaleString());
			pay.setMoney(money);
			boolean isflag=new PayDaoImpl().doPay(pay);
			if(isflag){
				response.getWriter().print(pay.getPayUUId()+","+pay.getPayTime());
//				Pay pay1=new Pay();
//				pay1=new PayDaoImpl().findPayByOrderId(pay.getPayUUId());
//				System.out.println(pay1.getPayTime());
			}
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
	}	
}
