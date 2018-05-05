package cn.itcast.shop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.itcast.shop.pojo.CartItemParam;
import cn.itcast.shop.pojo.MyCollectionDto;
import cn.itcast.shop.pojo.User;
import cn.itcast.shop.service.ICartItemService;
import cn.itcast.shop.service.IMyCollectionService;

@RequestMapping("/myCollection")
@Controller
public class MyCollectionController {
	@Autowired 
	private IMyCollectionService myCollectionService;
	@Autowired
	private ICartItemService cartItemService;
	
	@RequestMapping(value="/collect",method={RequestMethod.GET})
	public String collect(String id,HttpSession session,Model model) throws Exception{
		User user=(User)session.getAttribute("loginSession");
		if(user==null){
			model.addAttribute("message", "Äú»¹Î´µÇÂ¼£¬ÇëÏÈµÇÂ¼");
			return "forward:/jsps/login.jsp";
		}
		String []ids={id};
		myCollectionService.collect(ids,user.getUid());
		return "redirect:/product/getProById.action?id="+id;
	}
	@RequestMapping(value="/getList")
	public String getList(HttpSession session,Model model) throws Exception{
		User user=(User)session.getAttribute("loginSession");
		if(user==null){
			model.addAttribute("message", "Äú»¹Î´µÇÂ¼£¬ÇëÏÈµÇÂ¼");
			return "forward:/jsps/login.jsp";
		}
		List<MyCollectionDto> list= myCollectionService.getList(user.getUid(),null);
		model.addAttribute("collectList", list);
		return "forward:/jsps/person/collection.jsp";
	}
	
	@RequestMapping("/addCartItem")
	public String addCartItem(CartItemParam param,HttpSession session,Model model) throws Exception{
		String message = null;
		User user = (User) session.getAttribute("loginSession");
		if (user == null) {
			message = "Äú»¹Î´µÇÂ½£¬ÇëÏÈµÇÂ¼";
			model.addAttribute("message", message);
			return "forward:/jsps/login.jsp";
		}
		if(param.getAmount()==null||param.getAmount()<=0){
			param.setAmount(1);
		}
		param.setUid(user.getUid());
		cartItemService.addCartItem(param,session);
		return "forward:/jsps/person/collection.jsp";
	}
	@RequestMapping("/delete")
	public String delete(String id,Model model) throws Exception{
		myCollectionService.delete(id);
		return "forward:/jsps/person/collection.jsp";
	}
	

}
