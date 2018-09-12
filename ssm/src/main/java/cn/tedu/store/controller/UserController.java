package cn.tedu.store.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.openxmlformats.schemas.spreadsheetml.x2006.main.STSourceType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


@RequestMapping("/user")
@Controller
public class UserController {
	UserController(){
		System.out.println(1111);
	}
	
	@RequestMapping("/show.do")
	public String	 showPassword() {
		System.out.println("UserController' showPassword()");
		return "test";
	}
	
	/**
	 * 涓婅浇鏈嶅姟鍣ㄥ鐞嗗叧閿偣
	 * 1 瀵煎叆涓婅浇澶勭悊缁勪欢 commons-fileupload锛岀敤浜庤В鏋愭枃浠朵笂杞借姹�
	 * 2 閰嶇疆Spring MVC涓婅浇瑙ｆ瀽鍣紝浣跨敤fileupload缁勪欢
	 * 	-璁剧疆鏈�澶т笂杞介檺鍒�
	 *  -璁剧疆鏂囦欢鍚嶇殑涓枃缂栫爜
	 * 3 鎺у埗鍣ㄤ娇鐢╩ultipartFile鎺ユ敹涓婅浇鐨勬枃浠舵暟鎹�
	 *   -娉ㄦ剰锛氬彉閲忓悕涓庡鎴风name灞炴�т竴鑷�
	 *   -鏂囦欢鐨勫叏閮ㄤ俊鎭彲浠ラ�氳繃multipartFile瀵硅薄鑾峰緱
	 * @param images
	 * @param memo
	 * @return
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	@RequestMapping(value="/upload.do",method=RequestMethod.POST)
	@ResponseBody
	public String upload(
			@RequestParam(value="file", required=false) MultipartFile images,String memo,HttpServletRequest request) throws IllegalStateException, IOException{
		//杩斿洖缁撴灉
		System.out.println("upload getimage");
		System.out.println(images);
		File file = new File("C:\\Users\\lx\\Desktop\\test.png");
		if(!file.exists()) {
			file.createNewFile();
		}
		FileOutputStream out = new FileOutputStream(file);
		out.write(images.getBytes());
		out.close();
		return null;
				
	}
//	
//	@RequestMapping("/upload-images.do")
//	@ResponseBody
//	public ResponseResult<Void> uploadImages(
//			@RequestParam(value="images")MultipartFile images[],
//			String memo,
//			HttpServletRequest request)throws IOException{
//		System.out.println(images.length);
//		System.out.println(memo);
//		//淇濆瓨鏂囦欢
//		if(images == null) {
//			System.out.println("娌℃湁涓婅浇鏂囦欢");
//			
//			return new ResponseResult<Void>(0, "娌℃湁涓婅浇鏂囦欢");
//		}
//		String path = "/uploads";
//		path = request.getServletContext().getRealPath(path);
//		System.out.println(path);
//		File dir = new File(path);
//		dir.mkdir();
//		for(MultipartFile file : images) {
//			String n = file.getOriginalFilename();
//			file.transferTo(new File(dir,n));
//			System.out.println("sava"+n);
//		}
//		
//		return new ResponseResult<Void>(1,"鎴愬姛",null);
//	}
}















