package com.lizhi;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.ServerSocket;
import java.net.Socket;

public class IOTest {
	public static void main(String[] args) {
		
		ServerSocket serverSocket;
		Socket accept;
		try {
			serverSocket = new ServerSocket(1011);
			 accept = serverSocket.accept();
			 
			 
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}
	
	public void handler(Socket socket) {
		try {
			 Reader reader=new InputStreamReader(socket.getInputStream());
			 char[] ch=new char[20];
			int index = -1;
			 StringBuilder sb=new StringBuilder();
			 String temp;
			while((index = reader.read()) >= 0) {
				 temp=new String(ch, 0, index);
			}
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
