package cn.itcast.shop.ENUM;

public enum CategoryEnum {
	����ˮ��(1),��������(2),�����߲�(3),ũ����Ʒ(4),��ζ����(5),�ز�ר��(6);
	private  Integer code;
	private CategoryEnum(Integer code){
		this.code=code;
	}
	public Integer code(){
		return this.code;
	}
}
