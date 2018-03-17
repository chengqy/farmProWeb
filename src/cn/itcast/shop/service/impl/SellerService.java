package cn.itcast.shop.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.itcast.shop.mapper.SellerMapper;
import cn.itcast.shop.pojo.Seller;
import cn.itcast.shop.service.ISellerService;

@Service
public class SellerService implements ISellerService {
	@Autowired
	private SellerMapper sellerMapper;

	@Override
	public Seller getSellerByKeyword(String keyword) {
		return sellerMapper.getSellerByKeyword(keyword);
	}

}
