package cn.itcast.shop.pojo;

import java.util.List;

public class OrderParam extends Orders{
	private List<OrderItem> orderItemList;

	public List<OrderItem> getOrderItemList() {
		return orderItemList;
	}

	public void setOrderItemList(List<OrderItem> orderItemList) {
		this.orderItemList = orderItemList;
	}
	

}
