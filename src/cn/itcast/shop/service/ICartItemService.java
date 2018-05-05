package cn.itcast.shop.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import cn.itcast.shop.pojo.CartItemDto;
import cn.itcast.shop.pojo.CartItemParam;

public interface ICartItemService {

	/**
	 * ���빺�ﳵ
	 * @param param
	 * @param session 
	 * @throws Exception 
	 */
	void addCartItem(CartItemParam param, HttpSession session) throws Exception;

	/**
	 * �����û�ID��ѯ���ﳵ�б�
	 * @param uid �û�ID
	 * @return
	 */
	List<CartItemDto> getList(String uid);

	void delete(String[] proIds, String uid);

	void moveCollect(String[] proIds, String uid) throws Exception;

}
