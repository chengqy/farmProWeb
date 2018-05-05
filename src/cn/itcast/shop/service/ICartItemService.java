package cn.itcast.shop.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import cn.itcast.shop.pojo.CartItemDto;
import cn.itcast.shop.pojo.CartItemParam;

public interface ICartItemService {

	/**
	 * 加入购物车
	 * @param param
	 * @param session 
	 * @throws Exception 
	 */
	void addCartItem(CartItemParam param, HttpSession session) throws Exception;

	/**
	 * 根据用户ID查询购物车列表
	 * @param uid 用户ID
	 * @return
	 */
	List<CartItemDto> getList(String uid);

	void delete(String[] proIds, String uid);

	void moveCollect(String[] proIds, String uid) throws Exception;

}
