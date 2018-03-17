package cn.itcast.shop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.itcast.shop.mapper.CityMapper;
import cn.itcast.shop.pojo.City;
import cn.itcast.shop.service.ICityService;

@Service
public class CityService implements ICityService {

	@Autowired
	private CityMapper cityMapper;
	@Override
	public List<City> getListByPid(Integer pid) {
		
		return cityMapper.getListByPid(pid);
	}
	@Override
	public City getCityById(Integer id) {
		
		return cityMapper.selectByPrimaryKey(id);
	}
	

}
