package cn.itcast.shop.service;

import java.util.List;

import cn.itcast.shop.pojo.City;

public interface ICityService {

	/**
	 * ��ѯ�ض�ʡ�����е���
	 * @param pid
	 * @return
	 */
	List<City> getListByPid(Integer pid);

	City getCityById(Integer id);

}
