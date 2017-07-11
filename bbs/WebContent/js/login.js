$(function(){
	//得到焦点
	$("#password").focus(function(){
		$("#left_hand").animate({
			left: "150",
			top: " -38"
		},{step: function(){
			if(parseInt($("#left_hand").css("left"))>140){
				$("#left_hand").attr("class","left_hand");
			}
		}}, 2000);
		$("#right_hand").animate({
			right: "-64",
			top: "-38px"
		},{step: function(){
			if(parseInt($("#right_hand").css("right"))> -70){
				$("#right_hand").attr("class","right_hand");
			}
		}}, 2000);
	});
	//失去焦点
	$("#password").blur(function(){
		$("#left_hand").attr("class","initial_left_hand");
		$("#left_hand").attr("style","left:100px;top:-12px;");
		$("#right_hand").attr("class","initial_right_hand");
		$("#right_hand").attr("style","right:-112px;top:-12px");
	});
});

function login()
{
	var http_request=false;
	var account=document.getElementsByName("ac")[0].value;
	var password=document.getElementsByName("psd")[0].value;
	var ra=document.getElementsByName("identify");
	var type="";
	for(var i=0;i<ra.length;i++)
	{
		if(ra[i].checked)
		{
			type=ra[i].value;
		}
	}
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
	http_request.open("post",".././LoginAction",true);
	http_request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	function getResult1()
	{
		if(http_request.readyState==4)
		{
			if(http_request.status==200)
			{
				if(http_request.responseText==1)
				{
					//location.href=".././index.jsp";
					location.href=".././NewsServlet";
				}
				else
				{
					alert(http_request.responseText);
				}
			}
			else
			{
				document.getElementsByName("ac")[0].value="";
				document.getElementsByName("psd")[0].value="";
				alert("你所请求的页面有错误！");
			}
		}
	}
	http_request.onreadystatechange=getResult1;
	http_request.send("password="+password+"&account="+account+"&method=login&type="+type);
}

