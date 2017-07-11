<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="/WEB-INF/error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新用户注册</title>
<link rel="stylesheet" href="../css/register.css">
<link rel="shortcut icon" href="../images/shortcut.ico" type="image/x-icon">
<script type="text/javascript" src="../js/register.js"></script>
</head>
<body>

	<div id="res">
		<h2>欢迎新用户注册</h2>
		<hr>
		<table style="margin-left: 13%">
			<tr>
				<th>用  户  名</th>
				<th colspan="3"><input type="text" name="account" placeholder="必填,6到16位数字或字母"  onfocus="reflash()" onkeyup="checkaccountAndpassword(this)" onblur="newcheck(this)"></th>
				<th><img id="accountOK" src="../images/right.jpg" style="display: none;"></img><p id="checktext" style="font-size: 12px;color: red;display: none">必须是6到16位数字或字母</p></th>
			</tr>			
			<tr>
				<th>设置密码</th>
				<th colspan="3"><input type="password" name="password" placeholder="必填,6到16位数字或字母" oncopy="return false;" onpaste="return false;"  onkeyup="checkaccountAndpassword(this)" onfocus="reflashforphone()"></th>
				<th><p style="font-size: 12px;color: red;display: none" id="checkpassword">必须是6到16位数字或字母</p><p style="font-size: 12px;color: red;display: none" id="checkpassword2">请先设置密码</p>
				<img id="passwordOK" src="../images/right.jpg" style="display: none;"></img></th>
				
			</tr>			
			<tr>
				<th>确认密码</th>
				<th colspan="3"><input type="password" name="confirmpassword" onblur="confirmpassword()" onpaste="return false;"></th>
				<th><p style="font-size: 12px;color: red;display: none" id="checkconfirmpassword">确认密码必须一致</p>	
				<img id="confirmpasswordOK" src="../images/right.jpg" style="display: none;"></img></th>			
			</tr>
			<tr>
				<th>真实姓名</th>
				<th colspan="3"><input type="text" name="name" maxlength="12" onblur="checkname()"></th>
				<th><p style="font-size: 12px;color: red;display: none" id="checkname">请正确填写姓名</p><img id="nameOK" src="../images/right.jpg" style="display: none;"></img></th>			
			
			</tr>
			
			<tr>
				<th>手机号码</th>
				<th colspan="3"><input type="text" name="phone" placeholder="必填" onkeyup="checkphone()" onblur="ajaxforphonecheck(this)"></th>
				<th><p style="font-size: 12px;color: red;display: none" id="checkphone">号码不合法</p>
				<p style="font-size: 12px;color: red;display: none" id="checkphone2">号码已经被注册</p>
				<img id="phoneOK" src="../images/right.jpg" style="display: none;"></img></th>			
			</tr>
			
			<tr>
				<th>家庭住址</th>
				<th colspan="3"><input type="text" name="address"></th>	
			</tr>
			
			<tr>
				<th>所在学校</th>
				<th colspan="3"><input type="text" name="school" placeholder="必填"></th>
				
			</tr>
			
			<tr>
				<th>主     &nbsp;   修</th>
				<th colspan="3"><input type="text" name="major"></th>
			</tr>
			<tr>
				<th>年     &nbsp;   龄</th>
				<th colspan="3"><input type="text" name="age" onkeyup="checkage()"></th>
				<th><p style="font-size: 12px;color: red;display: none" id="checkage">你的年龄大于150岁?</p><p style="font-size: 12px;color: red;display: none" id="checkage2">该年龄不合法</p></th>
			</tr>
			<tr>
				<th colspan="2"> </th>
				<th><strong>男</strong><input type="radio" name="sex" checked="checked" value="male"><strong>女</strong><input type="radio" name="sex" value="female"><strong>保密</strong><input type="radio" name="sex" value="secret"></th>
				<th colspan="4"><input type="checkbox" style="border-style: solid;" name="regular"/><a href="regular_of_bbs.html" style="font-size: 5px;color: red;" target="_blank">我已阅读并同意本网站相关规定</a></th>
			</tr>
			<tr>
				<th>验   证   码</th>
				<th colspan="3"><input type="text" name="identify"></th>
				<th colspan="2"><img id="code" alt="identifyingcode" src="../code/code.jsp" onclick="identifyingcode()" ondrag="return false;"><a onclick="identifyingcode()" style="font-size: 12px;color: blue">看不清，换一张</a></th>
			</tr>
			<tr>
				<th colspan="6"><img onclick="ajaxregister()" alt="register" src="../images/register.png" style="height: 65px;width: 350px;filter:alpha(Opacity=100);-moz-opacity:1;opacity: 1;"></th><th><a style="font-size: 12px;color: red" href="login.jsp">已有账号</a></th>
			</tr>
		</table>
	</div>
</body>
</html>