package cn.itcast.shop.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.itcast.shop.pojo.MonthSalesDetail;
import cn.itcast.shop.pojo.OrderItem;
import cn.itcast.shop.pojo.OrderItemDto;
import cn.itcast.shop.pojo.OrderItemExample;
import cn.itcast.shop.pojo.Product;
import cn.itcast.shop.pojo.SalesInfo;

public interface OrderItemMapper {
    int countByExample(OrderItemExample example);

    int deleteByExample(OrderItemExample example);

    int deleteByPrimaryKey(String orderItemId);

    int insert(OrderItem record);

    int insertSelective(OrderItem record);

    List<OrderItem> selectByExample(OrderItemExample example);

    OrderItem selectByPrimaryKey(String orderItemId);

    int updateByExampleSelective(@Param("record") OrderItem record, @Param("example") OrderItemExample example);

    int updateByExample(@Param("record") OrderItem record, @Param("example") OrderItemExample example);

    int updateByPrimaryKeySelective(OrderItem record);

    int updateByPrimaryKey(OrderItem record);

	List<OrderItemDto> getListByOrderId(@Param("orderId") String orderId);

	void deleted(@Param("orderId")String orderId);
	
	 List<SalesInfo> getSalesList(@Param("sellerId")String sellerId,@Param("beginDate")Date beginDate,@Param("endDate")Date endDate);

	 /**
	  * 查询商品月销量
	  * @param id
	  * @param beginTime
	  * @param endTime
	  * @return
	  */
	Integer getSalesByProId(@Param("id")String id, @Param("beginTime")Date beginTime,@Param("endTime")Date endTime);

	/**
	 * 获取销量最多的产品id
	 * @return
	 */
	String getHot();

	/**
	 * 获取农产品月销量
	 * @param sellerId
	 * @param months
	 * @return
	 */
	List<MonthSalesDetail> getMonthSalesList(@Param("sellerId")String sellerId,@Param("months")List<String> months);

}