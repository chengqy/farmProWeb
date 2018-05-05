package cn.itcast.shop.service.impl;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.itcast.shop.ENUM.OrderStateEnum;
import cn.itcast.shop.exception.MyException;
import cn.itcast.shop.mapper.AddressMapper;
import cn.itcast.shop.mapper.CartItemMapper;
import cn.itcast.shop.mapper.OrderItemMapper;
import cn.itcast.shop.mapper.OrdersMapper;
import cn.itcast.shop.mapper.ProductMapper;
import cn.itcast.shop.pojo.CartItem;
import cn.itcast.shop.pojo.IncomeInfo;
import cn.itcast.shop.pojo.MonthSales;
import cn.itcast.shop.pojo.MonthSalesDetail;
import cn.itcast.shop.pojo.MonthSalesInfo;
import cn.itcast.shop.pojo.OrderDetailInfo;
import cn.itcast.shop.pojo.OrderDto;
import cn.itcast.shop.pojo.OrderItem;
import cn.itcast.shop.pojo.OrderItemDto;
import cn.itcast.shop.pojo.OrderItemExample;
import cn.itcast.shop.pojo.OrderPagingParam;
import cn.itcast.shop.pojo.OrderStatus;
import cn.itcast.shop.pojo.Orders;
import cn.itcast.shop.pojo.Product;
import cn.itcast.shop.pojo.SalesInfo;
import cn.itcast.shop.service.IAddressService;
import cn.itcast.shop.service.IOrderService;
import cn.itcast.shop.utils.DateUtils;
import cn.itcast.shop.utils.MyRandomUtils;
import cn.itcast.shop.utils.MyStringUtils;
import cn.itcast.shop.utils.UUIDUtils;

@Service
public class OrderService implements IOrderService {

	@Autowired
	private OrdersMapper orderMapper;
	@Autowired
	private OrderItemMapper orderItemMapper;
	@Autowired
	private ProductMapper productMapper;
	@Autowired
	private IAddressService addressService;
	@Autowired
	private OrderItemService orderItemService;
	@Autowired
	private AddressMapper addressMapper;
	@Autowired
	private CartItemMapper cartItemMapper;
	@Autowired
	private CartItemService cartItemService;

	@Override
	@Transactional
	public OrderDto buyAtOnce(String uid, String proId, Integer amount)
			throws Exception {
		OrderDto result = new OrderDto();
		Product pro = productMapper.selectByPrimaryKey(proId);
		if (pro == null) {
			throw new MyException("��Ʒ��¼������");
		}
		BigDecimal total = pro.getPrice().multiply(new BigDecimal(amount));
		Date date = new Date();
		// ��Ӷ���
		String orderId = UUIDUtils.uuid();
		Orders order = new Orders();
		order.setOrderId(orderId);
		order.setOrderNum(MyRandomUtils.RandomNumber(12));
		order.setSubTotal(total);
		order.setState(OrderStateEnum.������.code());
		order.setUid(uid);
		order.setSellerId(pro.getSellerId());
		order.setCreateTime(date);
		orderMapper.insertSelective(order);
		// ��Ӷ�����Ŀ
		OrderItem item = new OrderItem();
		item.setOrderItemId(UUIDUtils.uuid());
		item.setOrderId(orderId);
		item.setAmount(amount);
		item.setProId(proId);
		item.setTotal(total);
		item.setCreateTime(new Date());
		orderItemMapper.insertSelective(item);
		result = this.payOrder(orderId, uid);
		// �޸���Ʒ���
		productMapper.updateStock(proId, amount, 0);

		return result;
	}

	@Override
	public OrderDto payOrder(String orderId, String uid) throws Exception {
		Orders order = orderMapper.selectByPrimaryKey(orderId);
		if (order == null || order.getDeleted()) {
			throw new MyException("���������ڣ�");
		}
		if (!order.getUid().equals(uid)) {
			throw new MyException("�Ƿ����ʣ�");
		}
		OrderDto result = new OrderDto();
		BeanUtils.copyProperties(order, result);
		result.setAddressList(addressService.getList(uid));
		result.setOrderItemList(orderItemService.getListByOrderId(orderId));
		return result;
	}

