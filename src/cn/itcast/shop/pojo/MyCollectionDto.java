package cn.itcast.shop.pojo;

import java.math.BigDecimal;

public class MyCollectionDto extends MyCollection{
	private String proName;

	private BigDecimal price;

	private String proImage;

	private Integer status;

	private Integer cateId;

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public String getProImage() {
		return proImage;
	}

	public void setProImage(String proImage) {
		this.proImage = proImage;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getCateId() {
		return cateId;
	}

	public void setCateId(Integer cateId) {
		this.cateId = cateId;
	}
	

}
