package cn.itcast.shop.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.itcast.shop.pojo.User;
import cn.itcast.shop.service.IMyCollectionService;

@RequestMapping("/myCollection")
@Controller
public class MyCollectionController {
	@Autowired 
	private IMyCollectionService myCollectionService;
	
	@RequestMapping(value="/collect",method={RequestMethod.GET})
	public String collect(String id,HttpSession session,Model model) throws Exception{
		User user=(User)session.getAttribute("loginSession");
		if(user==null){
			model.addAttribute("message", "Äú»¹Î´µÇÂ¼£¬ÇëÏÈµÇÂ¼");
			return "forward:/jsps/login.jsp";
		}
		myCollectionService.collect(id,user);
		return "redirect:/product/getProById.action?id="+id;
	}
	

}
