package cn.tedu.store.web;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DownloadServlet
 */
public class DownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DownloadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("niahao ");
		byte[] bytes = createPng("你好");
		//设置响应头,在头里面传送必须要进行编码url编码处理
		response.setContentType("image/png");
		response.setContentLength(bytes.length);
		String name = "演示图片.png";
		name = URLEncoder.encode(name,"utf-8");
		response.setHeader("Content-Disposition","attachment; filename=\""+name+"\"");
		//填充body
		OutputStream out = response.getOutputStream();
		out.write(bytes);
		out.close();
		out.close();
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private byte[] createPng(String code) throws IOException {
		char[] cha = code.toCharArray();
		BufferedImage bi = new BufferedImage(100, 40,BufferedImage.TYPE_3BYTE_BGR);
		bi.setRGB(0, 0, 0x0000ff);
		
		Random r = new Random();
		//绘制5000个随机色点
		for(int i = 0 ; i < 500 ; i++) {
			int x = r.nextInt(bi.getWidth());
			int y = r.nextInt(bi.getHeight());
			int rgb = r.nextInt(0xffffff);//随机色
			bi.setRGB(x, y, rgb);
		}
		
		//利用api会值验证码字符传
		Graphics2D g = bi.createGraphics();
		Color c = new Color(r.nextInt(0xffffff));
		g.setColor(c);
		g.setFont(new Font(Font.SANS_SERIF,Font.ITALIC,35));
		g.drawString(code, 10, 36);
		//利用api绘制混淆线
		for(int i=0; i <5;i++) {
			int x1 = r.nextInt(bi.getWidth());
			int x2 = r.nextInt(bi.getWidth());
			int y1 = r.nextInt(bi.getHeight());
			int y2 = r.nextInt(bi.getHeight());
			g.drawLine(x1, y1, x2, y2);
		}
		
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		//将图片编码为png数据
		ImageIO.write(bi, "png", out);
		byte[] bytes = out.toByteArray();
		return bytes;
		
	}

}
