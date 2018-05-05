package cn.itcast.shop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.itcast.shop.mapper.OrderItemMapper;
import cn.itcast.shop.pojo.OrderItemDto;
import cn.itcast.shop.service.IOrderItemService;

@Service
public class OrderItemService implements IOrderItemService {

	@Autowired
	private OrderItemMapper orderItemMapper;

	public List<OrderItemDto> getListByOrderId(String orderId) {
		
		return orderItemMapper.getListByOrderId(orderId);
	}
}
