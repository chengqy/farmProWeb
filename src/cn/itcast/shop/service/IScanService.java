package cn.itcast.shop.service;

import java.util.List;

import cn.itcast.shop.pojo.ScanDto;

public interface IScanService {

	/**
	 * ����
	 * @param uid
	 * @return
	 */
	List<ScanDto> getList(String uid);

	/**
	 * ɾ�������¼
	 * @param id
	 * @throws Exception 
	 */
	void delete(String id) throws Exception;

}
