package cn.itcast.shop.pojo;
/**
 * 报表数据 
 *
 */

import java.math.BigDecimal;
import java.util.List;

public class ReportInfo {
	private BigDecimal todayIncome;//今天收入
	private BigDecimal totalIncome;//总收入
	private Long todayOrders;//今天订单数量
	private Long totalOrders;//总订单数量
	private List<SalesInfo> sales;//最近七日销量
	private List<IncomeInfo> income;//最近七日收入
	private MonthSales monthSales;//最近半年销量
	public List<SalesInfo> getSales() {
		return sales;
	}

	public void setSales(List<SalesInfo> sales) {
		this.sales = sales;
	}

	public List<IncomeInfo> getIncome() {
		return income;
	}

	public void setIncome(List<IncomeInfo> income) {
		this.income = income;
	}

	public BigDecimal getTodayIncome() {
		return todayIncome;
	}

	public void setTodayIncome(BigDecimal todayIncome) {
		this.todayIncome = todayIncome;
	}

	public BigDecimal getTotalIncome() {
		return totalIncome;
	}

	public void setTotalIncome(BigDecimal totalIncome) {
		this.totalIncome = totalIncome;
	}

	public Long getTodayOrders() {
		return todayOrders;
	}

	public void setTodayOrders(Long todayOrders) {
		this.todayOrders = todayOrders;
	}

	public Long getTotalOrders() {
		return totalOrders;
	}

	public void setTotalOrders(Long totalOrders) {
		this.totalOrders = totalOrders;
	}

	public MonthSales getMonthSales() {
		return monthSales;
	}

	public void setMonthSales(MonthSales monthSales) {
		this.monthSales = monthSales;
	}
	
}
