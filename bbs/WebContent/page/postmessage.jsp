<%@page import="action.FindMessage"%>
<%@page import="dao.impl.LoginDaoImpl"%>
<%@page import="bean.Users"%>
<%@page import="bean.Discuss"%>
<%@page import="bean.Register"%>
<%@page import="bean.Login"%>
<%@page import="service.impl.LoginServiceImpl"%>
<%@page import="service.LoginService"%>
<%@page import="bean.Post"%>
<%@page import="bean.UserFace"%>
<%@page import="service.impl.IndexShowServiceImpl"%>
<%@page import="dao.impl.UserFaceDaoImpl"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" errorPage="/WEB-INF/error.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="css/bootstrap-responsive.css" rel="stylesheet" />
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
			location.href="GetPostMessage?method=jump&postId="+<%= request.getAttribute("postId")%>+"&jumpname="+te;
		}
	}
</script>
	<script type="text/javascript">

		function saveReply(){
			var text1=document.getElementById("Content").value;
			if('${sessionScope.loginId}'==''){
				alert("请先登陆，再回帖！");
				return false;
			}
			if (text1.length<10) {
				alert("最少输入10个字符！");
				return false;
			}
			if (text1.length>1000) {
				alert("最多输入1000个字符！");
				return false;
			}
			else{
				return true;
			}
		}
		
		function ajaxforAddContent()
		{
			var replyContent=document.getElementById("Content").value;
			var http_request=false;
			if(saveReply()==true)
			{
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
							throw e;
						}
					}
				}
				if(!http_request)
				{
					alert("不能创建XMLHttpRequest对象实例！");
					return false;
				}
				
				http_request.open("get","/bbs/DealDiscuss?postId="+${post.id}+"&replyContent="+replyContent,true);
				http_request.send(null);
				function getResult()
				{
					if(http_request.readyState==4)
					{
						if(http_request.status==200)
						{
							    if(http_request.responseText=="1")
								{
									alert("回复成功！");
									if('${totlePage}'=='1')
										{
										location.reload(true);
										}
									else
										{
										location.href="GetPostMessage?method=jump&postId="+<%= request.getAttribute("postId")%>+"&jumpname="+${totlePage};
										}
								
								}
							    else
								{
									alert("回复失败！");
							   	}
						}
						else
						{
							alert("你所请求的页面有错误！错误代码："+http_request.status);
						}
					}
				}
				http_request.onreadystatechange=getResult;
			}
		}
		
		function ajaxforDeleteContent(disId)
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
						throw e;
					}
				}
			}
			if(!http_request)
			{
				alert("不能创建XMLHttpRequest对象实例！");
				return false;
			}
				
			http_request.open("get","/bbs/DelDiscussServlet?discussId="+disId,true);
			http_request.send(null);
			function getResult()
			{
				if(http_request.readyState==4)
				{
					if(http_request.status==200)
					{
						    if(http_request.responseText=="删除回复成功")
							{
								alert("删除回复成功！");
								location.reload(true);
							}
						    else
							{
								alert("删除回复失败！");
						   	}
					}
					else
					{
						alert("你所请求的页面有错误！错误代码："+http_request.status);
					}
				}
			}
			http_request.onreadystatechange=getResult;
		}
	
	</script>
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
		<div id="menu">你有<a href="/bbs/page/showNews.jsp"><%=session.getAttribute("s")%></a> 信息。欢迎，
		<a href="/bbs/showUsersMessageServlet?biaozhi=haha&usersId=<%=session.getAttribute("loginId")%>" id="toLogin"><b><%=((Register)session.getAttribute("ClientMessageAfterLogin")).getAccount()%></b></a>
		<a href="/bbs/checkout" id="toRes"><b>注销</b></a>
	</div>
	<%} %>
   <hr>
	<span id="time">此处显示时间</span>
	<span id="web">
		<span onmousemove="st(this)" onmouseout="reflash(this)">
			<b><a href="<%=request.getContextPath()%>/index.jsp">首 &nbsp;&nbsp;页</a></b>
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
	  <div style="width: 1200px; margin: 0 auto; ">
		<div class="container-fluid" style="padding-left: 0px;padding-right: 0px;background-color:#F1FBFF;">
			<div class="row-fluid" style="width: 100%; border-color: blue; border-style: solid;background-color:#F1FBFF ;border-top-width:thin;border-bottom-width:thin;border-left-width:thin;border-right-width:0;">
				<div class="span2">
					<table style="width: 100%; border-color: blue; border-style: solid;background-color:#D1E8FF ;border-width:thin;" cellpadding="5px;">
						<tr>
							<td>
								★楼主&nbsp;<a href="/bbs/showUsersMessageServlet?usersId=${poster.id}&postId=${post.id}%>" style="font-size: 15pt;color: black ;font-family: 楷体"><strong>${nickName}</strong></a>
							</td>
						</tr>
						<tr>
							<td>
								<c:choose>
										<c:when test="${(posterface.face==null||posterface.face=='')&&poster.sex=='男'}">
											<img alt="" src="${pageContext.request.contextPath}/images/face_img/user0.gif" style="width: 100px;height: 100px;">
										</c:when>
										<c:when test="${(posterface.face==null||posterface.face=='')&&poster.sex=='女'}">
											<img alt="" src="${pageContext.request.contextPath}/images/face_img/user1.gif" style="width: 100px;height: 100px;">
										</c:when>
										<c:otherwise>
											<img alt="" src="${pageContext.request.contextPath}/${posterface.face}" style="width: 100px;height: 100px;">
										</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<td>
								性别：${poster.getSex()}
							</td>
						</tr>
						<tr>
							<td>
								学校：${poster.getSchool() }
							</td>
						</tr>
						<tr>
							<td>
								专业：${poster.getMajor() }
							</td>
						</tr>
						<tr>
							<td>
								<c:choose>
									<c:when test="${typeId=='4'}">
										<font style="color: black;">普通用户</font>
									</c:when>
									<c:when test="${typeId=='3'}">
										<font style="color: blue;">年费会员</font>
					                </c:when>
					                <c:when test="${typeId=='2'}">
										<font style="color: orange;">年费会员</font>
					                </c:when>
									<c:otherwise>
										<font style="color: red;">管理员</font>
									</c:otherwise>
								</c:choose>							
							</td>
						</tr>
					</table>
				</div>
				<div class="span10">
					<table style="width: 100%;border-color: orange;background-color:#F1FBFF ;">
						<tr style="height: 50px;">
							<td>
								【主题】:<strong>${post.getTitle()}</strong>
							</td>
						</tr>
						<tr>
							<td style="text-align: right;">
								发表时间:『${post.getDate() }』
							</td>
						</tr>
						<tr>
							<td>
								【内容】:
								<div style="width: 982px;padding:6px; background-color: #F0F0F0" class="show_e">
									<%Post post=(Post)request.getAttribute("post");%>
									<%= new FindMessage().findmessage(post.getContent()) %>
									<%
									String photoPath=new FindMessage().findphoto(post.getContent());
									try
									{
										if(photoPath!=null)
										{
											//photoPath=new String(photoPath.getBytes("ISO-8859-1"),"UTF-8");
											%>
											<img alt="图片" src="<%=photoPath%>">	
									<%	}
									}catch(Exception e)
									{
										e.printStackTrace();
									}
									%>
								</div>
							</td>
						</tr>
					</table>
				</div>
			</div>
			
			
			<%
				ArrayList<Discuss> list=(ArrayList<Discuss>)request.getAttribute("discussList");
				if(list.size()==0){
			%>
				<div class="pagination alternate" align="center">
						本帖还没有人回复
				</div>
				<%	
					}else{
						int endPage=(Integer)request.getAttribute("endPage");
						int startPage=(Integer)request.getAttribute("startPage")-1;
					for (int i=startPage;i<endPage;i++) {
						Discuss dis=list.get(i);
					    String nickName2=new LoginDaoImpl().findNickNameByUsersId(dis.getUserid().getId()).getNickName();
						String content=dis.getContent();
						int index=list.indexOf(dis);
						String time=dis.getTime();
						String sex=dis.getUserid().getSex();
						String school=dis.getUserid().getSchool();
						String major=dis.getUserid().getMajor();
						Users discussUser=dis.getUserid();			
						int typeId2=dis.getUserid().getTypeId().getId();
						int disId=dis.getId();
						UserFace disUserFace=new UserFaceDaoImpl().findFacebyUser(discussUser);
						
						pageContext.setAttribute("discussUser", discussUser);
						pageContext.setAttribute("disUserFace", disUserFace);
						
						String color2="";
						String type2="";
						if(typeId2==4){
					  		type2="普通用户";
					  		color2="black";
					  	}else if(typeId2==3){
					  		type2="年费会员";
					  		color2="blue";
					  	}else if(typeId2==2){
					  		type2="普通会员";
					  		color2="orange";
					  	}else{
					  		type2="管理员";
					  		color2="red";
					  	}
			%>
					  	<div class="row-fluid" style="margin-top: 20px; width: 100%; border-color: blue; border-style: solid;background-color:#F1FBFF ;border-top-width:thin;border-bottom-width:thin;border-left-width:thin;border-right-width:0;">
				 			<div class="span2">
				 				<table style="width: 100%; border-color: blue; border-style: solid;background-color:#D1E8FF ;border-width:thin;" cellpadding="5px;">
				 					<tr>
										<td>
											▲<%=index+1%>楼
										</td>
									</tr>
									<tr>
										<td>
											<a href="/bbs/showUsersMessageServlet?usersId=${pageScope.discussUser.id}&postId=${post.id}" style="font-size: 15pt;color: black ;font-family: 楷体"><strong><%=nickName2%></strong></a>
										</td>
									</tr>
									<tr>
										<td>
											<c:choose>
												<c:when test="${(pageScope.disUserFace.face==null||pageScope.disUserFace.face=='')&&pageScope.discussUser.sex=='男'}">
													<img alt="" src="${pageContext.request.contextPath}/images/face_img/user0.gif" style="width: 100px;height: 100px;">
												</c:when>
												<c:when test="${(pageScope.disUserFace.face==null||pageScope.disUserFace.face=='')&&pageScope.discussUser.sex=='女'}">
													<img alt="" src="${pageContext.request.contextPath}/images/face_img/user1.gif" style="width: 100px;height: 100px;">
												</c:when>
												<c:otherwise>
													<img alt="" src="${pageContext.request.contextPath}/${pageScope.disUserFace.face}" style="width: 100px;height: 100px;">
												</c:otherwise>
											</c:choose>
										</td>
									</tr>
									<tr>
										<td>
											性别：<%=sex %>
										</td>
									</tr>
									<tr>
										<td>
											学校：<%=school %>
										</td>
									</tr>
									<tr>
										<td>
											专业：<%=major %>
										</td>
									</tr>
									<tr>
										<td>
											<font style="color: <%=color2 %>;">
												<%=type2 %>
											</font>
										</td>
									</tr>
				 				</table>
				 			</div>
				 			<div class="span10">
								<table style="width: 100%;background-color:#F1FBFF;border-width:thin;">
									<tr>
										<td style="text-align: right;">
										<c:choose>
											<c:when test="${sessionScope.loginId==pageScope.discussUser.id||currentUser.typeId.id==1}">
												<button id="" value="<%=disId %>" class="btn btn-danger" onclick="javascript:ajaxforDeleteContent(<%=disId%>)">删除</button>
											</c:when>
											<c:otherwise>
											</c:otherwise>
										</c:choose>
											回复时间:『<%=time%>』
										</td>
									</tr>
									<tr>
										<td>
											<div style="width: 982px;padding:6px; background-color: #F0F0F0" class="show_e">
												<%=content %>
											</div>
										</td>
									</tr>
								</table>
							</div>
				 		</div>
				 <%
					}		
				}
				 %>
		<br/><br/>
		<div id="discusspaging">&nbsp;&nbsp;&nbsp;<a href="GetPostMessage?method=homePage&postId=<%= request.getAttribute("postId")%>">首页</a>
		<a href="GetPostMessage?method=lastPaging&postId=<%= request.getAttribute("postId")%>">${lastPage}</a>
		<a href="GetPostMessage?method=nextPaging&postId=<%= request.getAttribute("postId")%>">${nextPage }</a>	
		<a href="GetPostMessage?method=endPage&postId=<%= request.getAttribute("postId")%>">尾页</a>
		&nbsp;第${current}/${totlePage}页
		跳转到第<input type="text" id="jumpname" size="2"/>页
		<input type="button" value="确定" onclick="jump()" style="background-color: #317ef3;color: white;width: 70px;height: 22px">
		&nbsp;<a href="/bbs/index.jsp">返回网站首页</a>
		</div>
			<div>
				<table>
					<tr>
						<td style="width: 20%;">
							回帖许可：
						</td>
						<td style="width: 80%;">
							<form id="replyForm" class="form-horizontal" style="margin-top: 10px;">
							<table style="width: 100%;" cellpadding="10px;">
								<%-- <tr>
									<td>
										【主题】:
									</td>
									<td>
										<input type="text" id="rTopic" name="reply.rTopic" value="${reply.rTopic }" style="width: 800px;">
									</td>
								</tr> --%>
								<tr>
									<td>
										【表情】:
									</td>
									<td>
										<div id="container">
										<a href="JavaScript:void(0)" id="message_face">请选择...</a>
										</div>
									</td>
								</tr>
								<tr>
									<td style="vertical-align: top;">
										【内容】:
									</td>
									<td>
										<textarea name="reply.content" id="Content" cols="50" style="height:200px;width: 800px;" ></textarea>
									</td>
								</tr>
								<tr>
									<td>
										<input id="userId" name="reply.user.id" value="${sessionScope.loginId }" type="hidden"/>
										<input id="topicId" name="reply.topic.id" value="${post.id }" type="hidden"/>
									</td>
									<td>
										<Button class="btn btn-primary " data-dismiss="modal" aria-hidden="true" type="button" onclick="javascript:ajaxforAddContent()">提交</Button>
										<font id="error"></font>
									</td>
								</tr>
							</table>
							</form>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
  </body>
</html>
