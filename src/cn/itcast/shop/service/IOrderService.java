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
	 * ��������
	 * @param uid
	 * @param proId
	 * @param amount
	 * @return
	 * @throws Exception 
	 */
	OrderDto buyAtOnce(String uid, String proId, Integer amount) throws Exception;

	/**
	 * ȥ֧��
	 * @param orderId
	 * @param uid
	 * @return
	 * @throws Exception
	 */
	OrderDto payOrder(String orderId, String uid) throws Exception;

	
	OrderDetailInfo getList(String uid);

	/**
	 * ����
	 * @param orderId
	 * @param addressId
	 * @return
	 * @throws Exception 
	 */
	OrderDto pay(String orderId, String addressId) throws Exception;

	OrderDto getOrderDetail(String orderId, String uid) throws Exception;

	void deleted(String orderId, String uid) throws Exception;

	/**
	 * �޸Ķ���״̬
	 * @param orderId
	 * @param state
	 * @throws Exception 
	 */
	void changeState(String orderId, Integer state) throws Exception;

	/**
	 * ���ﳵ����
	 * @param uid
	 * @param proIds
	 * @return
	 * @throws Exception 
	 */
	OrderDto settle(String uid, String[] proIds) throws Exception;

	/**
	 * ��ҳ��ѯ
	 * @param param
	 * @return
	 */
	OrderDetailInfo getPagingList(OrderPagingParam param);

	/**
	 * ������
	 * 
	 * @return
	 */
	Long selectCount(String sellerId);

	/**
	 * ������
	 * 
	 * @param beginDate
	 * @param endDate
	 * @return
	 */
	Long selectCount(String sellerId,Date beginDate, Date endDate);

	/**
	 * ����
	 * 
	 * @return
	 */
	BigDecimal selectIncome(String sellerId);

	/**
	 * ����
	 * 
	 * @param beginDate
	 * @param endDate
	 * @return
	 */
	BigDecimal selectIncome(String sellerId,Date beginDate, Date endDate);

	/**
	 * ����ͳ��
	 * 
	 * @param beginDate
	 * @param endDate
	 * @return
	 * @throws Exception 
	 */
	List<IncomeInfo> getIncomeList(String sellerId,Date beginDate, Date endDate) throws Exception;

	/**
	 * ������ͳ��
	 * 
	 * @param beginDate
	 * @param endDate
	 * @return
	 */
	List<SalesInfo> getSalesList(String sellerId,Date beginDate, Date endDate);

	/**
	 * ������ͳ��
	 * @param sellerId
	 * @return
	 */
	MonthSales getMonthSales(String sellerId);



}
