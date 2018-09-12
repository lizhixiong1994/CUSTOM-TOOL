package cn.clientTest.service;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RegexTest {

	public static void main(String[] args) {
		Pattern patter = Pattern.compile("ttp://.+?\\s");
		Matcher matcher = patter.matcher( "http://www.baidu.com ");
		if(matcher.find()) {
			System.out.println(matcher.group(1));
		}
		System.out.println(matcher);
	}

}
