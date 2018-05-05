package cn.itcast.shop.pojo;

import java.util.List;

/**
 * 月销量
 * 
 * @author cqy
 */
public class MonthSalesInfo {
	String pro;
	private List<Long> sales;// 月销量

	public String getPro() {
		return pro;
	}

	public void setPro(String pro) {
		this.pro = pro;
	}

	public List<Long> getSales() {
		return sales;
	}

	public void setSales(List<Long> sales) {
		this.sales = sales;
	}

}
