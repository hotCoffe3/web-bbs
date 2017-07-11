function identifyingcode()
{
	document.getElementById("code").src="../code/code.jsp?"+new Date().getTime();
}
function reflash()
{
	document.getElementById("accountOK").style.display="none";
}
function ajaxforaccountcheck()
{
	var http_request=false;
	var account=document.getElementsByName("account")[0].value;
	if(account=="")
	{
		reflash();
		document.getElementById("checktext").style.display="inline-block";
	}
	else{
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
		 http_request.open("get",".././Registerservlet?method=checkaccount&account="+account,true);
	function getResult()
			{
				if(http_request.readyState==4)
				{
					if(http_request.status==200)
					{
						    if(http_request.responseText=='可用')
							{
						    	document.getElementById("checktext").style.display="none";
						    	document.getElementById("accountOK").style.display="inline-block";
							}
						    else
						   	{
						    	document.getElementById("checktext").style.display="none";
						    	alert(http_request.responseText);
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
function checkaccountAndpassword(obj)
{
	
	document.getElementById("checktext").style.display="none";
	document.getElementById("checkpassword").style.display="none";
	document.getElementById("checkpassword2").style.display="none";
	var str=obj.value;
	var reg=/[a-zA-Z0-9]{6,16}/ig;
	if(!reg.test(str))
	{
		if(obj.type=='text')
		{
			document.getElementById("checktext").style.display="inline-block";
		}
		if(obj.type=='password')
		{
			document.getElementById("passwordOK").style.display="none";
			document.getElementById("checkpassword").style.display="inline-block";
		}
	}
	else
	{
		if(obj.type=='text')
		{
			document.getElementById("checktext").style.display="none";
		}
		if(obj.type=='password')
		{
			document.getElementById("checkpassword").style.display="none";
			document.getElementById("passwordOK").style.display="inline-block";
		}
	}
}
function confirmpassword()
{
	var password=document.getElementsByName("password")[0].value;
	var confirm=document.getElementsByName("confirmpassword")[0].value;
	if(password!="")
	{
		if(password!=confirm)
		{
			document.getElementById("confirmpasswordOK").style.display="none";
			document.getElementById("checkconfirmpassword").style.display="inline-block";
		}
		else
		{
			document.getElementById("checkconfirmpassword").style.display="none";
			document.getElementById("confirmpasswordOK").style.display="inline-block";
		}
	}
	else
	{
		document.getElementById("checkpassword2").style.display="inline-block";
	}
}
function checkname()
{
	var str=document.getElementsByName("name")[0].value;
	var box=/[^0-9.]/ig;;
	if(!box.test(str))
	{
		document.getElementById("nameOK").style.display="none";
		document.getElementById("checkname").style.display="inline-block";
	}
	else
	{
		document.getElementById("checkname").style.display="none";
		document.getElementById("nameOK").style.display="inline-block";
	}
}
function checkphone()
{
	var str=document.getElementsByName("phone")[0].value;	
	var box=/^[\d]{11}$/ig;
	var box2=/^[\d]{8}$/ig;
	document.getElementById("checkphone").style.display="none";
	document.getElementById("phoneOK").style.display="none";
	document.getElementById("checkphone2").style.display="none";
	if(box.test(str)||box2.test(str))
	{
		document.getElementById("checkphone").style.display="none";
//		document.getElementById("phoneOK").style.display="inline-block";
	}
	else
	{
		document.getElementById("phoneOK").style.display="none";
		document.getElementById("checkphone").style.display="inline-block";
	}
	
	
	
}
function ajaxregister()
{   
	if(document.getElementsByName("regular")[0].checked)
	{
		var http_request=false;
		var account=document.getElementsByName("account")[0].value;
		var password=document.getElementsByName("password")[0].value;
		var name=document.getElementsByName("name")[0].value;
		var phone=document.getElementsByName("phone")[0].value;
		var address=document.getElementsByName("address")[0].value;
		var school=document.getElementsByName("school")[0].value;
		var major=document.getElementsByName("major")[0].value;
		var sexcheck=document.getElementsByName("sex");
		var age=document.getElementsByName("age")[0].value;
		var sex="";
		for(var i=0;i<sexcheck.length;i++)
		{
			if(sexcheck[i].checked==true)
			{
				sex=sexcheck[i].value;
			}
		}
		var identifycode=document.getElementsByName("identify")[0].value;
		if(account==""||password==""||phone==""||school=="")
		{
			alert("注册信息填写不完整！注册信息可用于找回密码，请填写完整再试！");
			location.reload();
		}
		else{
						if(document.getElementsByName("confirmpassword")[0]=="")
						{
							alert("必须确认密码才能继续！");
						}
						else
						{
							if(name==""){name="默认";}
							if(address==""){address="大中国";}
							if(major==""){major="Internet";}
							if(age==""){age="0";}
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
									 http_request.open("get",".././Registerservlet?method=register&account="+account+"&password="+password+"&name="+name+"&phone="+phone+"&address="+address+"&school="+school+"&major="+major+"&sex="+sex+"&identifycode="+identifycode+"&age="+age,true);    
									 function getResult()
										{
											if(http_request.readyState==4)
											{
												if(http_request.status==200)
												{
													    if(http_request.responseText=="注册成功！")
														{
													    	location.href=".././index.jsp";
													    	alert(http_request.responseText);
													    	
														}
													    else
													   	{
													    	alert(http_request.responseText+"请重新注册！");
													    	location.reload();
													    	
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
	}
	else
	{
		alert("必须同意本网站相关规定才能注册！");
	}
}
function checkage()
{
	document.getElementById("checkage2").style.display="none";
	var age=document.getElementsByName("age")[0].value;
	var box=/[\d]/ig;
	if(box.test(age))
	{
		if(age>150)
		{
			document.getElementById("checkage").style.display="inline-block";
			
		}
		else
		{
		   document.getElementById("checkage").style.display="none";
		}
	}
	else
	{
		document.getElementById("checkage2").style.display="inline-block";
	}
}
function ajaxforphonecheck(obj)
{
	var http_request=false;
	var phone=obj.value;
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
	 http_request.open("get",".././Registerservlet?method=checkphone&phone="+phone,true);
function getResult()
		{
			if(http_request.readyState==4)
			{
				if(http_request.status==200)
				{
					document.getElementById("checkphone").style.display="none";
					document.getElementById("checkphone2").style.display="none";
			    	document.getElementById("phoneOK").style.display="none";
					    if(http_request.responseText==1)
						{		    	
					    	document.getElementById("phoneOK").style.display="inline-block";
						}
					    else
					   	{
					    	document.getElementById("checkphone2").style.display="inline-block";
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
 
function newcheck(obj)
{
	checkaccountAndpassword(obj);
	if(document.getElementById("checktext").style.display=="inline-block")
	{
		reflash();
		document.getElementById("checktext").style.display="inline-block";
	}
	else
		{
			ajaxforaccountcheck();
		}
}

function reflashforphone()
{
	document.getElementById("checkphone").style.display="none";
	document.getElementById("checkphone2").style.display="none";
	document.getElementById("phoneOK").style.display="none";
}