package cn.itcast.shop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.itcast.shop.pojo.IncomeInfo;
import cn.itcast.shop.pojo.MonthSales;
import cn.itcast.shop.pojo.ReportInfo;
import cn.itcast.shop.pojo.SalesInfo;
import cn.itcast.shop.pojo.Seller;
import cn.itcast.shop.service.IOrderService;
import cn.itcast.shop.utils.DateUtils;

@RequestMapping("/report")
@Controller
public class ReportController {
	@Autowired
	private IOrderService orderService;

	/**
	 * ����
	 * 
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "report", method = RequestMethod.GET)
	@ResponseBody
	public ReportInfo report(HttpSession session,Model model) throws Exception {
		Seller seller = (Seller) session.getAttribute("sellerSession");
		if (seller == null) {
 			return null;
		}
		ReportInfo report = new ReportInfo();
		//��������
		report.setTodayIncome(orderService.selectIncome(seller.getSellerId(), DateUtils.getCurrentDayStartTime(),
				DateUtils.getCurrentDayEndTime()));
		//���ն���
		report.setTodayOrders(
				orderService.selectCount(seller.getSellerId(),DateUtils.getCurrentDayStartTime(), DateUtils.getCurrentDayEndTime()));
		//ȫ������
		report.setTotalOrders(orderService.selectCount(seller.getSellerId()));
		//ȫ������
		report.setTotalIncome(orderService.selectIncome(seller.getSellerId()));
		//�����������
		List<IncomeInfo> incomeList = orderService.getIncomeList(seller.getSellerId(),
				DateUtils.getAfterDays(DateUtils.getCurrentDayStartTime(), -7), DateUtils.getCurrentDayEndTime());
		//�����������ũ��Ʒ����
		List<SalesInfo> sales = orderService.getSalesList(seller.getSellerId(),
				DateUtils.getAfterDays(DateUtils.getCurrentDayStartTime(), -7), DateUtils.getCurrentDayEndTime());
		//�������������
		MonthSales monthSales=orderService.getMonthSales(seller.getSellerId());
		System.out.println(monthSales.getSalesInfos().toString());
		report.setSales(sales);
		report.setIncome(incomeList);
		report.setMonthSales(monthSales);
		return report;
	}

}
