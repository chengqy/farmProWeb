package cn.itcast.shop.service;

import java.util.List;

import cn.itcast.shop.pojo.MyCollectionDto;

public interface IMyCollectionService {

	/**
	 *  �ղ���Ʒ
	 * @param proIds
	 * @param uid
	 * @throws Exception
	 */
	void collect(String[] proIds, String uid) throws Exception;

	List<MyCollectionDto> getList(String uid,Integer limit);

	void delete(String id) throws Exception;


}
