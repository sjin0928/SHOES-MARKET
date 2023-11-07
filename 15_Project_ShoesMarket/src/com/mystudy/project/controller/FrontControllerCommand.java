package com.mystudy.project.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.project.command.AdidasCommand;
import com.mystudy.project.command.BestCommand;
import com.mystudy.project.command.BrandCommand;
import com.mystudy.project.command.Command;
import com.mystudy.project.command.ConverseCommand;
import com.mystudy.project.command.InquiryCommand;
import com.mystudy.project.command.InquiryDeleteCommand;
import com.mystudy.project.command.InquirySearchCommand;
import com.mystudy.project.command.InquiryUpdateCommand;
import com.mystudy.project.command.InquiryUpdateViewCommand;
import com.mystudy.project.command.InquiryViewCommand;
import com.mystudy.project.command.InquiryWriteCommand;
import com.mystudy.project.command.ItemBulletinBoardCommand;
import com.mystudy.project.command.ItemDeleteCommand;
import com.mystudy.project.command.ItemDetailCommand;
import com.mystudy.project.command.LoginCommand;
import com.mystudy.project.command.MainCommand;
import com.mystudy.project.command.NewBalCommand;
import com.mystudy.project.command.NewCommand;
import com.mystudy.project.command.ProductDetailCommand;
import com.mystudy.project.command.ProductWriteCommand;
import com.mystudy.project.command.SearchCommand;
import com.mystudy.project.command.ToCartCommand;
import com.mystudy.project.command.itemUpdateCommand;

@WebServlet("/controller")
public class FrontControllerCommand extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> FrontControllerCommand doGet() 실행----");
		String type = request.getParameter("type");
		
		System.out.println(">type : " + type);
		
		Command command = null;
		// 231024 박수진

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
		if ("inquiryDelete".equals(type)) {
			command = new InquiryDeleteCommand();
		}
		if ("inquiryWrite".equals(type)) {
			command = new InquiryWriteCommand();
		}
		// 231026-김서영
		
		if ("main".equals(type)) {
			command = new MainCommand();
		}
		if ("new".equals(type)) {
			command = new NewCommand();
		}
		if ("best".equals(type)) {
			command = new BestCommand();
		}
		if ("productDetail".equals(type)) {
			command = new ProductDetailCommand();
		}
		if ("productWrite".equals(type)) {
			command = new ProductWriteCommand();
		}
		if("itemBulletinBoard".equals(type)) {
			System.out.println("this : " + this);
			command = new ItemBulletinBoardCommand();
		}
		if("itemDetail".equals(type)) {
			command = new ItemDetailCommand();
		}
		if("itemUpdate".equals(type)) {
			command = new itemUpdateCommand();
		}
		if("itemDelete".equals(type)) {
			command = new ItemDeleteCommand();
		}
		if("search".equals(type)) {
			command = new SearchCommand();
		}
		if("brand".equals(type)) {
			command = new BrandCommand();
		}
		if("adidas".equals(type)) {
			command = new AdidasCommand();
		}
		if("newBal".equals(type)) {
			command = new NewBalCommand();
		}
		if("converse".equals(type)) {
			command = new ConverseCommand();
		}
		if("toCart".equals(type)) {
			command = new ToCartCommand();
		}
		if("login".equals(type)) {
			command = new LoginCommand();
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
