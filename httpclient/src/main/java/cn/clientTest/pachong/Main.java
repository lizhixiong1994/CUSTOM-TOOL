package cn.clientTest.pachong;
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
	public static void main(String[] args)
	{
//		System.out.println(RegexString());
		// 定义即将访问的链接
		String url = "http://www.baidu.com";
		// 访问链接并获取页面内容
		String result = PCUtil.SendGet(url);
		// 使用正则匹配图片的src内容
		String imgSrc = PCUtil.RegexString(result, "src=//.+?\\s");
		//爬虫
		CloseableHttpClient client = HttpClients.createDefault();
		HttpPost httpPost = new HttpPost(imgSrc);
		// 伪装浏览器请求
		httpPost.setHeader(
				"User-Agent",
				"Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36");
		CloseableHttpResponse response = null;
		FileImageOutputStream imageOutput = null;
		try {
			response = client.execute(httpPost);
			if(response != null && response.getStatusLine().getStatusCode() == 200) {
				File file = new File("C:\\Users\\lx\\Desktop\\baidu.png");
				if(!file.exists()) {
					file.createNewFile();
				}
				imageOutput = new FileImageOutputStream(file);
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
		}finally {
			if(imageOutput != null) {
				try {
					imageOutput.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
		}
	}
}