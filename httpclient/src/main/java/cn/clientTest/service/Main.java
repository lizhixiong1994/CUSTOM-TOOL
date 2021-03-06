package cn.clientTest.service;
//作者：郭无心
//链接：https://www.zhihu.com/question/30626103/answer/83157368
//来源：知乎
//著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.net.URLConnection;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.imageio.ImageReader;
import javax.imageio.stream.FileImageOutputStream;
import javax.imageio.stream.ImageInputStreamImpl;

import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.client.utils.HttpClientUtils;

public class Main
{
	static String SendGet(String url)
	{
		// 定义一个字符串用来存储网页内容
		String result = "";
		// 定义一个缓冲字符输入流
		BufferedReader in = null;
		try
		{
			// 将string转成url对象
			URL realUrl = new URL(url);
			// 初始化一个链接到那个url的连接
			URLConnection connection = realUrl.openConnection();
			// 开始实际的连接
			connection.connect();
			// 初始化 BufferedReader输入流来读取URL的响应
			in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			// 用来临时存储抓取到的每一行的数据
			String line;
			while ((line = in.readLine()) != null)
			{
				// 遍历抓取到的每一行并将其存储到result里面
				result += line;
			}
		} catch (Exception e)
		{
			System.out.println("发送GET请求出现异常！" + e);
			e.printStackTrace();
		}
		// 使用finally来关闭输入流
		finally
		{
			try
			{
				if (in != null)
				{
					in.close();
				}
			} catch (Exception e2)
			{
				e2.printStackTrace();
			}
		}
		return result;
	}

	static String RegexString(String targetStr, String patternStr)
	{
		// 定义一个样式模板，此中使用正则表达式，括号中是要抓的内容
		// 相当于埋好了陷阱匹配的地方就会掉下去
		Pattern pattern = Pattern.compile(patternStr);
		// 定义一个matcher用来做匹配
		Matcher matcher = pattern.matcher(targetStr);
		// 如果找到了
		if (matcher.find())
		{
			// 打印出结果
			
			String string = matcher.group();
			return "http:"+string.substring(string.indexOf("=")+1).trim();
		}
		return "Nothing";
	}

	public static void main(String[] args)
	{
//		System.out.println(RegexString());
		// 定义即将访问的链接
		String url = "http://www.baidu.com";
		// 访问链接并获取页面内容
		String result = SendGet(url);
		System.out.println(result);
		//src=//www.baidu.com/img/gs.gif
		// 使用正则匹配图片的src内容
		String imgSrc = RegexString(result, "src=//.+?\\s");
		// 打印结果
		System.out.println(imgSrc);
		//爬虫
		CloseableHttpClient client = HttpClients.createDefault();
		HttpPost httpPost = new HttpPost(imgSrc);
		// 伪装浏览器请求
		httpPost.setHeader(
				"User-Agent",
				"Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36");
		CloseableHttpResponse response = null;
		try {
			response = client.execute(httpPost);
			if(response != null && response.getStatusLine().getStatusCode() == 200) {
				File file = new File("C:\\Users\\lx\\Desktop\\baidu.png");
				if(!file.exists()) {
					file.createNewFile();
				}
				FileImageOutputStream imageOutput = new FileImageOutputStream(file);
				HttpEntity entity = response.getEntity();
				InputStream content = entity.getContent();
				byte[] bytes = new byte[1024*8];
				int length = 0;
				while((length = content.read(bytes)) >=0) {
					imageOutput.write(bytes, 0, length);
				}
			}else {
				throw new RuntimeException();
			}
		} catch (ClientProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}