	@Override
	public OrderDetailInfo getList(String uid) {
		OrderDetailInfo result = new OrderDetailInfo();
		// �����û�ID��ѯ���ж���
		List<Orders> orderList = orderMapper.getListByUid(uid);
		if (orderList == null) {
			return result;
		}
		// ���ж���
		List<OrderDto> allList = new ArrayList<OrderDto>();
		// ��֧������
		List<OrderDto> payList = new ArrayList<OrderDto>();
		// ����������
		List<OrderDto> deliveryList = new ArrayList<OrderDto>();
		// ���ջ�����
		List<OrderDto> confirmList = new ArrayList<OrderDto>();

		for (Orders order : orderList) {
			OrderDto dto = new OrderDto();
			BeanUtils.copyProperties(order, dto);
			// ���ݶ�����ѯ���ж�����Ŀ
			List<OrderItemDto> itemList = orderItemMapper
					.getListByOrderId(order.getOrderId());
			dto.setOrderItemList(itemList);
			dto.setTime(DateUtils.parseDate(order.getCreateTime(),
					DateUtils.TIMESTAMP_PATTERN));
			allList.add(dto);
			// ����Ӧ���������Ӧ�б�
			if (order.getState().equals(OrderStateEnum.������.code())) {
				payList.add(dto);
			}
			if (order.getState().equals(OrderStateEnum.������.code())) {
				deliveryList.add(dto);
			}
			if (order.getState().equals(OrderStateEnum.���ջ�.code())) {
				confirmList.add(dto);
			}
		}
		result.setAllList(allList);
		result.setConfirmList(confirmList);
		result.setDeliveryList(deliveryList);
		result.setPayList(payList);
		return result;
	}

	@Transactional
	@Override
	public OrderDto pay(String orderId, String addressId) throws Exception {
		List<String> ids = MyStringUtils.toList(orderId);
		BigDecimal total = new BigDecimal(0);
		for (String id : ids) {
			Orders order = orderMapper.selectByPrimaryKey(id);
			if (order == null || order.getDeleted()) {
				throw new MyException("����������");
			}
			// ����ջ���ַ
			order.setAddressId(addressId);
			// �޸Ķ���״̬
			order.setState(OrderStateEnum.������.code());
			orderMapper.updateByPrimaryKeySelective(order);

			total = total.add(order.getSubTotal());
		}

		OrderDto dto = new OrderDto();
		dto.setSubTotal(total);
		// ��ѯ��ַ��Ϣ
		BeanUtils.copyProperties(addressMapper.selectByPrimaryKey(addressId),
				dto);
		// �ֻ��ż���
		dto.setPhone(MyStringUtils.encrypt(dto.getPhone()));
		return dto;
	}

	@Override
	public OrderDto getOrderDetail(String orderId, String uid) throws Exception {
		OrderDto result = this.payOrder(orderId, uid);
		if (result.getAddressId() != null) {
			BeanUtils.copyProperties(
					addressMapper.selectByPrimaryKey(result.getAddressId()),
					result);
		}
		//ʱ���ʽ��
		result.setTime(DateUtils.parseDate(result.getCreateTime(),
				DateUtils.TIMESTAMP_PATTERN));
		return result;
	}

	@Transactional
	@Override
	public void deleted(String orderId, String uid) throws Exception {
		Orders order = orderMapper.selectByPrimaryKey(orderId);
		if (order == null || order.getDeleted()) {
			throw new MyException("����������");
		}
		// ��������ǰ����ȡ������
		if (!order.getState().equals(OrderStateEnum.������.code())
				&& !order.getState().equals(OrderStateEnum.������.code())) {
			throw new MyException("����״̬������˲���");
		}
		if (!order.getUid().equals(uid)) {
			throw new MyException("�Ƿ����ʣ�");
		}
		order.setDeleted(true);
		orderMapper.updateByPrimaryKeySelective(order);
		// �޸���Ʒ���
		OrderItemExample example = new OrderItemExample();
		example.createCriteria().andOrderIdEqualTo(orderId)
				.andDeletedEqualTo(false);
		List<OrderItem> list = orderItemMapper.selectByExample(example);
		for (OrderItem item : list) {
			productMapper.updateStock(item.getProId(), item.getAmount(), 1);
		}
		// ɾ����ض�����Ŀ
		orderItemMapper.deleted(orderId);

	}

	@Override
	public void changeState(String orderId, Integer state) throws Exception {
		Orders order = orderMapper.selectByPrimaryKey(orderId);
		// ����״̬��֤
		// ����
		if (state.equals(OrderStateEnum.���ջ�.code())) {
			if (!order.getState().equals(OrderStateEnum.������.code())) {
				throw new MyException("����״̬������˲���");
			}
		}
		// ȷ���ջ�
		if (state.equals(OrderStateEnum.�����.code())) {
			if (!order.getState().equals(OrderStateEnum.���ջ�.code())) {
				throw new MyException("����״̬������˲���");
			}
		}
		order.setState(state);
		orderMapper.updateByPrimaryKeySelective(order);

	}

