<%@page import="bean.Register"%>
<%@page import="bean.Login"%>
<%@page import="service.impl.LoginServiceImpl"%>
<%@page import="service.LoginService"%>
<%@page import="java.util.*"%>
<%@page import="bean.Post"%>
<%@page import="bean.Users"%>
<%@page import="service.impl.IndexShowServiceImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="/WEB-INF/error.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改个人信息</title>
<%Register register=(Register) session.getAttribute("ClientMessageAfterLogin"); %>
<script type="text/javascript" src="/bbs/js/jquery.js"></script>
<SCRIPT src="./fromweb/jquery-1.9.1.min.js" type="text/javascript"></SCRIPT>
<SCRIPT src="js/index.js" type="text/javascript"></SCRIPT>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploadPreview.min.js"></script>
<script type="text/javascript">
	function getTime() {
		var times=new Date();
		document.getElementById('time').innerHTML=new Date().toLocaleString()+
		' 星期'+'日一二三四五六'.charAt(new Date().getDay());
		window.setTimeout(getTime, 1000);
	}
	window.onload=getTime;
	
	$(function () {
		$("#face").uploadPreview({ Img: "ImgPr", Width: 220, Height: 220 });
	});
</script>
<script type="text/javascript">
function fixEnsure() {
	var addressText=document.getElementById("addressText").value;
	if(addressText=="")
		{
			alert("地址不能为空");
		}
	else
		{
		var xhr=new XMLHttpRequest();
		xhr.open("get", "/bbs/fixPassword?method=address&addressText="+addressText, true);
		xhr.onreadystatechange=function()
		{
			if(xhr.readyState==4)
				{
				if(xhr.status==200)
					{
					var jsontext=xhr.responseText;
					alert(jsontext);
					document.getElementById("kongbai").innerHTML=jsontext;
					}
				}
		}
		xhr.send(null);
		}
	}
	
