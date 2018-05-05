package cn.itcast.shop.service;

import java.util.List;

import cn.itcast.shop.pojo.Address;
import cn.itcast.shop.pojo.AddressParam;

public interface IAddressService {

	/**
	 * ָ���û��Ƿ����Ĭ�ϵ�ַ
	 * 
	 * @return
	 */
	boolean IsAddressStatusTrue(String uid);

	/**
	 * ��ѯָ���û����еĵ�ַ��Ϣ
	 * 
	 * @return
	 */
	List<Address> getList(String uid);

	Address getAddressByID(String id);

	/**
	 * ���ӻ��޸ĵ�ַ
	 * 
	 * @param addressParam
	 * @param uid
	 */
	void update(AddressParam addressParam, String uid);

	void deleteById(String id) throws Exception;

	void changeStatusTrue(Address address, String uid);

}