	@Transactional
	@Override
	public OrderDto settle(String uid, String[] proIds) throws Exception {
		// ������Ʒ��Ŀ��ѯ����ID
		List<String> idList = productMapper.getSellerList(proIds);
		if (idList == null || idList.size() <= 0) {
			throw new MyException("�����쳣");
		}

		OrderDto result = new OrderDto();
		BigDecimal all = new BigDecimal(0);
		List<OrderItemDto> list = new ArrayList<OrderItemDto>();
		List<String> ids = new ArrayList<String>();
		// �������һ��ֶ���
		String orderNum = MyRandomUtils.RandomNumber(12);
		Date date = new Date();
		for (String sellerId : idList) {
			// ������Ϣ����ͬ���Ҳ�ֲ�ͬ����
			String orderId = UUIDUtils.uuid();
			Orders order = new Orders();
			order.setOrderId(orderId);
			order.setState(OrderStateEnum.������.code());
			order.setUid(uid);
			order.setCreateTime(date);
			order.setSellerId(sellerId);
			order.setOrderNum(orderNum);
			BigDecimal subTotal = new BigDecimal(0);
			for (String proId : proIds) {
				// ���Һ͹��ﳵ��Ŀ��Ʒ������ͬ
				Product pro = productMapper.selectByPrimaryKey(proId);
				if (sellerId.equals(pro.getSellerId())) {
					CartItem cart = cartItemMapper.selectOne(proId, uid);
					if (cart == null || cart.getDeleted()) {
						throw new MyException("���ﳵ��¼������");
					}

					// ��Ӷ�����Ŀ
					OrderItem item = new OrderItem();
					BeanUtils.copyProperties(cart, item);
					item.setOrderItemId(UUIDUtils.uuid());
					item.setOrderId(orderId);
					item.setCreateTime(date);
					orderItemMapper.insertSelective(item);

					// �޸���Ʒ���
					productMapper.updateStock(proId, cart.getAmount(), 0);

					subTotal = subTotal.add(cart.getTotal());
					// ɾ�����ﳵ��Ŀ
					cart.setDeleted(true);
					cartItemMapper.updateByPrimaryKeySelective(cart);

					// ������Ϣ����
					OrderItemDto dto = new OrderItemDto();
					BeanUtils.copyProperties(item, dto);
					BeanUtils.copyProperties(pro, dto);
					list.add(dto);

				}

			}
			order.setSubTotal(subTotal);
			orderMapper.insertSelective(order);
			ids.add(orderId);
			all = all.add(subTotal);
		}
		result.setSubTotal(all);
		result.setOrderId(MyStringUtils.toString(ids));
		result.setOrderItemList(list);
		result.setAddressList(addressMapper.getList(uid));
		return result;
	}

	@Override
	public OrderDetailInfo getPagingList(OrderPagingParam param) {
		OrderDetailInfo result = new OrderDetailInfo();
		// ����״̬�б�
		result.setStatusList(getStatusList());

		result.setOrderPageParam(param);
		// ��ѯ����
		int count = orderMapper.getCount(param);
		if (count <= 0) {
			return result;
		}
		result.getOrderPageParam().setTotalCount(count);
		// ҳ��
		int page = count / param.getPageSize().intValue() + 1;
		if (count % (param.getPageSize().intValue()) == 0) {
			page = count / param.getPageSize().intValue();
		}
		result.getOrderPageParam().setTotalPage(page);
		// Ҫ��ѯҳ�泬�����ҳ����ѯ���ҳ
		if (param.getQueryPage() > page)
			param.setQueryPage(page);
		// ���÷�ҳ��ѯ��ʼλ��
		param.setOffset((param.getQueryPage().intValue() - 1)
				* param.getPageSize().intValue());
		List<OrderDto> list = orderMapper.getPagingList(param);
		// ��ʽ���µ�ʱ��
		for (OrderDto dto : list) {
			dto.setTime(DateUtils.parseDate(dto.getCreateTime(),
					DateUtils.TIMESTAMP_PATTERN));
		}
		result.getOrderPageParam().setCurrent(param.getQueryPage());
		result.setAllList(list);
		return result;
	}

	private List<OrderStatus> getStatusList() {
		List<OrderStatus> result = new ArrayList<OrderStatus>();
		for (OrderStateEnum enums : OrderStateEnum.values()) {
			OrderStatus sta = new OrderStatus();
			sta.setName(enums.name());
			sta.setStatus(enums.code());
			result.add(sta);
		}
		return result;
	}

	@Override
	public Long selectCount(String sellerId) {
		return (long) orderMapper.countBySellerId(sellerId, null, null);
	}

