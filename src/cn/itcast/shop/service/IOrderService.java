package cn.itcast.shop.service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import cn.itcast.shop.pojo.IncomeInfo;
import cn.itcast.shop.pojo.MonthSales;
import cn.itcast.shop.pojo.OrderDetailInfo;
import cn.itcast.shop.pojo.OrderDto;
import cn.itcast.shop.pojo.OrderPagingParam;
import cn.itcast.shop.pojo.SalesInfo;

public interface IOrderService {

	/**
	 * 立即购买
	 * @param uid
	 * @param proId
	 * @param amount
	 * @return
	 * @throws Exception 
	 */
	OrderDto buyAtOnce(String uid, String proId, Integer amount) throws Exception;

	/**
	 * 去支付
	 * @param orderId
	 * @param uid
	 * @return
	 * @throws Exception
	 */
	OrderDto payOrder(String orderId, String uid) throws Exception;

	
	OrderDetailInfo getList(String uid);

	/**
	 * 付款
	 * @param orderId
	 * @param addressId
	 * @return
	 * @throws Exception 
	 */
	OrderDto pay(String orderId, String addressId) throws Exception;

	OrderDto getOrderDetail(String orderId, String uid) throws Exception;

	void deleted(String orderId, String uid) throws Exception;

	/**
	 * 修改订单状态
	 * @param orderId
	 * @param state
	 * @throws Exception 
	 */
	void changeState(String orderId, Integer state) throws Exception;

	/**
	 * 购物车结算
	 * @param uid
	 * @param proIds
	 * @return
	 * @throws Exception 
	 */
	OrderDto settle(String uid, String[] proIds) throws Exception;

	/**
	 * 分页查询
	 * @param param
	 * @return
	 */
	OrderDetailInfo getPagingList(OrderPagingParam param);

	/**
	 * 订单数
	 * 
	 * @return
	 */
	Long selectCount(String sellerId);

	/**
	 * 订单数
	 * 
	 * @param beginDate
	 * @param endDate
	 * @return
	 */
	Long selectCount(String sellerId,Date beginDate, Date endDate);

	/**
	 * 收入
	 * 
	 * @return
	 */
	BigDecimal selectIncome(String sellerId);

	/**
	 * 收入
	 * 
	 * @param beginDate
	 * @param endDate
	 * @return
	 */
	BigDecimal selectIncome(String sellerId,Date beginDate, Date endDate);

	/**
	 * 收入统计
	 * 
	 * @param beginDate
	 * @param endDate
	 * @return
	 * @throws Exception 
	 */
	List<IncomeInfo> getIncomeList(String sellerId,Date beginDate, Date endDate) throws Exception;

	/**
	 * 日销量统计
	 * 
	 * @param beginDate
	 * @param endDate
	 * @return
	 */
	List<SalesInfo> getSalesList(String sellerId,Date beginDate, Date endDate);

	/**
	 * 月销量统计
	 * @param sellerId
	 * @return
	 */
	MonthSales getMonthSales(String sellerId);



}
