package cn.itcast.shop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.itcast.shop.mapper.ProvinceMapper;
import cn.itcast.shop.pojo.Province;
import cn.itcast.shop.service.IProvinceService;

@Service
public class ProvinceService implements IProvinceService {
	@Autowired 
	public ProvinceMapper provinceMapper;

	@Override
	public List<Province> getList() {
		
		return provinceMapper.getList();
	}

	@Override
	public Province getProvinceById(Integer id) {
		
		return provinceMapper.selectByPrimaryKey(id);
	}

	@Override
	public Province getProvinceByName(String province) {
		
		return provinceMapper.getPronvinceByName(province);
	}

}
