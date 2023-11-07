package com.mystudy.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.project.command.AdidasCommand;
import com.mystudy.project.command.BestCommand;
import com.mystudy.project.command.BrandCommand;
import com.mystudy.project.command.CheckDuplicateNickNameCommand;
import com.mystudy.project.command.Command;
import com.mystudy.project.command.ConverseCommand;
import com.mystudy.project.command.CustomerCommand;
import com.mystudy.project.command.FileDownloadCommand;
import com.mystudy.project.command.FindIdByEmailCommand;
import com.mystudy.project.command.FindIdCommand;
import com.mystudy.project.command.FindPasswordByEamilCommand;
import com.mystudy.project.command.FindPasswordCommand;
import com.mystudy.project.command.InquiryListCommand;
import com.mystudy.project.command.InquiryDeleteCommand;
import com.mystudy.project.command.InquirySearchCommand;
import com.mystudy.project.command.InquiryUpdateCommand;
import com.mystudy.project.command.InquiryUpdateViewCommand;
import com.mystudy.project.command.InquiryViewCommand;
import com.mystudy.project.command.InquiryWriteCommand;
import com.mystudy.project.command.Inquiryboard;
import com.mystudy.project.command.ItemBulletinBoardCommand;
import com.mystudy.project.command.ItemDeleteCommand;
import com.mystudy.project.command.ItemDetailCommand;
import com.mystudy.project.command.LoginCommand;
import com.mystudy.project.command.LogoutCommand;
import com.mystudy.project.command.MainCommand;
import com.mystudy.project.command.MypageCommand;
import com.mystudy.project.command.NewBalCommand;
import com.mystudy.project.command.NewCommand;
import com.mystudy.project.command.NoticeListCommand;
import com.mystudy.project.command.NoticeSearchCommand;
import com.mystudy.project.command.ProductDetailCommand;
import com.mystudy.project.command.ProductWriteCommand;
import com.mystudy.project.command.RegisterCommand;
import com.mystudy.project.command.SearchCommand;
import com.mystudy.project.command.ToCartCommand;
import com.mystudy.project.command.itemUpdateCommand;


@WebServlet("/controller")
public class FrontControllerCommand extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> FrontControllerCommand doGet() 실행");
		String type = request.getParameter("type");
		System.out.println("> type : " + type);
		
		Command command = null;
		// 서영--------------------------------------------------
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
		// 효정 -----------------------------------------------
		if ("customer".equals(type)) {
			command = new CustomerCommand();
		}
		if ("login".equals(type)) {
			command = new LoginCommand();
		}
		if ("register".equals(type)) {
			command = new RegisterCommand();
		}
		if ("logout".equals(type)) {
			command = new LogoutCommand();
		}
		if ("myPage".equals(type)) {
			command = new MypageCommand();
		}
		if ("findId".equals(type)) {
			command = new FindIdCommand();
		}
		if ("findIdByEmail".equals(type)) {
			command = new FindIdByEmailCommand();
		}
		if ("findPassword".equals(type)) {
			command = new FindPasswordCommand();
		}
		if ("findPasswordByEmail".equals(type)) {
			command = new FindPasswordByEamilCommand();
		}
		if ("checkDuplicateNickName".equals(type)) {
			command = new CheckDuplicateNickNameCommand();
		}
		
		// 231024 박수진

		if ("board".equals(type)) {
			command = new Inquiryboard();
		}
		if ("list".equals(type)) {
			command = new InquiryListCommand();
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
		if ("fileDownload".equals(type)) {
			command = new FileDownloadCommand();
		}
		if ("noticeList".equals(type)) {
			command = new NoticeListCommand();
		}
		if ("noticeSearch".equals(type)) {
			command = new NoticeSearchCommand();
		}
		
		String path = command.exec(request, response); 
		request.getRequestDispatcher(path).forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println(">> FrontControllerCommand doPost() 실행----");
		req.setCharacterEncoding("UTF-8");
		doGet(req, resp);
	}
}
