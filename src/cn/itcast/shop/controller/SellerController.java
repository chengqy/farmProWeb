package cn.itcast.shop.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.itcast.shop.pojo.Seller;
import cn.itcast.shop.pojo.SellerParam;
import cn.itcast.shop.service.ISellerService;

@RequestMapping("/seller")
@Controller
public class SellerController {
	@Autowired 
	private ISellerService sellerService;
	
	@RequestMapping("login")
	public String  login(Model model, SellerParam sellerParam,HttpSession session) {
		String message = null;
		boolean flag = true;
		if (sellerParam.getSellerName() == null
				|| sellerParam.getSellerName().equals("")) {
			message = "请输入用户名";
			flag = false;
		} else if (sellerParam.getPassword() == null
				|| sellerParam.getPassword().equals("")) {
			message = "请输入密码";
			flag = false;
		}
		// 用户名或密码为空
		if (!flag) {
			model.addAttribute("message", message);
			model.addAttribute("sellerParam", sellerParam);
			return "login";
		}
		Seller seller = sellerService.getSellerByKeyword(sellerParam.getSellerName());
		// 用户不存在或密码不正确
		if (seller == null
				|| !(seller.getPassword().equals(sellerParam.getPassword()))) {
			message = "用户不存在或密码错误";
			flag = false;

		}
		if (flag) {
			session.setAttribute("sellerSession", seller);
			return "forward:/adminjsps/index.jsp";
		} else {
			model.addAttribute("message", message);
			model.addAttribute("sellerParam", sellerParam);
			return "forward:/adminjsps/login.jsp";
		}
		
	}

}
