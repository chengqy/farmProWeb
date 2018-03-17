package cn.itcast.shop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.itcast.shop.pojo.City;
import cn.itcast.shop.service.ICityService;

@RequestMapping("/city")
@Controller
public class CityController {
	@Autowired
	private ICityService cityService;

	/**
	 * ��ѯĳʡ�����е���
	 * 
	 * @param pid
	 *            ʡID
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getListByPid")
	public @ResponseBody List<City> getListByPid(Integer pid) throws Exception {

		return cityService.getListByPid(pid);
	}

}
