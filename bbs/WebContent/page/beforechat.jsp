<%@page import="bean.Chat"%>
<%@page import="service.impl.NewsServiceImpl"%>
<%@page import="bean.Users"%>
<%@page import="action.FindMessage"%>
<%@page import="bean.Register"%>
<%@page import="bean.Login"%>
<%@page import="service.impl.LoginServiceImpl"%>
<%@page import="service.LoginService"%>
<%@page import="java.util.*"%>
<%@page import="bean.Post"%>
<%@page import="service.impl.IndexShowServiceImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="/WEB-INF/error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<SCRIPT src="./fromweb/jquery-1.9.1.min.js" type="text/javascript"></SCRIPT>
<SCRIPT src="js/index.js" type="text/javascript"></SCRIPT>
<script type="text/javascript">
	function getTime() {
		var times=new Date();
		document.getElementById('time').innerHTML=new Date().toLocaleString()+
		' 星期'+'日一二三四五六'.charAt(new Date().getDay());
		window.setTimeout(getTime, 1000);
	}
	window.onload=getTime;
</script>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/index.css">
</head>
<body>
   <img  id="logo" alt="logo" src="/bbs/images/06.jpg" style="width: 220px;height: 80px;">
   <marquee scrollamount="6" id="tip"><strong>BBS是一个面向中国软件和软件人的综合社区网站。我们希望您能够在BBS上交流、学习、进步。BBS的各项电子服务的所有权和运作权归家乐网络技术有限公司。 BBS提供的服务将完全按照其发布的章程、服务条款和操作规则严格执行。 会员必须完全同意所有服务条款并完成注册程序，才能成为BBS的正式注册会员并享受BBS提供的更全面的服务。</strong></marquee>
   <%if(session.getAttribute("login").toString().equals("没登录"))
	   {
	%>
	<div id="menu">
		<a href="<%=request.getContextPath()%>/page/login.jsp" id="toLogin"><b>登录</b></a><b>/</b>
		<a href="<%=request.getContextPath()%>/page/register.jsp" id="toRes"><b>注册</b></a>
	</div>
	<%}else
		{
	%>
		<div id="menu">欢迎，
		<a href="/bbs/showUsersMessageServlet?biaozhi=haha&usersId=<%=session.getAttribute("loginId")%>" id="toLogin"><b><%=((Register)session.getAttribute("ClientMessageAfterLogin")).getAccount()%></b></a>
		<a href=".././checkout" id="toRes"><b>注销</b></a>
	</div>
	<%} %>
   <hr>
	<span id="time">此处显示时间</span>
	<span id="web">
		<span onmousemove="st(this)" onmouseout="reflash(this)">
 		<%
  			 if(session.getAttribute("login").toString().equals("没登录"))
	  		 {
		%>
			<b><a href="<%=request.getContextPath()%>/index.jsp">首 &nbsp;&nbsp;页</a></b>
			<%}else{ %>
			<b><a href="/bbs/NewsServlet">首 &nbsp;&nbsp;页</a></b>
			<%} %>
		</span>
		<span onmousemove="st(this)"  onmouseout="reflash(this)">
			<b><a href="/bbs/TypePageServlet?typeId=1&method=homePage">学无止境</a></b>
		</span>
		<span onmousemove="st(this)" onmouseout="reflash(this)">
			<b><a href="/bbs/TypePageServlet?typeId=2&method=homePage">职来职往</a></b>
		</span>
		<span onmousemove="st(this)"  onmouseout="reflash(this)">
			<b><a href="/bbs/TypePageServlet?typeId=4&method=homePage">游戏平台</a></b>
		</span><span onmousemove="st(this)"  onmouseout="reflash(this)">
			<b><a href="/bbs/TypePageServlet?typeId=3&method=homePage">社会交际</a></b>
		</span><span onmousemove="st(this)"  onmouseout="reflash(this)">
			<b><a href="">成为会员</a></b>
		</span>
		<span onmousemove="st(this)"  onmouseout="reflash(this)">
			<b><a href="">关于我们</a></b>
		</span>
	</span>		
		
		
		
		
		
		<!-- <img alt="" src="images/baidu.gif" id="baidu"> -->
		<form  action="<%=request.getContextPath() %>/searchServlet" method="get">
			<div id="selectDiv">
			<strong>条件：</strong>
				<select style="height: 35px;" name="select">
				    <option value="title">文章标题</option>
				    <option value="nickName">文章作者</option>
				</select>
			</div>
			<div id="textDiv">
				<strong id="s">关键字：</strong><input type="text" id="text" name="text" placeholder="请输入搜索内容" style="height: 30px;"/>	
				
			<input type="submit" id="search" value=""></div>	
		</form>
		<span id="box">
		<div id="list">
			<ul>
				<li><a>热门精品</a></li>
				<li><a>游戏达人</a></li>
				<li><a>吃货世界</a></li>
				<li><a>招聘精英</a></li>
				<li><a>学霸空间</a></li>
				<li><a>轻松交际</a></li>
			</ul>
		</div>
		</span>
		<div id="showSearch">
			<ul>
			<%
			int usersId=1;
			if(session.getAttribute("recordNews")==session.getAttribute("0"))
			{
				out.print("<h4>哎呀<h4/>你还没有新留言");
			}else
			{
				out.print("<h4>你有以下新留言<h4/>");
			List<Chat> list=(List<Chat>)session.getAttribute("chatList");
				for (Chat chat:list) {
					usersId=chat.getUsersId();
			%>
				<li style="border:dashed 1px; border-color:#d7fbf6; background-color:#d7fbf6; margin-bottom:10px; width: 650px; height: 120px;">
					<div id="aPost">
					<br/>
					<div>
						<%
							if(chat.getContent().length()<20){
							out.println(chat.getContent());
							}
							else
							{
								out.println(chat.getContent().substring(0, 18)+"...");
							}
						%>
					</div>
						<div id="usersDate">
						<div id="nickName">
						<%=new LoginServiceImpl().findNickNameByUsersId(chat.getLoginId()).getNickName() %>
						</div>
						<div id="date"><%=chat.getTime()%></div>
							<div><br/><a href="/bbs/ChatServlet?usersId=<%=chat.getLoginId()%>">点击回复</a></div>
						</div>
					</div>
				</li>
			<%
					}}
			%>
			</ul>
	</div>
	<div id="info">
	<%String name= (String)session.getAttribute("nickName");
	Users users=(Users)session.getAttribute("showUsers");%>
	<img title="<%=name %>" src="/bbs/images/touxiang.png" id="touxiang" name="touxiang">
	<br/><br/>&nbsp;用户：<%= name%>
	<br/><br/>&nbsp;性别：<%= users.getSex()%>
	<br/><br/>&nbsp;学校：<%=users.getSchool() %>
	<br/><br/>&nbsp;专业：<%=users.getMajor()%>
	  </div>
		
</body>
</html>