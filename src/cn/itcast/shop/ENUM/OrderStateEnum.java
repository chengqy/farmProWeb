package cn.itcast.shop.ENUM;

public enum OrderStateEnum {
	������(1),������(2), ���ջ� (3),�����(4);
	private  Integer code;
	private OrderStateEnum(Integer code){
		this.code=code;
	}
	public Integer code(){
		return this.code;
	}

}
