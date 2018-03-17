package cn.itcast.shop.service;

import java.util.List;

import cn.itcast.shop.pojo.Province;

public interface IProvinceService {

	/**
	 * ��ȡʡ�б�
	 * 
	 * @return
	 */
	List<Province> getList();

	Province getProvinceById(Integer id);

	Province getProvinceByName(String province);

}
