package cn.itcast.shop.pojo;

import java.math.BigDecimal;

/**
 * 收入
 *
 */
public class IncomeInfo {
	private String day;
	private BigDecimal income;

	public IncomeInfo() {
	}

	public IncomeInfo(String day, BigDecimal income) {
		super();
		this.day = day;
		this.income = income;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public BigDecimal getIncome() {
		return income;
	}

	public void setIncome(BigDecimal income) {
		this.income = income;
	}
}
