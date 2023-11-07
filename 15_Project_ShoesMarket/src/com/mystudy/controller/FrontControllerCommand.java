package com.mystudy.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.project.command.AdidasCommand;
import com.mystudy.project.command.BestCommand;
import com.mystudy.project.command.BoardCommand;
import com.mystudy.project.command.BrandCommand;
import com.mystudy.project.command.BuyCommand;
import com.mystudy.project.command.CartCommand;
import com.mystudy.project.command.CartDeleteCommand;
import com.mystudy.project.command.CartListCommand;
import com.mystudy.project.command.CartMainCommand;
import com.mystudy.project.command.CartUpdateCommand;
import com.mystudy.project.command.CheckDuplicateNickNameCommand;
import com.mystudy.project.command.Command;
import com.mystudy.project.command.ConverseCommand;
import com.mystudy.project.command.CustomerCommand;
import com.mystudy.project.command.FileDownloadCommand;
import com.mystudy.project.command.FindIdByEmailCommand;
import com.mystudy.project.command.FindIdCommand;
import com.mystudy.project.command.FindPasswordByEamilCommand;
import com.mystudy.project.command.FindPasswordCommand;
import com.mystudy.project.command.InquiryDeleteCommand;
import com.mystudy.project.command.InquiryListCommand;
import com.mystudy.project.command.InquirySearchCommand;
import com.mystudy.project.command.InquiryUpdateCommand;
import com.mystudy.project.command.InquiryUpdateViewCommand;
import com.mystudy.project.command.InquiryViewCommand;
import com.mystudy.project.command.InquiryWriteCommand;
import com.mystudy.project.command.InquiryWriteViewCommand;
import com.mystudy.project.command.ItemBulletinBoardCommand;
import com.mystudy.project.command.ItemDeleteCommand;
import com.mystudy.project.command.ItemDetailCommand;
import com.mystudy.project.command.LoginCommand;
import com.mystudy.project.command.LogoutCommand;
import com.mystudy.project.command.MainCommand;
import com.mystudy.project.command.ManageCustomerCommand;
import com.mystudy.project.command.ManagerCommentDeleteCommand;
import com.mystudy.project.command.ManagerCommentWriteCommand;
import com.mystudy.project.command.ManagerInquiryCommand;
import com.mystudy.project.command.ManagerInquirySearchCommand;
import com.mystudy.project.command.ManagerInquiryViewCommand;
import com.mystudy.project.command.ManagerNociteViewCommand;
import com.mystudy.project.command.ManagerNociteWriteCommand;
import com.mystudy.project.command.ManagerNoticeDeleteCommand;
import com.mystudy.project.command.ManagerNoticeListCommand;
import com.mystudy.project.command.ManagerNoticeSearchCommand;
import com.mystudy.project.command.ManagerNoticeUpdateCommand;
import com.mystudy.project.command.ManagerNoticeUpdateViewCommand;
import com.mystudy.project.command.MyInfoCommand;
import com.mystudy.project.command.MypageCommand;
import com.mystudy.project.command.NewBalCommand;
import com.mystudy.project.command.NewCommand;
import com.mystudy.project.command.NoticeListCommand;
import com.mystudy.project.command.NoticeSearchCommand;
import com.mystudy.project.command.NoticeViewCommand;
import com.mystudy.project.command.ProductDetailCommand;
import com.mystudy.project.command.ProductWriteCommand;
import com.mystudy.project.command.PumaCommand;
import com.mystudy.project.command.PurchaseCommand;
import com.mystudy.project.command.RegisterCommand;
import com.mystudy.project.command.SearchCommand;
import com.mystudy.project.command.ToCartCommand;
import com.mystudy.project.command.VansCommand;
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
		if("vans".equals(type)) {
			command = new VansCommand();
		}
		if("puma".equals(type)) {
			command = new PumaCommand();
		}
		if ("myInfo".equals(type)) { // 주문 내역 , 고객이 작성한 게시물 내역 조회하는 곳 , 여기서 개인정보 수정하러 가는 곳 있음
			command = new MyInfoCommand();
		}
		if("manageCoustomer".equals(type)) { // 관리자가 고객 정보 조회하는 곳 
			command = new ManageCustomerCommand();
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
		if ("myPage".equals(type)) { // 개인정보 수정
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
		//주영 --------------------------------------------
		if("toCart".equals(type)) { // 장바구니 담는 커맨드 
			command = new ToCartCommand();
		}
		if ("cart".equals(type)) {
			command = new CartCommand();
		}
		if ("buy".equals(type)) {
	        command = new BuyCommand(); // BuyCommand 추가 
	    }
		if ("update".equals(type)) {
	        command = new CartUpdateCommand();
	    }
		if ("delete".equals(type)) {
	        command = new CartDeleteCommand();
	    }
		if ("cartMain".equals(type)) {
	    	command = new CartMainCommand();
	    }
		if ("cartList".equals(type)) { // main에서 장바구니 버튼 클릭 시 실행 -> cart.jsp로 넘어감 
	    	command = new CartListCommand();
	    }
		if ("purchase".equals(type)) {
	        command = new PurchaseCommand();
		}
		

		// 231024 박수진

		if ("board".equals(type)) {
			command = new BoardCommand();
		}
		if ("inquiryList".equals(type)) {
			command = new InquiryListCommand();
		}
		if ("inquirySearch".equals(type)) {
			command = new InquirySearchCommand();
		}
		if ("inquiryView".equals(type)) {
			command = new InquiryViewCommand();
		}
		if ("inquiryUpdateView".equals(type)) {
			command = new InquiryUpdateViewCommand();
		}
		if ("inquiryUpdate".equals(type)) {
			command = new InquiryUpdateCommand();
		}
		if ("inquiryDelete".equals(type)) {
			command = new InquiryDeleteCommand();
		}
		if ("inquiryWriteView".equals(type)) {
			command = new InquiryWriteViewCommand();
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
		if ("noticeView".equals(type)) {
			command = new NoticeViewCommand();
		}
		if ("managerInquiry".equals(type)) {
			command = new ManagerInquiryCommand();
		}
		if ("managerInquiryView".equals(type)) {
			command = new ManagerInquiryViewCommand();
		}
		if ("managerCommentWrite".equals(type)) {
			command = new ManagerCommentWriteCommand();
		}
		if ("managerCommentDelete".equals(type)) {
			command = new ManagerCommentDeleteCommand();
		}
		if ("managerInquirySearch".equals(type)) {
			command = new ManagerInquirySearchCommand();
		}
		if ("managerNoticeList".equals(type)) {
			command = new ManagerNoticeListCommand();
		}
		if ("managerNoticeSearch".equals(type)) {
			command = new ManagerNoticeSearchCommand();
		}
		if ("managerNociteWrite".equals(type)) {
			command = new ManagerNociteWriteCommand();
		}
		if ("managerNoticeView".equals(type)) {
			command = new ManagerNociteViewCommand();
		}
		if ("managerNoticeUpdateView".equals(type)) {
			command = new ManagerNoticeUpdateViewCommand();
		}
		if ("managerNoticeUpdate".equals(type)) {
			command = new ManagerNoticeUpdateCommand();
		}
		if ("managerNoticeDelete".equals(type)) {
			command = new ManagerNoticeDeleteCommand();
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
