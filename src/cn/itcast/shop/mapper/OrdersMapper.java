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
     * �����û�Id��ȡ�����б�
     * @param uid
     * @return
     */
	List<Orders> getListByUid(@Param("uid")String uid);

	/**
	 * ��ҳ��ѯ�����б�
	 * @param param
	 * @return
	 */
	List<OrderDto> getPagingList(OrderPagingParam param);

	/**
	 * ��ѯ��������
	 * @param param
	 * @return
	 */
	int getCount(OrderPagingParam param);
	
	/**
	 * ����ͳ��
	 * 
	 * @return
	 */
	List<IncomeInfo> getIncomeListBySellerId(@Param("sellerId") String sellerId, @Param("beginDate") Date beginDate,
			@Param("endDate") Date endDate);

	/**
	 * ����ͳ��
	 * 
	 * @param sellerId
	 * @param beginDate
	 * @param endDate
	 * @return
	 */
	long countBySellerId(@Param("sellerId") String sellerId, @Param("beginDate") Date beginDate,
			@Param("endDate") Date endDate);

	/**
	 * ����ͳ��
	 * 
	 * @param sellerId
	 * @param beginDate
	 * @param endDate
	 * @return
	 */
	BigDecimal sumBySellerId(@Param("sellerId") String sellerId, @Param("beginDate") Date beginDate,
			@Param("endDate") Date endDate);

	/**
	 * ��ѯĳ����״̬��������
	 * @param uid
	 * @param state ����״̬
	 * @return
	 */
	Integer getStateCount(@Param("uid")String uid, @Param("state")Integer state);


}