$(document).ready(function (){
	
	$("#showfixpassworddiv").click(function(){//点击显示
		if($("#showfixpassworddiv").val()=="重置密码")
			{
			$("#fixPasssword").fadeIn(1000);
			$("#showfixpassworddiv").val("取消重置");
			}
		else
			{
			$("#fixPasssword").fadeOut(1000);
			$("#showfixpassworddiv").val("重置密码");
			}
		
	});
	
	$("#showPassword").click(function(){
		if($("#showPassword").val()=="密码明文")
			{
			$("#showPassword").val("密码密文");
			$("#fshow").css('display','block'); 
			$("#sshow").css('display','block'); 
			$("#tshow").css('display','block');
			$("#fhid").css('display','none'); 
			$("#shid").css('display','none'); 
			$("#thid").css('display','none'); 
			$("#fshow").val($("#fhid").val());
			$("#sshow").val($("#shid").val());
			$("#tshow").val($("#thid").val());
			}
		else
			{
			$("#showPassword").val("密码明文");
			$("#fshow").css('display','none'); 
			$("#sshow").css('display','none'); 
			$("#tshow").css('display','none');
			$("#fhid").css('display','block'); 
			$("#shid").css('display','block'); 
			$("#thid").css('display','block'); 
			$("#fhid").val($("#fshow").val());
			$("#shid").val($("#sshow").val());
			$("#thid").val($("#tshow").val());
			}
	});
});
function fixPassword() {
	if(document.getElementById("showPassword")=="密码明文")
		{
		var addressTextf=document.getElementById("fhid").value;
		var addressTexts=document.getElementById("shid").value;
		var addressTextt=document.getElementById("thid").value;
		}
	else
	{
		var addressTextf=document.getElementById("fshow").value;
		var addressTexts=document.getElementById("sshow").value;
		var addressTextt=document.getElementById("tshow").value;
	}
	if(addressTextf=="")
		{
			alert("原密码不能为空");
		}
	else if(addressTextf==<%=register.getPassword()%>)
		{
			if(addressTexts.length>5&&addressTexts.length<17)
				{
					if(addressTexts==addressTextt)
						{
							var xhr=new XMLHttpRequest();
							xhr.open("get", "/bbs/fixPassword?method=fixpassword&addressTexts="+addressTexts, true);
							xhr.onreadystatechange=function()
							{
								if(xhr.readyState==4)
									{
									if(xhr.status==200)
										{
										var jsontext=xhr.responseText;
										alert(jsontext);
										$(document).ready(function (){
												$("#fixPasssword").fadeOut(1000);
										});
										}
									}
							}
							xhr.send(null);
						}
					else
						{
							alert("两个新密码不一致！");
						}
				}
			else
				{
					alert("新密码长度需要为6到16个字符！");
				}
		}
	else
		{
		alert("原密码不正确！")
		}
	} 
	
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
		<div id="menu">你有<%=session.getAttribute("s")%> 信息。欢迎，
		<a href="/bbs/showUsersMessageServlet?usersId=<%=session.getAttribute("loginId")%>" id="toLogin"><b><%=((Register)session.getAttribute("ClientMessageAfterLogin")).getAccount()%></b></a>
		<a href="/bbs/checkout" id="toRes"><b>注销</b></a>
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
		
	<div id="tableDiv">
		<table id="fixTable" cellpadding="10px" cellspacing="1px">
			<tr>
				<td>姓名：</td>
				<td><%=register.getName() %></td>
			</tr>
			<tr>
				<td>昵称：</td>
				<td><%= register.getAccount()%></td>
			</tr>
			<tr>
				<td>性别：</td>
				<td><%= register.getSex()%></td>
			</tr>
			<tr>
				<td>电话：</td>
				<td><%=register.getPhone() %></td>
			</tr>
			<tr>
				<td>年龄：</td>
				<td><%=register.getAge() %></td>
			</tr>
			<tr>
				<td>学校：</td>
				<td><%=register.getSchool() %></td>
			</tr>
			<tr>
				<td>专业：</td>
				<td><%=register.getMajor() %></td>
			</tr>
			<tr>
				<td>用户类型：</td>
				<td><%Users user=(Users)session.getAttribute("currentUser");
					  String userType=user.getTypeId().getType();
					%>
				 	<%=userType %>
				 </td>
			</tr>
			<tr>
				<td>地址：</td>
				<td><input type="text" id="addressText" value="<%=register.getAddress() %>"  style="border: 1px  solid red;"/></td>
			</tr>
			<tr>
				<td ><input type="button" value="保存" style="width: 50px;height: 30px;background-color: #3385ff;color: white;font-size:large;" onclick="fixEnsure()"/></td>
				<td><input type="button"  id="showfixpassworddiv" value="重置密码" style="width: 80px;height: 30px;background-color: #3385ff;color: white;font-size:large;" /></td>
			</tr>
		</table>
	</div>
	<div id="fixPasssword" style="display: none;">
		<table cellpadding="10px" cellspacing="1px">
			<tr>
				<td>原密码：</td>
				<td>
					<input type="password" style="border: 1px  solid red;display: block;" id="fhid"/>
					<input type="text" style="border: 1px  solid red;display: none" id="fshow"/>
				</td>
			</tr>
			<tr>
				<td>新密码：</td>
				<td>
					<input type="password" style="border: 1px  solid red;display: block;" id="shid"/>
					<input type="text" style="border: 1px  solid red;display: none" id="sshow"/>
				</td>
			</tr>
			<tr>
				<td>新密码：</td>
				<td>
					<input type="password" style="border: 1px  solid red;display: block;" id="thid" />
					<input type="text" style="border: 1px  solid red;display: none" id="tshow" />
				</td>
			</tr>
			<tr>
				<td ><input type="button" value="确认" style="width: 80px;height: 30px;background-color: #3385ff;color: white;font-size:large;" onclick="fixPassword()"/></td>
				<td> <input type="button" value="密码明文" style="width: 80px;height: 30px;background-color: #3385ff;color: white;font-size:large;" id="showPassword"/></td>
			</tr>
			
		</table>
	</div>
	<div style="width: 335px; " id="faceframe">
		<form action="/bbs/SubFace" method="post" enctype="multipart/form-data" target="nm_iframe">
			<div class="control-group" id="preDiv" style="width: 700px; height: 120px;margin-left: 80px;">
				<c:choose>
					<c:when test="${(sessionScope.userface.face==null||sessionScope.userface.face=='')&&sessionScope.currentUser.sex=='男'}">
						<img id="ImgPr" alt="" src="${pageContext.request.contextPath}/images/face_img/user0.gif" style="width: 120px;height: 120px;">
					</c:when>
					<c:when test="${(sessionScope.userface.face==null||sessionScope.userface.face=='')&&sessionScope.currentUser.sex=='女'}">
						<img id="ImgPr" alt="" src="${pageContext.request.contextPath}/images/face_img/user1.gif" style="width: 120px;height: 120px;">
					</c:when>
					<c:otherwise>
						<img id="ImgPr" alt="" src="${pageContext.request.contextPath}/${sessionScope.userface.face}" style="width: 120px;height: 120px;">
					</c:otherwise>
				</c:choose>
			</div>
			<br/>
			<div class="control-group">
					<label class="control-label" for="face">上传头像(*)：</label>
					<input type="file" id="face" name="face">
			</div>
			<div id="submitface">
				<input type="submit" value="提交头像" style="border: 1px solid black;" />
			</div>
		</form>
		<iframe id="id_iframe" name="nm_iframe" style="display:none;"></iframe>
	</div>
	<a href="/bbs/page/pay.jsp" id="userType" style="color: red;text-decoration: underline;">充值会员</a>
</body>
</html>