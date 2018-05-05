package cn.itcast.shop.pojo;

import java.util.List;

public class PersonInit {
	Integer payCount;//待付款
	Integer sendCount;//待发货
	Integer confirmCount;//待收货
	List<MyCollectionDto> collection;//我的收藏
	Product hot;//热卖
	public Integer getPayCount() {
		return payCount;
	}
	public void setPayCount(Integer payCount) {
		this.payCount = payCount;
	}
	public Integer getSendCount() {
		return sendCount;
	}
	public void setSendCount(Integer sendCount) {
		this.sendCount = sendCount;
	}
	public Integer getConfirmCount() {
		return confirmCount;
	}
	public void setConfirmCount(Integer confirmCount) {
		this.confirmCount = confirmCount;
	}
	public List<MyCollectionDto> getCollection() {
		return collection;
	}
	public void setCollection(List<MyCollectionDto> collection) {
		this.collection = collection;
	}
	public Product getHot() {
		return hot;
	}
	public void setHot(Product hot) {
		this.hot = hot;
	}
	

}
