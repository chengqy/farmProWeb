package cn.itcast.shop.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.itcast.shop.pojo.Province;
import cn.itcast.shop.service.IProvinceService;

@RequestMapping("/province")
@Controller
public class ProvinceController {
	@Autowired
	private IProvinceService provinceService;
	
	/**
	 * 获取所有省
	 * @return
	 */
	@RequestMapping("/getList")
	public String  getList(Model model){
		List<Province> list=new ArrayList<Province>();
		list=provinceService.getList();
		model.addAttribute("provinceList",list);
		return "forward:/jsps/person/addressEdit.jsp";	
	}

}
