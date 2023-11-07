package com.mystudy.project.command;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.project.vo.InquiryVO;


public class FileDownloadCommand implements Command {
	
		@Override
		public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			System.out.println("--FileDownloadComman--");		

			System.out.println(request.getAttribute("vo")); 
			String inqImgPath = request.getParameter("inqImgPath");
			String inqImgName = request.getParameter("inqImgName");
			String inquiryNum = request.getParameter("inquiryNum");
			String idx = request.getParameter("idx");
			String keyword = request.getParameter("keyword");
			String cPage = request.getParameter("cPage");

			System.out.println("inqImgPath : " + inqImgPath);
			System.out.println("inqImgName : " + inqImgName);
			System.out.println("inquiryNum : " + inquiryNum);
			System.out.println("idx : " + idx);
			System.out.println("keyword : " + keyword);
			System.out.println("cPage : " + cPage);
			
			String filePath = inqImgPath + "\\" + inqImgName;
			File file = new File(filePath);
			
			System.out.println("file : " + file);
		    if (file.exists()) {
		        String fileName = file.getName();
		        System.out.println("fileName : " + fileName);
		        response.setContentType("application/octet-stream");
		        response.setHeader("Content-Disposition", "attachment; filename=\"" + inqImgName + "\"");

		        try (InputStream inputStream = new FileInputStream(file);
		             OutputStream outputStream = response.getOutputStream()) {
			            byte[] buffer = new byte[4096];
			            int bytesRead = -1;
			            while ((bytesRead = inputStream.read(buffer)) != -1) {
			                outputStream.write(buffer, 0, bytesRead);
		            }
		        } catch (IOException e) {
		            e.printStackTrace();
		        }
		    } else {
		    	response.getWriter().println("파일을 찾을 수 없습니다.");
		    }
		    return null;
			    
				
		}
}
