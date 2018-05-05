package cn.itcast.shop.pojo;

import java.math.BigDecimal;
import java.util.Date;

public class Product {
	private String proId;

	private String proName;

	private BigDecimal price;

	private Long stock;

	private String proImage;

	private String specification;

	private String keyword;

	private String pictures;

	private String introduction;

	private Integer status;

	private Boolean deleted;

	private Integer cateId;

	private Integer cityId;

	private String sellerId;

	private Date createTime;

	public String getProId() {
		return proId;
	}

	public void setProId(String proId) {
		this.proId = proId == null ? null : proId.trim();
	}

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName == null ? null : proName.trim();
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public Long getStock() {
		return stock;
	}

	public void setStock(Long stock) {
		this.stock = stock;
	}

	public String getProImage() {
		return proImage;
	}

	public void setProImage(String proImage) {
		this.proImage = proImage == null ? null : proImage.trim();
	}

	public String getSpecification() {
		return specification;
	}

	public void setSpecification(String specification) {
		this.specification = specification == null ? null : specification
				.trim();
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword == null ? null : keyword.trim();
	}

	public String getPictures() {
		return pictures;
	}

	public void setPictures(String pictures) {
		this.pictures = pictures == null ? null : pictures.trim();
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction == null ? null : introduction.trim();
	}

	public Boolean getDeleted() {
		return deleted;
	}

	public void setDeleted(Boolean deleted) {
		this.deleted = deleted;
	}

	public Integer getCateId() {
		return cateId;
	}

	public void setCateId(Integer cateId) {
		this.cateId = cateId;
	}

	public Integer getCityId() {
		return cityId;
	}

	public void setCityId(Integer cityId) {
		this.cityId = cityId;
	}

	public String getSellerId() {
		return sellerId;
	}

	public void setSellerId(String sellerId) {
		this.sellerId = sellerId == null ? null : sellerId.trim();
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}
}