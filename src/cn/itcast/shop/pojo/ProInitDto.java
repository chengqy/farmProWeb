package cn.itcast.shop.pojo;

import java.util.List;

public class ProInitDto {
	private List<Category> categoryList;// 分类列表
	private List<City> cityList;// 地区列表
	private List<ProductDto> productList;// 商品列表
	private ProductDto special; // 特产
	private ProductDto fruit;// 水果
	private ProductDto sea;// 水产
	private ProductDto vegetable;// 蔬菜
	private List<Product> specialList;// 特产表
	private List<Product> fruitList;// 水果列表
	private List<Product> seaList;// 海味列表
	private ProPagingParam proPageParam;

	public List<Category> getCategoryList() {
		return categoryList;
	}

	public void setCategoryList(List<Category> categoryList) {
		this.categoryList = categoryList;
	}

	public List<City> getCityList() {
		return cityList;
	}

	public void setCityList(List<City> cityList) {
		this.cityList = cityList;
	}

	public List<ProductDto> getProductList() {
		return productList;
	}

	public void setProductList(List<ProductDto> productList) {
		this.productList = productList;
	}

	public ProductDto getSpecial() {
		return special;
	}

	public void setSpecial(ProductDto special) {
		this.special = special;
	}

	public ProductDto getFruit() {
		return fruit;
	}

	public void setFruit(ProductDto fruit) {
		this.fruit = fruit;
	}

	public ProductDto getSea() {
		return sea;
	}

	public void setSea(ProductDto sea) {
		this.sea = sea;
	}

	public ProductDto getVegetable() {
		return vegetable;
	}

	public void setVegetable(ProductDto vegetable) {
		this.vegetable = vegetable;
	}

	public List<Product> getSpecialList() {
		return specialList;
	}

	public void setSpecialList(List<Product> specialList) {
		this.specialList = specialList;
	}

	public List<Product> getFruitList() {
		return fruitList;
	}

	public void setFruitList(List<Product> fruitList) {
		this.fruitList = fruitList;
	}

	public List<Product> getSeaList() {
		return seaList;
	}

	public void setSeaList(List<Product> seaList) {
		this.seaList = seaList;
	}

	public ProPagingParam getProPageParam() {
		return proPageParam;
	}

	public void setProPageParam(ProPagingParam proPageParam) {
		this.proPageParam = proPageParam;
	}

}
