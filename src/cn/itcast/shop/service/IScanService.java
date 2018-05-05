package cn.itcast.shop.service;

import java.util.List;

import cn.itcast.shop.pojo.ScanDto;

public interface IScanService {

	/**
	 * ¸ù¾Ý
	 * @param uid
	 * @return
	 */
	List<ScanDto> getList(String uid);

	/**
	 * É¾³ýä¯ÀÀ¼ÇÂ¼
	 * @param id
	 * @throws Exception 
	 */
	void delete(String id) throws Exception;

}
