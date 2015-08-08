package com.dixin.framework.tools;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;

import javax.imageio.ImageIO;

public class MakePicture {
	private char charTable[]={  
	        'a','A','b','B','c','C','d','D' ,'e','E' ,  
	        'f','F','g','G','h','H','i','I','j','J' ,  
	        '0','1','2','3','4','5','6','7','8','9'  
	    };   
	    public String drawPicture(int width,int height,OutputStream os)  
	    {  
	        if(width<=0)  
	            width=100 ;  
	        if(height<=0)   
	            height=60 ;  
	              
	        BufferedImage image=new BufferedImage(width, height,BufferedImage.TYPE_INT_RGB) ;  
	        Graphics g=image.getGraphics()  ;  
	        g.setColor(Color.LIGHT_GRAY) ;   
	        g.fillRect(0, 0, width, height)  ;  
	        g.setColor(new Color(0x5265fd)) ;  
	        g.drawRect(0, 0, width, height)  ;    
	        String str ="" ;  
	        for(int x=0;x<4;x++)  
	        {  
	          str+=charTable[(int) (Math.random()*charTable.length)];  
	        }  
	          
	        g.drawString(str.substring(0, 1), 0, 15);  
	        g.drawString(str.substring(1, 2), 15, 17);  
	        g.drawString(str.substring(2, 3), 35, 19);  
	        g.drawString(str.substring(3, 4), 50, 16);  
	        Random rand=new Random() ;  
	        for(int i=0;i<10;i++)  
	        {  
	          int x=rand.nextInt(width)  ;  
	          int y=rand.nextInt(height)  ;   
	          g.drawOval(x, y, 1, 1) ;  
	        }  
	        g.dispose()  ;  
	        try {  
	            ImageIO.write(image, "JPEG",os) ;  
	        } catch (IOException e) {  
	              
	            e.printStackTrace();  
	            return "" ;  
	        }  
	          
	       return str ;  
	    }  
}
