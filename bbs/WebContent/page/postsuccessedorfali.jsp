<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="/WEB-INF/error.jsp"%>
    
    <%String title="";
    if(session.getAttribute("isflag").equals("OK"))
    	{
    		title="发帖成功";
    	}
    	else
    	{
    		title="发帖失败";
    	}%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script language="javascript" type="text/javascript"> 
var i = 5; 
var intervalid; 
intervalid = setInterval("fun()", 1000); 
function fun() { 
if (i == 0) { 
window.location.href ="/bbs/showUsersMessageServlet?usersId="+<%=session.getAttribute("loginId")%>; 
clearInterval(intervalid); 
} 
document.getElementById("time").innerHTML = i; 
i--; 
} 
</script> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=title %></title>
</head>
<body>
	<center>
		<strong><%=title %>!将在<span id="time">5</span>内返回发帖列表！</strong><br/> 等得不耐烦？<a href ="/bbs/showUsersMessageServlet?usersId=<%=session.getAttribute("loginId")%>">点我立即返回</a>
	</center>
</body>
</html>