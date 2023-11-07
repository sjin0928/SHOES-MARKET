package com.mystudy.project.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.project.command.Command;
import com.mystudy.project.command.InquiryCommand;
import com.mystudy.project.command.InquiryDeleteCommand;
import com.mystudy.project.command.InquirySearchCommand;
import com.mystudy.project.command.InquiryUpdateCommand;
import com.mystudy.project.command.InquiryUpdateViewCommand;
import com.mystudy.project.command.InquiryViewCommand;


@WebServlet("/controller")
public class FrontControllerCommand extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> FrontControllerCommand doGet() 실행----");
		String type = request.getParameter("type");
		
		System.out.println(">type : " + type);
		
		Command command = null;
		if ("list".equals(type)) {
			command = new InquiryCommand();
		}
		if ("search".equals(type)) {
			command = new InquirySearchCommand();
		}
		if ("view".equals(type)) {
			command = new InquiryViewCommand();
		}
		if ("updateView".equals(type)) {
			command = new InquiryUpdateViewCommand();
		}
		if ("update".equals(type)) {
			command = new InquiryUpdateCommand();
		}
		if ("delete".equals(type)) {
			command = new InquiryDeleteCommand();
		}
		
		String path = command.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
	}	
	
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println(">> FrontController doPost() 실행----");
		req.setCharacterEncoding("UTF-8");
		doGet(req, resp);
	}
}
