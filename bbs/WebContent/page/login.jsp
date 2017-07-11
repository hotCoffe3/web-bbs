<%@page import="java.util.ArrayList"%>
<%@page import="bean.UsersType"%>
<%@page import="java.util.List"%>
<%@page import="dao.impl.LoginDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="/WEB-INF/error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登陆页面</title>
<SCRIPT src="../fromweb/jquery-1.9.1.min.js" type="text/javascript"></SCRIPT>
<SCRIPT src="../js/login.js" type="text/javascript"></SCRIPT>
<link rel="stylesheet" type="text/css" href="../css/login.css" />
<link rel="shortcut icon" href="../images/shortcut.ico" type="image/x-icon">
</head>
<BODY>
			<DIV class="top_div"></DIV>
			<DIV style="background: rgb(255, 255, 255); margin: -100px auto auto; border: 1px solid rgb(231, 231, 231); border-image: none; width: 400px; height: 200px; text-align: center;">
			<DIV style="width: 165px; height: 96px; position: absolute;">
			<DIV class="tou"></DIV>
			<DIV class="initial_left_hand" id="left_hand"></DIV>
			<DIV class="initial_right_hand" id="right_hand"></DIV></DIV>
			<P style="padding: 30px 0px 10px; position: relative;"><SPAN 
			class="u_logo"></SPAN>         <INPUT name="ac" class="ipt" type="text" placeholder="请输入用户名" value="" onkeyup="checkaccount()">
			    </P>
			<P style="position: relative;"><SPAN class="p_logo"></SPAN>         
			<INPUT name="psd" class="ipt" id="password" type="password" placeholder="请输入密码" value="">   
			  </P>
			  <div id="ident">
			  <%LoginDaoImpl daoImpl=new LoginDaoImpl();
			  List<UsersType> list=new ArrayList<UsersType>();
			  list=daoImpl.findAll();
			  for(UsersType type:list)
			  {
			  %>
			  	<input type="radio" name="identify" value="<%=type.getType()%>" checked="<%if(type.getType().equals("普通会员")) {%>
			 checked<%} %>" ><%=type.getType()%><%
			  }%>
			  </div>
			<DIV style="height: 50px; line-height: 50px; margin-top: 30px; border-top-color: rgb(231, 231, 231); border-top-width: 1px; border-top-style: solid;">
			<P style="margin: 0px 35px 0px 45px;padding-top: 0px;"><SPAN style="float: left;"><A style="color:#0066CC" 
			href="forgetpassword.jsp">忘记密码?</A></SPAN> 
			           <SPAN style="float: right;"><A style="color:#0066CC; margin-right: 10px;" 
			href="register.jsp">注册</A>  
			              <A style="background: rgb(0, 142, 173); padding: 7px 10px; border-radius: 4px; border: 1px solid rgb(26, 117, 152); border-image: none; color: rgb(255, 255, 255); font-weight: bold;" 
			onclick="login()">登录</A><br/> <a href="../index.jsp">返回首页</a>
			           </SPAN>         </P></DIV></DIV>
					

</body>
</html>