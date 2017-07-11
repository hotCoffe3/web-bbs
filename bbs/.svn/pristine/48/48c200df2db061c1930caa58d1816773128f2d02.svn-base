<%@page import="bean.Login"%>
<%@page import="bean.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="../images/shortcut.ico" type="image/x-icon">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/index.css">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/forgetpassword.css">
<SCRIPT src="../js/forgetpassword.js" type="text/javascript"></SCRIPT>
<script type="text/javascript">
	function getTime() {
		var times=new Date();
		document.getElementById('time').innerHTML=new Date().toLocaleString()+
		' 星期'+'日一二三四五六'.charAt(new Date().getDay());
		window.setTimeout(getTime, 1000);
	}
	window.onload=getTime;
</script>
<style type="text/css">
	th{
		width: 150px;
		line-height: 25px;
		border-style: solid;
		border-color: blue;
		border-width: 1px;
	}
</style>
<title>用户信息</title>
</head>
<body>
	<img  id="logo" alt="logo" src="../images/06.jpg" style="width: 220px;height: 80px;">
   <marquee scrollamount="6" id="tip"><strong>BBS是一个面向中国软件和软件人的综合社区网站。我们希望您能够在BBS上交流、学习、进步。BBS的各项电子服务的所有权和运作权归家乐网络技术有限公司。 BBS提供的服务将完全按照其发布的章程、服务条款和操作规则严格执行。 会员必须完全同意所有服务条款并完成注册程序，才能成为BBS的正式注册会员并享受BBS提供的更全面的服务。</strong></marquee>
   <div id="menu"><a href="<%=request.getContextPath()%>/index.jsp" id="toIndex"><b>首页</b></a>
		<a href="<%=request.getContextPath()%>/page/login.jsp" id="toLogin"><b>登录</b></a>
		<a href="<%=request.getContextPath()%>/page/register.jsp" id="toRes"><b>注册</b></a></div>
   <hr>
	<span id="time">此处显示时间</span><span id="web"><span><b>首 &nbsp;&nbsp;&nbsp;页</b></span><span><b>学无止境</b></span><span><b>职来职往</b></span><span><b>游戏平台</b></span><span><b>社会交际</b></span><span><b>成为会员</b></span><span name="12"><b>关于我们</b></span></span>
		
		
		
		
		
		
		<!-- <img alt="" src="images/baidu.gif" id="baidu"> -->
		<form  action="<%=request.getContextPath() %>/searchServlet" method="get">
			<div id="selectDiv">
			<strong>条件：</strong>
				<select style="height: 35px;" name="select">
				    <option value="content">文章内容</option>
				    <option value="title">文章标题</option>
				    <option value="nickName">文章作者</option>
				</select>
			</div>
			<div id="textDiv">
				<strong id="s">关键字：</strong><input type="text" id="text" name="text" placeholder="请输入搜索内容" style="height: 30px;"/>	
				
			<input type="submit" id="search" value=""></div>	
		</form>
		
		
		<div id="message" style="margin-left: -30px;">
		   <div style="margin-left: 400px;position: relative;top:-300px;"><%Users users=(Users)session.getAttribute("allusermessage");
		   		  Login login=(Login)session.getAttribute("allloginmessage");%>
		   		<table style="border-style: solid;border-width: 1px;border-color: blue;">
		   			<caption style="border-style: solid;border-width: 1px;border-color: blue;">用户信息</caption>
		   			<tr>
		   				<th>
		   					<strong>注册用户</strong>
		   				</th>
		   				<th>
		   					<%=login.getNickName()%>
		   				</th>
		   			</tr>
		   			<tr>
		   				<th>
		   					<strong>注册密码</strong>
		   				</th>
		   				<th>
		   					<%=login.getPassword()%>
		   				</th>
		   			</tr>
		   			<tr>
		   				<th>
		   					<strong>家庭住址</strong>
		   				</th>
		   				<th>
		   					<%=users.getAddress()%>
		   				</th>
		   			</tr>
		   			<tr>
		   				<th>
		   					<strong>手机号码</strong>
		   				</th>
		   				<th>
		   					<%=users.getPhone()%>
		   				</th>
		   			</tr>
		   			<tr>
		   				<th>
		   					<strong>真实姓名</strong>
		   				</th>
		   				<th>
		   					<%=users.getName()%>
		   				</th>
		   			</tr>
		   		</table>
		   </div>
		</div>
</body>
</html>