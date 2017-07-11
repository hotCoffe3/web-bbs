<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.Color"%>
<%@page import="java.util.Random"%>
<%@page import="java.awt.Graphics"%>
<%@page import="java.awt.Font"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	response.setHeader( "Pragma" , "No-cache" );
	response.setHeader( "Cache-Control" , "no-cache" );
	response.setDateHeader( "Expires" , 0);
	BufferedImage img=new BufferedImage(71,27,BufferedImage.TYPE_INT_ARGB);
	Graphics g=img.getGraphics();
	Random random=new Random();
	g.setColor(Color.white);
	g.fillRect(0, 0, 71, 27);	
	for (int i = 0; i < 30; i++)
	{
		int a=random.nextInt(71);
		int b=random.nextInt(27);
		int c=random.nextInt(6);
		switch (c)
		{
			case 0:g.setColor(Color.blue);break;
			case 1:g.setColor(Color.red);break;
			case 2:g.setColor(Color.cyan);break;
			case 3:g.setColor(Color.green);break;
			case 4:g.setColor(Color.orange);break;
			case 5:g.setColor(Color.pink);break;
			default:g.setColor(Color.yellow);break;
		}
		g.drawLine(a, b, a, b);
	}	
	String str="";
	int t=random.nextInt(9);
	g.setColor(Color.blue);
	for(int i=0;i<4;i++)
	{
		String str1="";
		if(t%2==0)
		{
			str1=String.valueOf((char)(random.nextInt(26)+65));
		}
		else
		{
			str1=random.nextInt(9)+"";
		}
		str=str+str1;	
	}
	Font font=new Font("宋体",Font.BOLD,22);
	g.setFont(font);
	g.drawString(str, 12, 14);

	try
	{
		ImageIO.write(img, "JPEG",response.getOutputStream());
	}catch(Exception e)
	{
		e.printStackTrace();
	}
	g.dispose();
	session.setAttribute("identifying",str);
	response.getOutputStream().flush();
	response.getOutputStream().close();
	out.clear();
	out = pageContext.pushBody();
 %>
</body>
</html>