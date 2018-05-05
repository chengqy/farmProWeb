package cn.itcast.shop.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.itcast.shop.exception.MyException;
import cn.itcast.shop.mapper.OrdersMapper;
import cn.itcast.shop.pojo.OrderDetailInfo;
import cn.itcast.shop.pojo.OrderDto;
import cn.itcast.shop.pojo.OrderPagingParam;
import cn.itcast.shop.pojo.Orders;
import cn.itcast.shop.pojo.Seller;
import cn.itcast.shop.pojo.User;
import cn.itcast.shop.service.IOrderService;

@RequestMapping("/order")
@Controller
public class OrderController {
	@Autowired
	private IOrderService orderService;
	@Autowired
	private OrdersMapper orderMapper;
	
	/**
	 * ��������
	 * @param proId
	 * @param amount
	 * @param model
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/buyAtOnce")
	public String buyAtOnce(String proId,Integer amount,Model model,HttpSession session) throws Exception{
		String message = null;
		User user = (User) session.getAttribute("loginSession");
		if (user == null) {
			message = "����δ��½�����ȵ�¼";
			model.addAttribute("message", message);
			return "forward:/jsps/login.jsp";
		}
		OrderDto dto=orderService.buyAtOnce(user.getUid(),proId,amount);
		model.addAttribute("orderDto", dto);
		return "forward:/jsps/pay.jsp";
	}
	
	/**
	 * ��ѯ�����б�
	 * @param model
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getList")
	public String getList(Model model,HttpSession session) throws Exception{
		String message = null;
		User user = (User) session.getAttribute("loginSession");
		if (user == null) {
			message = "����δ��½�����ȵ�¼";
			model.addAttribute("message", message);
			return "forward:/jsps/login.jsp";
		}
		OrderDetailInfo orderList=orderService.getList(user.getUid());
		model.addAttribute("orderList", orderList);
		return "forward:/jsps/person/order.jsp";
	}
	
	/**
	 * ȥ֧��
	 * @param orderId
	 * @param model
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/payOrder")
	public String payOrder(String orderId, Model model,HttpSession session) throws Exception{
		String message = null;
		User user = (User) session.getAttribute("loginSession");
		if (user == null) {
			message = "����δ��½�����ȵ�¼";
			model.addAttribute("message", message);
			return "forward:/jsps/login.jsp";
		}
		OrderDto dto=orderService.payOrder(orderId, user.getUid());
		model.addAttribute("orderDto", dto);
		return "forward:/jsps/pay.jsp";
	}
	
	/**
	 * ֧��
	 * @param orderId
	 * @param addressId
	 * @param model
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pay")
	public String pay(String orderId,String addressId, Model model,HttpSession session) throws Exception{
		if(StringUtils.isEmpty(addressId)||StringUtils.isEmpty(orderId)){
			throw new MyException("�ջ���ַ�򶩵�Id����Ϊ��");
		}
		String message = null;
		User user = (User) session.getAttribute("loginSession");
		if (user == null) {
			message = "����δ��½�����ȵ�¼";
			model.addAttribute("message", message);
			return "forward:/jsps/login.jsp";
		}
		OrderDto dto=orderService.pay(orderId,addressId);
		model.addAttribute("orderDto", dto);
		return "forward:/jsps/success.jsp";
	}
	
	/**
	 * ��ѯ��������
	 * @param orderId
	 * @param model
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getOrderDetail")
	public String getOrderDetail(String orderId, Model model,HttpSession session) throws Exception{
		if(StringUtils.isEmpty(orderId)){
			throw new MyException("����Id����Ϊ��");
		}
		String message = null;
		User user = (User) session.getAttribute("loginSession");
		if (user == null) {
			message = "����δ��½�����ȵ�¼";
			model.addAttribute("message", message);
			return "forward:/jsps/login.jsp";
		}
		OrderDto dto=orderService.getOrderDetail(orderId,user.getUid());
		model.addAttribute("orderDto", dto);
		return "forward:/jsps/person/orderinfo.jsp";
	}

	@RequestMapping("/deleted")
	public String deleted(String orderId, Model model,HttpSession session) throws Exception{
		if(StringUtils.isEmpty(orderId)){
			throw new MyException("����Id����Ϊ��");
		}
		String message = null;
		User user = (User) session.getAttribute("loginSession");
		if (user == null) {
			message = "����δ��½�����ȵ�¼";
			model.addAttribute("message", message);
			return "forward:/jsps/login.jsp";
		}
		orderService.deleted(orderId,user.getUid());
		return "redirect:/order/getList.action";
	}
	@RequestMapping("/changeState")
	public String changeState(String orderId,Integer state, Model model,HttpSession session) throws Exception{
		if(StringUtils.isEmpty(orderId)||state==null){
			throw new MyException("����Id��״̬����Ϊ��");
		}
		String message = null;
		User user = (User) session.getAttribute("loginSession");
		if (user == null) {
			message = "����δ��½�����ȵ�¼";
			model.addAttribute("message", message);
			return "forward:/jsps/login.jsp";
		}
		Orders order=orderMapper.selectByPrimaryKey(orderId);
		if(order==null||order.getDeleted()){
			throw new MyException("����������");
		}
		if(!order.getUid().equals(user.getUid())){
			throw new MyException("�Ƿ����ʣ�");
		}
		orderService.changeState(orderId,state);
		return "redirect:/order/getList.action";
	}
	
	/**
	 * ���ﳵ����
	 * @param proIds
	 * @param model
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/settle")
	public String settle(String []proIds,Model model,HttpSession session) throws Exception{
		String message = null;
		User user = (User) session.getAttribute("loginSession");
		if (user == null) {
			message = "����δ��½�����ȵ�¼";
			model.addAttribute("message", message);
			return "forward:/jsps/login.jsp";
		}
		OrderDto dto=orderService.settle(user.getUid(),proIds);
		model.addAttribute("orderDto", dto);
		return "forward:/jsps/pay.jsp";
	}
	@RequestMapping("/getPagingList")
	public String getPagingList(OrderPagingParam param,Model model,HttpSession session) throws Exception{
		Seller seller = (Seller) session.getAttribute("sellerSession");
		if (seller == null) {
			String message = "����δ��½�����ȵ�¼";
			model.addAttribute("message", message);
			return "forward:/adminjsps/login.jsp";
		}
		//����get������������
		String keyword=param.getKeyword();
		if(!StringUtils.isEmpty(keyword)&&keyword.equals(new String(keyword.getBytes("iso8859-1"), "iso8859-1"))){
			param.setKeyword(new String(keyword.getBytes("ISO8859-1"), "UTF-8"));
		}
		param.setSellerId(seller.getSellerId());
		if (param.getQueryPage() == null)
			param.setQueryPage(1);
		param.setPageSize(6);
		OrderDetailInfo detail=orderService.getPagingList(param);
		model.addAttribute("orderDetailInfo", detail);
		return "forward:/adminjsps/orderList.jsp";
	}
	
	@RequestMapping("/adminChangeState")
	public String adminChangeState(String orderId,Integer state, Model model,HttpSession session) throws Exception{
		if(StringUtils.isEmpty(orderId)||state==null){
			throw new MyException("����Id��״̬����Ϊ��");
		}
		Seller seller = (Seller) session.getAttribute("sellerSession");
		if (seller == null) {
			String message = "����δ��½�����ȵ�¼";
			model.addAttribute("message", message);
			return "forward:/adminjsps/login.jsp";
		}
		Orders order=orderMapper.selectByPrimaryKey(orderId);
		if(order==null||order.getDeleted()){
			throw new MyException("����������");
		}
		if(!order.getSellerId().equals(seller.getSellerId())){
			throw new MyException("�Ƿ����ʣ�");
		}
		orderService.changeState(orderId,state);
		return "redirect:/order/getPagingList.action?status=2";
	}
}

