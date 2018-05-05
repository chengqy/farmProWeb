package cn.itcast.shop.pojo;

import java.util.List;

public class ProductDto extends Product {
	private List<String> pictureList;
	private String cateName;

	private String cityName;
	private String updateTime;
	private Integer isCollect;
	private int sales;//ÔÂÏúÁ¿

	public String getCateName() {
		return cateName;
	}

	public void setCateName(String cateName) {
		this.cateName = cateName;
	}

	public String getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}

	public List<String> getPictureList() {
		return pictureList;
	}

	public void setPictureList(List<String> pictureList) {
		this.pictureList = pictureList;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public Integer getIsCollect() {
		return isCollect;
	}

	public void setIsCollect(Integer isCollect) {
		this.isCollect = isCollect;
	}

	public int getSales() {
		return sales;
	}

	public void setSales(int sales) {
		this.sales = sales;
	}
	
}
