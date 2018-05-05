package cn.itcast.shop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.itcast.shop.pojo.ScanDto;
import cn.itcast.shop.pojo.User;
import cn.itcast.shop.service.IScanService;

@RequestMapping("/scan")
@Controller
public class ScanController {

	@Autowired
	private IScanService scanService;
	
	@RequestMapping("/getList")
	public String getList(HttpSession session,Model model){
		String message = null;
		User user = (User) session.getAttribute("loginSession");
		if (user == null) {
			message = "Äú»¹Î´µÇÂ½£¬ÇëÏÈµÇÂ¼";
			model.addAttribute("message", message);
			return "forward:/jsps/login.jsp";
		}
		List<ScanDto> scanList= scanService.getList(user.getUid());
		model.addAttribute("scanList", scanList);
		return "forward:/jsps/person/foot.jsp";
	}
	
	@RequestMapping("/delete")
	public String delete(Model model,String id) throws Exception{
//		String message = null;
//		User user = (User) session.getAttribute("loginSession");
//		if (user == null) {
//			message = "Äú»¹Î´µÇÂ½£¬ÇëÏÈµÇÂ¼";
//			model.addAttribute("message", message);
//			return "forward:/jsps/login.jsp";
//		}
		scanService.delete(id);
		return "redirect:/scan/getList.action";
	}
}
