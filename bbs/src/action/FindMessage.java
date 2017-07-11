package action;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;

public class FindMessage
{
	public String findmessage(String path)
	{
		String message="";
		File file=new File(path);
		if(file.exists())
		{
			if(file.isDirectory())
			{
				File[] file2=file.listFiles();
				for(File f:file2)
				{
					if(f.getName().substring(f.getName().lastIndexOf(".")+1).equals("txt"))
					{
						try
						{
							File cc=new File(path+"/"+f.getName());
				        	InputStreamReader reader = new InputStreamReader(new FileInputStream(cc),"utf-8");
					        BufferedReader br = new BufferedReader(reader);
					        String s = null;
							while((s=br.readLine())!=null){
								message = message  + s;
			
							}br.close();
							reader.close();
						} catch (Exception e)
						{
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
				}
			}
			if(file.isFile())
			{
				String name=file.getName().substring(file.getName().lastIndexOf(".")+1);
				if(name.equals("txt"))
				{
					
			        try
					{
			        	File cc=new File(path+"/"+file.getName());
			        	InputStreamReader reader = new InputStreamReader(new FileInputStream(cc),"utf-8");
				        BufferedReader br = new BufferedReader(reader);
				        String s = null;
						while((s=br.readLine())!=null){
							message = message  + s;
						}
					} catch (Exception e)
					{
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		}
		
		return message;
	}
	public String findphoto(String path)
	{
		String p="";
		File file=new File(path);
		if(file.exists())
		{
			if(file.isDirectory())
			{
				File[] f=file.listFiles();
				for(File s:f)
				{
					if(s.isFile())
					{
						if(!s.getName().substring(s.getName().lastIndexOf(".")+1).equals("txt"))
						{
							p="./"+s.getAbsolutePath().substring(s.getAbsolutePath().lastIndexOf("users"));
						}
					}
				}
			}
			if(file.isFile())
			{
				p="./"+file.getAbsolutePath().substring(file.getAbsolutePath().lastIndexOf("users"));
			}
		}
		return p;
	}
	
}
