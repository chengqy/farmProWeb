package cn.itcast.shop.mapper;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.itcast.shop.pojo.IncomeInfo;
import cn.itcast.shop.pojo.OrderDto;
import cn.itcast.shop.pojo.OrderPagingParam;
import cn.itcast.shop.pojo.Orders;
import cn.itcast.shop.pojo.OrdersExample;

public interface OrdersMapper {
    int countByExample(OrdersExample example);

    int deleteByExample(OrdersExample example);

    int deleteByPrimaryKey(String orderId);

    int insert(Orders record);

    int insertSelective(Orders record);

    List<Orders> selectByExample(OrdersExample example);

    Orders selectByPrimaryKey(String orderId);

    int updateByExampleSelective(@Param("record") Orders record, @Param("example") OrdersExample example);

    int updateByExample(@Param("record") Orders record, @Param("example") OrdersExample example);

    int updateByPrimaryKeySelective(Orders record);

    int updateByPrimaryKey(Orders record);

    /**
     * 根据用户Id获取订单列表
     * @param uid
     * @return
     */
	List<Orders> getListByUid(@Param("uid")String uid);

	/**
	 * 分页查询订单列表
	 * @param param
	 * @return
	 */
	List<OrderDto> getPagingList(OrderPagingParam param);

	/**
	 * 查询订单总数
	 * @param param
	 * @return
	 */
	int getCount(OrderPagingParam param);
	
	/**
	 * 收入统计
	 * 
	 * @return
	 */
	List<IncomeInfo> getIncomeListBySellerId(@Param("sellerId") String sellerId, @Param("beginDate") Date beginDate,
			@Param("endDate") Date endDate);

	/**
	 * 订单统计
	 * 
	 * @param sellerId
	 * @param beginDate
	 * @param endDate
	 * @return
	 */
	long countBySellerId(@Param("sellerId") String sellerId, @Param("beginDate") Date beginDate,
			@Param("endDate") Date endDate);

	/**
	 * 收入统计
	 * 
	 * @param sellerId
	 * @param beginDate
	 * @param endDate
	 * @return
	 */
	BigDecimal sumBySellerId(@Param("sellerId") String sellerId, @Param("beginDate") Date beginDate,
			@Param("endDate") Date endDate);

	/**
	 * 查询某订单状态订单数量
	 * @param uid
	 * @param state 订单状态
	 * @return
	 */
	Integer getStateCount(@Param("uid")String uid, @Param("state")Integer state);


}