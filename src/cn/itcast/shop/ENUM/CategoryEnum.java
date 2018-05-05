package cn.itcast.shop.ENUM;

public enum CategoryEnum {
	生鲜水果(1),畜牧畜禽(2),新鲜蔬菜(3),农副产品(4),海味河鲜(5),特产专区(6);
	private  Integer code;
	private CategoryEnum(Integer code){
		this.code=code;
	}
	public Integer code(){
		return this.code;
	}
}
