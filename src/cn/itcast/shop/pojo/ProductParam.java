package cn.itcast.shop.pojo;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductParam {
	// 定义成员变量errors,用于封装表单验证时的错误信息
	private Map<String, String> errors = new HashMap<String, String>();
	private String proId;

	private String proName;

	private BigDecimal price;

	private Long stock;

	private String proImage;

	private String specification;

	private String keyword;

	private String pictures;
	private List<String> pictureList;

	private String introduction;

	private Boolean deleted;

	private Integer cateId;

	private Integer cityId;
	// private String cateName;
	//
	// private String cityName;

	private String sellerId;

	private Date createTime;
	private Integer status;

	// private Integer isCollect;

	public String getProId() {
		return proId;
	}

	public void setProId(String proId) {
		this.proId = proId;
	}

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
		this.proImage = proImage;
	}

	public String getSpecification() {
		return specification;
	}

	public void setSpecification(String specification) {
		this.specification = specification;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getPictures() {
		return pictures;
	}

	public void setPictures(String pictures) {
		this.pictures = pictures;
	}

	public List<String> getPictureList() {
		return pictureList;
	}

	public void setPictureList(List<String> pictureList) {
		this.pictureList = pictureList;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public Boolean getDeleted() {
		return deleted;
	}

	public void setDeleted(Boolean deleted) {
		this.deleted = deleted;
	}

	public String getSellerId() {
		return sellerId;
	}

	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}

	public Date getCreateTime() {
		return createTime;
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

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public boolean validate() {
		boolean flag = true;
		if (proName == null || proName.trim().equals("")) {
			errors.put("proName", "请输入标题");
			flag = false;
		}
		if (price == null || price.equals("")) {
			errors.put("price", "请输入价格.");
			flag = false;
		}
		if (stock == null || stock.equals("")) {
			errors.put("stock", "请输入库存");
			flag = false;
		}
		if (cateId == null || cateId.equals("")) {
			errors.put("cateId", "请选择类别");
			flag = false;
		}
		if (cityId == null || cityId.equals("")) {
			errors.put("cityId", "请选择类别");
			flag = false;
		}
		if (specification == null || specification.trim().equals("")) {
			errors.put("specification", "请输入规格.");
			flag = false;
		}
		return flag;
	}

	public Map<String, String> getErrors() {
		return errors;
	}

	// 向Map集合errors中添加错误信息
	public void setErrorMsg(String err, String errMsg) {
		if ((err != null) && (errMsg != null)) {
			errors.put(err, errMsg);
		}
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

}
