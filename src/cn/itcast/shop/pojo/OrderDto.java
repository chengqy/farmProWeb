package cn.itcast.shop.pojo;

import java.util.List;

public class OrderDto extends Orders {
	
	private String province;//省
	private String city;//市
	private String address;//详细地址
	private String receiver;//收货人
	private String phone;//联系电话
	private String time;
	private List<OrderItemDto> orderItemList;
	private List<Address> addressList;
	public List<OrderItemDto> getOrderItemList() {
		return orderItemList;
	}
	public void setOrderItemList(List<OrderItemDto> orderItemList) {
		this.orderItemList = orderItemList;
	}
	public List<Address> getAddressList() {
		return addressList;
	}
	public void setAddressList(List<Address> addressList) {
		this.addressList = addressList;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
}
