<%@page import="action.FindMessage"%>
<%@page import="bean.Users"%>
<%@page import="bean.Register"%>
<%@page import="bean.Login"%>
<%@page import="service.impl.LoginServiceImpl"%>
<%@page import="bean.Post"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="/WEB-INF/error.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人信息</title>
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
<script type="text/javascript" >
function jump()
{
	var te=document.getElementById("jumpname").value;
	if(te=="")
		{
			alert("您还未输入跳转页码数");
		}
	else
		{
			location.href="usersPostPagingServlet?method=jump&jumpname="+te;
		}
}



function del(obj)
{ 
	var str=obj.className;
	var box=str.split(";");
	var t=box[0];
	var t2=box[1];
	var d=t.split("=");
	var v=t2.split("=");
	var usersId=d[1];
	var postId=v[1];
	
	if(confirm("你确定要删除此贴吗？删除后将不能恢复！"))
	{
				var http_request=false;
				if(window.XMLHttpRequest)//对于非IE浏览器
				{
					http_request=new XMLHttpRequest();
				}
				else if(window.ActiveXObject)//IE浏览器
				{
					try
					{
					   http_request=new ActiveXObject("Msxml2.XMLHTTP");//不同版本的IE
					}
					catch (e) 
					{
						try
						{
							http_request=new ActiveOXBject("Microsoft.XMLHTTP");//不同版本的IE
						} 
						catch (e) 
						{
							
						}
					}
				}
				if(!http_request)
				{
					alert("不能创建XMLHttpRequest对象实例！");
					return false;
				}
				 http_request.open("get","./delete?=usersId"+usersId+"&postId="+postId,true);
				 function getResult()
					{
						if(http_request.readyState==4)
						{
							if(http_request.status==200)
							{
								if(http_request.responseText=="1")
						    	{
						    		alert("删除成功！");
						    		obj.style.display="none";
						    		obj.parentNode.style.display="none";
						    		obj.parentNode.parentNode.style.display="none";
						    		obj.parentNode.parentNode.parentNode.style.display="none";
						    	}
						    	else{
						    		alert("删除失败！");
						    	}
							}
							else
							{
								alert("你所请求的页面有错误！");
							}
						}
					}
				 http_request.onreadystatechange=getResult;
				 http_request.send(null);
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
		<a href="<%=request.getContextPath()%>/index.jsp" id="toIndex"><b>首页</b></a>
		<a href="<%=request.getContextPath()%>/page/login.jsp" id="toLogin"><b>登录</b></a><b>/</b>
		<a href="<%=request.getContextPath()%>/page/register.jsp" id="toRes"><b>注册</b></a>
	</div>
	<%}else
		{
	%>
		<div id="menu"><a href="<%=request.getContextPath()%>/index.jsp" id="toIndex"><b>首页</b></a>
		你有<a href="/bbs/page/showNews.jsp"><%=session.getAttribute("s")%></a> 信息。欢迎，
		<a href="/bbs/showUsersMessageServlet?biaozhi=1&usersId=<%=session.getAttribute("loginId")%>" id="toLogin"><b><%=((Register)session.getAttribute("ClientMessageAfterLogin")).getAccount()%></b></a>
		<a href="/bbs/logoutServlet" id="toRes"><b>注销</b></a>
	</div>
	<%if(session.getAttribute("panduan")==session.getAttribute("loginId"))
		{
		%>
	<div id="fixUsersMessage"><a href="/bbs/page/fixPassword.jsp">修改个人信息</a></div>
	<%}
	else
	{%>
		<div id="fixUsersMessage"><a href="/bbs/ChatServlet?usersId=<%=session.getAttribute("panduan") %>">留言</a></div>
	<% }}%>
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
				    <option value="content">文章内容</option>
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
			int postId=1;
			if(request.getAttribute("noSearchTow")==("noSearchTow"))
			{
				%>
				<h4>这个人很懒</h4>
				真不走运，该用户没有发表过任何贴。
				<% 
			}else
			{
			List<Post> list=(List<Post>)request.getSession().getAttribute("usersPostList");
			int endPage=(Integer)request.getAttribute("endPage");
			int startPage=(Integer)request.getAttribute("startPage")-1;
				for (int i=startPage;i<endPage;i++) {
					Post post=list.get(i);
					String contentStr=new FindMessage().findmessage(post.getContent());
					postId=post.getId();
					usersId=post.getUsersId().getId();
			%>
				<li style="border:dashed 1px; border-color:#d7fbf6; background-color:#d7fbf6; margin-bottom:10px; width: 650px; height: 120px;">
					<div id="aPost">
					<br/>
						<div id="title"><a href="/bbs/GetPostMessage?postId=<%=postId %>"><%=post.getTitle() %></a></div>
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
						<%if(session.getAttribute("loginId")==(Object)usersId )
						{
						%>
						<div id="deletePost">
							<input  type="button" value="删除" class="usersId=<%=postId %>;postId=<%=postId %>" onclick="del(this)">
						</div>
						<%} %>
						<div id="usersDate">
						<div id="nickName">
							<a href="/bbs/showUsersMessageServlet?usersId=<%=usersId%>&postId=<%=postId %>">
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
		<div id="paging">&nbsp;&nbsp;&nbsp;<a href="usersPostPagingServlet?method=homePage">首页</a>
		<a href="usersPostPagingServlet?method=lastPaging">${lastPage}</a>
		<a href="usersPostPagingServlet?method=nextPaging">${nextPage }</a>	
		<a href="usersPostPagingServlet?method=endPage">尾页</a>
		&nbsp;第${current}/${totlePage}页
		跳转到第<input type="text" id="jumpname" size="2"/>页
		<input type="button" value="确定" onclick="jump()" style="background-color: #317ef3;color: white;width: 70px;height: 22px">
		&nbsp;<a href="/bbs/index.jsp">返回网站首页</a>
		</div>
	</div>
	<div id="info">
	<%String name= (String)session.getAttribute("nickName");
	Users users=(Users)session.getAttribute("showUsers");%>
	<c:choose>
		<c:when test="${(sessionScope.userface.face==null||sessionScope.userface.face=='')&&sessionScope.currentUser.sex=='男'}">
			<img alt="" src="${pageContext.request.contextPath}/images/face_img/user0.gif" style="width: 100px;height: 100px;">
		</c:when>
		<c:when test="${(sessionScope.userface.face==null||sessionScope.userface.face=='')&&sessionScope.currentUser.sex=='女'}">
			<img alt="" src="${pageContext.request.contextPath}/images/face_img/user1.gif" style="width: 100px;height: 100px;">
		</c:when>
		<c:otherwise>
			<img alt="" src="${pageContext.request.contextPath}/${sessionScope.userface.face}" style="width: 100px;height: 100px;">
		</c:otherwise>
	</c:choose>
	<br/><br/>&nbsp;用户：<a href="/bbs/showUsersMessageServlet?usersId=<%=usersId%>&postId=<%=postId %>"><%= name%></a>
	<br/><br/>&nbsp;性别：<%= users.getSex()%>
	<br/><br/>&nbsp;学校：<%=users.getSchool() %>
	<br/><br/>&nbsp;专业：<%=users.getMajor()%>
	</div>
</body>
</html>