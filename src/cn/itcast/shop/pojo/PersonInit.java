package cn.itcast.shop.pojo;

import java.util.List;

public class PersonInit {
	Integer payCount;//������
	Integer sendCount;//������
	Integer confirmCount;//���ջ�
	List<MyCollectionDto> collection;//�ҵ��ղ�
	Product hot;//����
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
