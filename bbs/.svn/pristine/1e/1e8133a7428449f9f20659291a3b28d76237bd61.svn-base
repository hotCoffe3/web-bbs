function st(obj)
{
	obj.style.backgroundColor="#0080ff";
}
function reflash(obj)
{
	obj.style.backgroundColor="#D7FBF6";
}



$(function(){
	$("#kkk").click(function(){
		$("#001").fadeToggle(3000);
		for(var i=0;i<100;i++)
			{};
		$("#002").fadeToggle(3000);
		$("#003").fadeToggle(3000);
		$("#004").fadeToggle(3000);
	}
			)
});




function photo(obj)
{
	var f=document.getElementById("file").files;
	//alert(f[0].lastModifiedDate);
	var name=f[0].name;
	 var lastname=name.substring(name.lastIndexOf('.')+1);
	 var box=/mpo|tif|tiff|tga|vda|icb|vst|sgi|rgb|rgba|bw|sct|pbm|pgm|pnm|ppm|pfm|pam|png|pns|pxr|raw|pdf|pdp|pcx|jps|jpf|jpx|jp2|j2c|j2k|jpc|jpg|jpeg|jpe|iff|tdi|ico|cur|eps|dcm|dc3|dic|gif|bmp|rle|dib|psd|psb|pdd/ig;//图片正则
	 if(!box.test(lastname))
	 {
		 alert('只能上传图片,不然可能显示失败！');
	 }	
}


function select()
{
	var se=document.getElementsByName("ty")[0].options;
	var value="";
	for(var i=0;i<se.length;i++)
	{
		if(se[i].selected)
		{
			value=se[i].value;
		}
	}
	var a=0;
	switch (value) {
	case 'study':
		a=1;
		break;
		
	case 'job':
		a=2;
		break;
	case 'game':
		a=4;
		break;
	case 'sc':
		a=3;
		break;
	
	}
	return a;
}
function inp()
{
	var title=document.getElementsByName('title')[0].value;
	return title;
}


function ajaxfortitle()
{
	var http_request=false;
	var contenttype=select();
	var title=inp();
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
	 http_request.open("get","./posting?contenttype="+contenttype+"&title="+title,true);
	 function getResult()
		{
			if(http_request.readyState==4)
			{
				if(http_request.status==200)
				{
					    					
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


