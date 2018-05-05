package cn.itcast.shop.service;

import java.util.List;

import cn.itcast.shop.pojo.Address;
import cn.itcast.shop.pojo.AddressParam;

public interface IAddressService {

	/**
	 * 指定用户是否存在默认地址
	 * 
	 * @return
	 */
	boolean IsAddressStatusTrue(String uid);

	/**
	 * 查询指定用户所有的地址信息
	 * 
	 * @return
	 */
	List<Address> getList(String uid);

	Address getAddressByID(String id);

	/**
	 * 增加或修改地址
	 * 
	 * @param addressParam
	 * @param uid
	 */
	void update(AddressParam addressParam, String uid);

	void deleteById(String id) throws Exception;

	void changeStatusTrue(Address address, String uid);

}
