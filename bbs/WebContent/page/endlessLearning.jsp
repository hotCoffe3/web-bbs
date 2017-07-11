<%@page import="action.FindMessage"%>
<%@page import="bean.Register"%>
<%@page import="service.impl.LoginServiceImpl"%>
<%@page import="bean.Post"%>
<%@page import="java.util.List"%>
<%@page import="bean.Login"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="/WEB-INF/error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=request.getAttribute("titleName") %></title>
<SCRIPT src="<%=request.getContextPath()%>/fromweb/jquery-1.9.1.min.js" type="text/javascript"></SCRIPT>
<SCRIPT src="<%=request.getContextPath()%>/js/index.js" type="text/javascript"></SCRIPT>
<script type="text/javascript">
	function getTime() {
		var times=new Date();
		document.getElementById('time').innerHTML=new Date().toLocaleString()+
		' 星期'+'日一二三四五六'.charAt(new Date().getDay());
		window.setTimeout(getTime, 1000);
	}
	window.onload=getTime;
</script>
<script type="text/javascript">
function jump()
{
	var te=document.getElementById("jumpname").value;
	if(te=="")
		{
			alert("您还未输入跳转页码数");
		}
	else
		{
		location.href="TypePageServlet?method=jump&typeId="+<%=request.getAttribute("typeId")%>+"&jumpname="+te;
		}
}
</script>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/index.css">
</head>
<body>
   <img  id="logo" alt="logo" src="<%=request.getContextPath()%>/images/06.jpg" style="width: 220px;height: 80px;">
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
		<div id="menu">你有<a href="/bbs/page/showNews.jsp"><%=session.getAttribute("s")%></a> 信息。欢迎，
		<a href="/bbs/showUsersMessageServlet?usersId=<%=session.getAttribute("loginId")%>" id="toLogin"><b><%=((Register)session.getAttribute("ClientMessageAfterLogin")).getAccount()%></b></a>
		<a href="/bbs/checkout" id="toRes"><b>注销</b></a>
	</div>
	<%}%>
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
			String str=(String)request.getAttribute("str");
			if(str==null)
			{
				%>
				<h4>欢迎来到虚无.</h4>
				真不巧，本版块还没有贴子，快去发一个吧！
				<%
			}
			else
			{
			List<Post> list=(List<Post>)request.getAttribute("list");
			for(Post post:list){
				String contentStr=new FindMessage().findmessage(post.getContent());
			%>
				<li style="border:dashed 1px; border-color:#d7fbf6; background-color:#d7fbf6; margin-bottom:10px; width: 650px; height: 120px;">
					<div id="aPost">
					<br/>
						<div id="title"><a href="/bbs/GetPostMessage?postId=<%=post.getId() %>"><%=post.getTitle() %></a></div>
						<div id="content">&nbsp;&nbsp;
						<%
							if(contentStr.length()<20){
							out.println(contentStr);
							}
							else
							{
								out.println(contentStr.substring(0, 18)+"...");
							}
						%>
						</div>
						<div id="usersDate">
							<div id="nickName">
							<a href="/bbs/showUsersMessageServlet?usersId=<%=post.getUsersId().getId()%>&postId=<%=post.getId()%>">
								<img alt="" src="<%=request.getContextPath() %>/images/head.png"><%=new LoginServiceImpl().findNickNameByUsersId(post.getUsersId().getId()).getNickName() %>
							</a>
							</div>
							<div id="date"><%=post.getDate() %></div>
						</div>
					</div>
				</li>
			<%
				}}
			%>
			</ul>
			&nbsp;&nbsp;&nbsp;<a href="TypePageServlet?method=homePage&typeId=<%=request.getAttribute("typeId")%>">首页</a>
			<a href="TypePageServlet?method=lastPaging&typeId=<%=request.getAttribute("typeId")%>">${lastPage}</a>
			<a href="TypePageServlet?method=nextPaging&typeId=<%=request.getAttribute("typeId")%>">${nextPage }</a>	
			<a href="TypePageServlet?method=endPage&typeId=<%=request.getAttribute("typeId")%>">尾页</a>
			&nbsp;第${current}/${totlePage}页
			跳转到第<input type="text" id="jumpname" size="2"/>页
			<input type="button" value="确定" onclick="jump()" style="background-color: #317ef3;color: white;width: 70px;height: 22px">
			&nbsp;<a href="/bbs/index.jsp">返回网站首页</a>
		</div>
		
		
</body>
</html>