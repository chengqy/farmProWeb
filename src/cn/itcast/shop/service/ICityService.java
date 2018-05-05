package cn.itcast.shop.service;

import java.util.List;

import cn.itcast.shop.pojo.City;

public interface ICityService {

	/**
	 * 查询特定省下所有的市
	 * @param pid
	 * @return
	 */
	List<City> getListByPid(Integer pid);

	City getCityById(Integer id);

}
