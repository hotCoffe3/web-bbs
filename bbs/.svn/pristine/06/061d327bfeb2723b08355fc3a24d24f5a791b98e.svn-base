function check(obj) {
	var box=obj.options;
	var value="";
	for(var i=0;i<box.length;i++)
	{
		if(box[i].selected)
		{
			value=box[i].value;
		}
	}
	reflash();
	switch(value)
	{
	   case 'accountandphone':
		   {
		   		account();
		   		phone();
		   }break;
	   case 'nameandaccount':
		   {
		   		name();
		   		account();
		   }break;
	   case 'acccountandaddress':
		   {
		   		account();
		   		address();
		   }break;
	   case 'nameandaddress':
		   {
		   		name();
		   		address();
		   }break;
	   case 'phoneandaddress':
		   {
		   		phone();
		   		address();
		   }
	}
	
}
function reflash()
{
	document.getElementById("account").style.display="none";
	document.getElementById("phone").style.display="none";
	document.getElementById("address").style.display="none";
	document.getElementById("name").style.display="none";
}
function account()
{
	document.getElementById("account").style.display="block";
}
function phone()
{
	document.getElementById("phone").style.display="block";
}
function address()
{
	document.getElementById("address").style.display="block";
}
function name()
{
	document.getElementById("name").style.display="block";
}
function pas()
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
	var account=document.getElementsByName("account")[0].value;
	var name=document.getElementsByName("name")[0].value;
	var phone=document.getElementsByName("phone")[0].value;
	var address=document.getElementsByName("address")[0].value;
	 http_request.open("post",".././findpassword?account="+account+"&phone="+phone+"&name="+name+"&address="+address,true);
	 function getResult()
		{
			if(http_request.readyState==4)
			{
				if(http_request.status==200)
				{
					    if(http_request.responseText=='yes')
						{
					    	window.open(".././fromweb/showmessage.jsp");
						}
					    else
					    {
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