package cn.itcast.shop.service;

import cn.itcast.shop.pojo.Seller;

public interface ISellerService {

	Seller getSellerByKeyword(String keyword);

}
