package cn.itcast.shop.pojo;

/**
 * 订单状态： 1.待付款 2.待发货 3. 待收货 4.待评价 5.已完成
 * @author cqy
 */
public class OrderStatus {
	Integer status;
	String name;
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
