package cn.itcast.shop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.itcast.shop.exception.MyException;
import cn.itcast.shop.pojo.Address;
import cn.itcast.shop.pojo.AddressParam;
import cn.itcast.shop.pojo.AddressQueryAll;
import cn.itcast.shop.pojo.User;
import cn.itcast.shop.service.IAddressService;
import cn.itcast.shop.service.ICityService;
import cn.itcast.shop.service.IProvinceService;

@RequestMapping("/address")
@Controller
public class AddressController {

	@Autowired
	private IAddressService addressService;
	@Autowired
	private IProvinceService provinceService;
	@Autowired
	private ICityService cityService;

	@RequestMapping("/add")
	public String add(Model model, AddressParam addressParam,
			HttpSession session) {
		String message = null;
		boolean flag = true;
		User user = (User) session.getAttribute("loginSession");
		if (user == null) {
			message = "����δ��½�����ȵ�¼";
			model.addAttribute("message", message);
			return "login";
		}
		String pid = addressParam.getProvince();
		String cid = addressParam.getCity();
		String ad = addressParam.getAddress();
		String uid=user.getUid();
		if (addressParam.getReceiver().equals("")
				|| !addressParam.getPhone()
				.matches("^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(18[0,5-9]))\\d{8}$")) {
			message = "�������ջ��˻���ȷ���ֻ�����";
			flag = false;
		} else if (pid.equals("") || cid.equals("")) {
			message = "��ѡ���ջ���ַ";
			flag = false;
		} else if (ad.equals("") || ad == null || ad.length() < 6) {
			message = "��ϸ��ַ����������6����";
			flag = false;
		}
		if (flag) {
			addressService.update(addressParam, uid);
			return "redirect:/jsps/person/address.jsp";
		} else {
			model.addAttribute("addressParam", addressParam);
			model.addAttribute("message", message);
			return "forward:/jsps/person/address.jsp";
		}
	}

	/**
	 * ��ȡ��ַҳ���ʼ����Ϣ
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/queryAll")
	public String queryAll(Model model,HttpSession session) {
		User user = (User) session.getAttribute("loginSession");
		if (user == null) {
			String message = "����δ��½�����ȵ�¼";
			model.addAttribute("message", message);
			return "login";
		}
		AddressQueryAll addressQueryAll = new AddressQueryAll();
		addressQueryAll.setProvinceList(provinceService.getList());
		List<Address> addressList=addressService.getList(user.getUid());
		if(addressList!=null)
			addressQueryAll.setAddressList(addressList);
		model.addAttribute("addressQueryAll", addressQueryAll);
		return "forward:/jsps/person/address.jsp";

	}

	@RequestMapping(value = "/changeStatusTrue", method = { RequestMethod.GET })
	public String changeStatusTrue(Model model, String id,HttpSession session) throws Exception {
		Address address = addressService.getAddressByID(id);
		if (address == null) {
			throw new MyException("��ַ������");
		}
		User user = (User) session.getAttribute("loginSession");
		if (user == null) {
			String message = "����δ��½�����ȵ�¼";
			model.addAttribute("message", message);
			return "login";
		}
		if(!address.getUid().equals(user.getUid())){
			throw new MyException("��Ҫ�Ҹı��˵���Ϣ��");
		}
		
		addressService.changeStatusTrue(address,user.getUid());
		return "redirect:/jsps/person/address.jsp";
	}
	
	@RequestMapping(value = "/getAddress", method = { RequestMethod.GET })
	public String getAddress(Model model, String id) throws Exception {
		Address address = addressService.getAddressByID(id);
		if (address == null) {
			throw new MyException("��ַ������");
		}
		String province=address.getProvince();
		address.setProvince(provinceService.getProvinceByName(province).getPid().toString());
		model.addAttribute("address", address);
		return "forward:/jsps/person/addressEdit.jsp";
	}
	
	/**
	 * ɾ����ַ
	 * @param model
	 * @param id
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/delete", method = { RequestMethod.GET })
	public String delete(Model model, String id,HttpSession session) throws Exception {
		Address address = addressService.getAddressByID(id);
		if (address == null) {
			throw new MyException("��ַ������");
		}
		User user = (User) session.getAttribute("loginSession");
		if (user == null) {
			String message = "����δ��½�����ȵ�¼";
			model.addAttribute("message", message);
			return "login";
		}
		if(!address.getUid().equals(user.getUid())){
			throw new MyException("��Ҫ�Ҹı��˵���Ϣ��");
		}
		addressService.deleteById(id);
		return "redirect:/jsps/person/address.jsp";
	}
	
	@RequestMapping("/update")
	public String update(Model model, AddressParam addressParam,
			HttpSession session) {
		String message = null;
		boolean flag = true;
		User user = (User) session.getAttribute("loginSession");
		if (user == null) {
			message = "����δ��½ �����ȵ�¼";
			model.addAttribute("message", message);
			return "login";
		}
		String pid = addressParam.getProvince();
		String cid = addressParam.getCity();
		String ad = addressParam.getAddress();
		if (addressParam.getReceiver().equals("")
				|| !addressParam.getPhone()
				.matches("^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(18[0,5-9]))\\d{8}$")) {
			message = "�������ջ��˻���ȷ���ֻ�����";
			flag = false;
		} else if (pid.equals("") || cid.equals("")) {
			message = "��ѡ���ջ���ַ";
			flag = false;
		} else if (ad.equals("") || ad == null || ad.length() < 6) {
			message = "��ϸ��ַ����������6����";
			flag = false;
		}
		if (flag) {
			
			addressService.update(addressParam,user.getUid());
			return "redirect:/jsps/person/address.jsp";
		} else {
			model.addAttribute("address", addressParam);
			model.addAttribute("message", message);
			return "forward:/jsps/person/addressEdit.jsp";
		}
	}
}
