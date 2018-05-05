package cn.itcast.shop.pojo;

/**
 * 销量
 * 
 * @author grit
 *
 */
public class SalesInfo {
	private String name;
	private Long value;

	public SalesInfo() {
	}

	public SalesInfo(String name, Long value) {
		super();
		this.name = name;
		this.value = value;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Long getValue() {
		return value;
	}

	public void setValue(Long value) {
		this.value = value;
	}

}
