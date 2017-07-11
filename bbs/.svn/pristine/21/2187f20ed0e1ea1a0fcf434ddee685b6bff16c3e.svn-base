package action;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
public class Identifying
{
	public static String play()
	{
		BufferedImage img=new BufferedImage(71,27,BufferedImage.TYPE_INT_ARGB);
		//构造一个图形缓存区img
		Graphics g=img.getGraphics();
		//获得画笔
		Random random=new Random();
		//构造随机数
		
		g.setColor(Color.white);
		g.fillRect(0, 0, 71, 27);
		
		for (int i = 0; i < 30; i++)//随机点
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
//		File file=new File("WebContent/photo/identifying_code.png");
		File file=new File("D:/Media/profession/apache-tomcat-7.0.73/webapps/Mycomputer/photo/identifying_code.png");
		File file2=new File("D:/java/Mycomputer/WebContent/photo/identifying_code.png");
//		File file=new File(outputpath);
		try
		{
			ImageIO.write(img, "png",file);
			ImageIO.write(img, "png", file2);
		} 
		catch (IOException e)
		{
			e.printStackTrace();
		}
		g.dispose();
		return str;
	}
	public static void main(String[] args)
	{
		String str=Identifying.play();
		System.out.println(str);
	}
}
