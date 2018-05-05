package cn.itcast.shop.ENUM;

public enum OrderStateEnum {
	待付款(1),待发货(2), 待收货 (3),已完成(4);
	private  Integer code;
	private OrderStateEnum(Integer code){
		this.code=code;
	}
	public Integer code(){
		return this.code;
	}

}
