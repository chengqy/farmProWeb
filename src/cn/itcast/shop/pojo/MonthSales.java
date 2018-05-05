package cn.itcast.shop.pojo;

import java.util.List;

public class MonthSales {
	List<String> months;
	List<MonthSalesInfo> salesInfos;
	public List<String> getMonths() {
		return months;
	}
	public void setMonths(List<String> months) {
		this.months = months;
	}
	public List<MonthSalesInfo> getSalesInfos() {
		return salesInfos;
	}
	public void setSalesInfos(List<MonthSalesInfo> salesInfos) {
		this.salesInfos = salesInfos;
	}

}