	@Override
	public Long selectCount(String sellerId, Date beginDate, Date endDate) {
		return (long) orderMapper.countBySellerId(sellerId, beginDate, endDate);
	}

	@Override
	public BigDecimal selectIncome(String sellerId) {
		BigDecimal income = orderMapper.sumBySellerId(sellerId, null, null);
		return income == null ? new BigDecimal(0) : income;
	}

	@Override
	public BigDecimal selectIncome(String sellerId, Date beginDate, Date endDate) {
		BigDecimal income = orderMapper.sumBySellerId(sellerId, beginDate,
				endDate);
		return income == null ? new BigDecimal(0) : income;
	}

	@Override
	public List<IncomeInfo> getIncomeList(String sellerId, Date beginDate,
			Date endDate) throws Exception {
		List<IncomeInfo> result=new ArrayList<IncomeInfo>();
		//��������
		List<String> dayList=getDays(beginDate,endDate);
		List<IncomeInfo> list=orderMapper
				.getIncomeListBySellerId(sellerId, beginDate, endDate);
		//����û�����������
		BigDecimal income=new BigDecimal(0);
		for(String day:dayList){
			boolean flag=true;
			for(IncomeInfo info:list){
				if(info.getDay().equals(day)){
					flag=false;
					result.add(info);
					break;
				}
			}
			if(flag){
				IncomeInfo info=new IncomeInfo();
				info.setDay(day);
				info.setIncome(income);
				result.add(info);
			}
		}
		
		return result;
	}

	private List<String> getDays(Date beginDate, Date endDate) throws Exception {
		List<String>result=new ArrayList<String>();
		//��ȡ�������
		int between=DateUtils.daysBetween(beginDate, endDate);
		if(between<0){
			return result;
		}
		//��ȡ�ӿ�ʼʱ�䵽����ʱ�����
		for(int i=0;i<=between;i++){
			String day=DateUtils.parseDate(DateUtils.getAfterDays(beginDate, i));
			day=day.substring(2, day.length());
			result.add(day);
			
		}
		return result;
	}

	@Override
	public List<SalesInfo> getSalesList(String sellerId, Date beginDate,
			Date endDate) {
		List<SalesInfo> result=new ArrayList<SalesInfo>();
		//�������������Ʒ
		List<Product>proList=productMapper.getListBySellerId(sellerId);
		//��ѯ��������
		List<SalesInfo> list=orderItemMapper.getSalesList(sellerId, beginDate, endDate);
		if(list!=null&&list.size()>0){
			result=list;
			return result;
		}
		//��������Ϊ0����
		Long value=new Long(0);
		for(Product pro:proList){
			SalesInfo info=new SalesInfo();
			info.setName(pro.getProName());
			boolean flag=true;
			for(SalesInfo sales:list){
				if(sales.getName().equals(info.getName())){
					info.setValue(sales.getValue());
					flag=false;
				}
			}
			if(flag){
				info.setValue(value);
			}
			result.add(info);
		}
		return result;
	}

	@Override
	public MonthSales getMonthSales(String sellerId) {
		MonthSales result=new MonthSales();
		//��ȡ��������·�
		List<String> months=getHarfYearMonths();
		result.setMonths(months);
		//�������������Ʒ
		List<Product>proList=productMapper.getListBySellerId(sellerId);
		//��ȡ�������ÿ����ÿ��ũ��Ʒ����
		List<MonthSalesDetail>salesList=orderItemMapper.getMonthSalesList(sellerId,months);
		//��װ����
		List<MonthSalesInfo> salesInfos=new ArrayList<MonthSalesInfo>();
		for(Product pro:proList){
			MonthSalesInfo info=new MonthSalesInfo();
			info.setSales(new ArrayList<Long>());
			info.setPro(pro.getProName());
			Long sales=new Long(0);
			for(String month:months){
				boolean flag=true;
				for(MonthSalesDetail detail:salesList){
					if(detail.getPro().equals(pro.getProName())&&detail.getMonths().equals(month)){
						info.getSales().add(detail.getSales());
						flag=false;
						break;
					}
				}
				//����û������������Ϊ0
				if(flag){
					info.getSales().add(sales);
				}
			}
			salesInfos.add(info);
		}
		result.setSalesInfos(salesInfos);
		return result;
	}

	private List<String> getHarfYearMonths() {
		List<String> result=new ArrayList<String>();
		Date now=new Date();
		for(int i=-5;i<=0;i++){
			Calendar c = Calendar.getInstance();
			c.setTime(now);
			c.add(Calendar.MONTH, i);
			String month=DateUtils.parseDate(c.getTime(), "yyyy-MM");
			result.add(month) ;
		}
		return result;
	}
	
}
