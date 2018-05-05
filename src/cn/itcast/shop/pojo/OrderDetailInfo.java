package cn.itcast.shop.pojo;

import java.util.List;


public class OrderDetailInfo  {
	private List<OrderDto> allList;//���ж���
	private List<OrderDto> payList;//��֧��
	private List<OrderDto> deliveryList;//������
	private List<OrderDto> confirmList;//���ջ�
	private List<OrderStatus> statusList;//����״̬
	private OrderPagingParam orderPageParam;
	public List<OrderDto> getAllList() {
		return allList;
	}
	public void setAllList(List<OrderDto> allList) {
		this.allList = allList;
	}
	public List<OrderDto> getPayList() {
		return payList;
	}
	public void setPayList(List<OrderDto> payList) {
		this.payList = payList;
	}
	public List<OrderDto> getDeliveryList() {
		return deliveryList;
	}
	public void setDeliveryList(List<OrderDto> deliveryList) {
		this.deliveryList = deliveryList;
	}
	public List<OrderDto> getConfirmList() {
		return confirmList;
	}
	public void setConfirmList(List<OrderDto> confirmList) {
		this.confirmList = confirmList;
	}
	public List<OrderStatus> getStatusList() {
		return statusList;
	}
	public void setStatusList(List<OrderStatus> statusList) {
		this.statusList = statusList;
	}
	public OrderPagingParam getOrderPageParam() {
		return orderPageParam;
	}
	public void setOrderPageParam(OrderPagingParam orderPageParam) {
		this.orderPageParam = orderPageParam;
	}
	

}
