package cn.itcast.shop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.itcast.shop.mapper.CartItemMapper;
import cn.itcast.shop.pojo.CartItemDto;
import cn.itcast.shop.pojo.CartItemParam;
import cn.itcast.shop.pojo.User;
import cn.itcast.shop.service.ICartItemService;
import cn.itcast.shop.service.IMyCollectionService;

@Controller
@RequestMapping("/cartItem")
public class CartItemController {

	@Autowired
	private ICartItemService cartItemService;
	@Autowired
	private IMyCollectionService myCollectionService;
	@Autowired
	private CartItemMapper cartItemMapper;
	
	
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
		return "redirect:/product/getProById.action?id="+param.getProId();
	}
	@RequestMapping("/getList")
	public String getList(HttpSession session,Model model){
		String message = null;
		User user = (User) session.getAttribute("loginSession");
		if (user == null) {
			message = "Äú»¹Î´µÇÂ½£¬ÇëÏÈµÇÂ¼";
			model.addAttribute("message", message);
			return "forward:/jsps/login.jsp";
		}
		List<CartItemDto> cartItemList= cartItemService.getList(user.getUid());
		model.addAttribute("cartItemList", cartItemList);
		return "forward:/jsps/shopcart.jsp";
	}
	
	@RequestMapping("/deleted")
	public String deleted(String[] proIds, HttpSession session,Model model){
		String message = null;
		User user = (User) session.getAttribute("loginSession");
		if (user == null) {
			message = "Äú»¹Î´µÇÂ½£¬ÇëÏÈµÇÂ¼";
			model.addAttribute("message", message);
			return "forward:/jsps/login.jsp";
		}
		cartItemService.delete(proIds,user.getUid());
		return "redirect:/cartItem/getList.action";
	}
	@RequestMapping("/moveCollect")
	public String moveCollect(String[] proIds, HttpSession session,Model model) throws Exception{
		String message = null;
		User user = (User) session.getAttribute("loginSession");
		if (user == null) {
			message = "Äú»¹Î´µÇÂ½£¬ÇëÏÈµÇÂ¼";
			model.addAttribute("message", message);
			return "redirect:/cartItem/getList.action";
		}
		cartItemService.moveCollect(proIds, user.getUid());
		
		return "redirect:/cartItem/getList.action";
	}
	
}
