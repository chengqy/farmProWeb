package cn.itcast.shop.service;

import cn.itcast.shop.pojo.User;

public interface IMyCollectionService {

	/**
	 * �ղ���Ʒ
	 * @param id
	 * @param user
	 * @throws Exception 
	 */
	void collect(String id, User user) throws Exception;

}
