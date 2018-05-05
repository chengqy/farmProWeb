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
			throw new MyException("商品记录不存在");
		}
		BigDecimal total = pro.getPrice().multiply(new BigDecimal(amount));
		Date date = new Date();
		// 添加订单
		String orderId = UUIDUtils.uuid();
		Orders order = new Orders();
		order.setOrderId(orderId);
		order.setOrderNum(MyRandomUtils.RandomNumber(12));
		order.setSubTotal(total);
		order.setState(OrderStateEnum.待付款.code());
		order.setUid(uid);
		order.setSellerId(pro.getSellerId());
		order.setCreateTime(date);
		orderMapper.insertSelective(order);
		// 添加订单条目
		OrderItem item = new OrderItem();
		item.setOrderItemId(UUIDUtils.uuid());
		item.setOrderId(orderId);
		item.setAmount(amount);
		item.setProId(proId);
		item.setTotal(total);
		item.setCreateTime(new Date());
		orderItemMapper.insertSelective(item);
		result = this.payOrder(orderId, uid);
		// 修改商品库存
		productMapper.updateStock(proId, amount, 0);

		return result;
	}

	@Override
	public OrderDto payOrder(String orderId, String uid) throws Exception {
		Orders order = orderMapper.selectByPrimaryKey(orderId);
		if (order == null || order.getDeleted()) {
			throw new MyException("订单不存在！");
		}
		if (!order.getUid().equals(uid)) {
			throw new MyException("非法访问！");
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
		// 根据用户ID查询所有订单
		List<Orders> orderList = orderMapper.getListByUid(uid);
		if (orderList == null) {
			return result;
		}
		// 所有订单
		List<OrderDto> allList = new ArrayList<OrderDto>();
		// 待支付订单
		List<OrderDto> payList = new ArrayList<OrderDto>();
		// 待发货订单
		List<OrderDto> deliveryList = new ArrayList<OrderDto>();
		// 待收货订单
		List<OrderDto> confirmList = new ArrayList<OrderDto>();

		for (Orders order : orderList) {
			OrderDto dto = new OrderDto();
			BeanUtils.copyProperties(order, dto);
			// 根据订单查询所有订单条目
			List<OrderItemDto> itemList = orderItemMapper
					.getListByOrderId(order.getOrderId());
			dto.setOrderItemList(itemList);
			dto.setTime(DateUtils.parseDate(order.getCreateTime(),
					DateUtils.TIMESTAMP_PATTERN));
			allList.add(dto);
			// 将对应订单加入对应列表
			if (order.getState().equals(OrderStateEnum.待付款.code())) {
				payList.add(dto);
			}
			if (order.getState().equals(OrderStateEnum.待发货.code())) {
				deliveryList.add(dto);
			}
			if (order.getState().equals(OrderStateEnum.待收货.code())) {
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
				throw new MyException("订单不存在");
			}
			// 添加收货地址
			order.setAddressId(addressId);
			// 修改订单状态
			order.setState(OrderStateEnum.待发货.code());
			orderMapper.updateByPrimaryKeySelective(order);

			total = total.add(order.getSubTotal());
		}

		OrderDto dto = new OrderDto();
		dto.setSubTotal(total);
		// 查询地址信息
		BeanUtils.copyProperties(addressMapper.selectByPrimaryKey(addressId),
				dto);
		// 手机号加密
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
		//时间格式化
		result.setTime(DateUtils.parseDate(result.getCreateTime(),
				DateUtils.TIMESTAMP_PATTERN));
		return result;
	}

	@Transactional
	@Override
	public void deleted(String orderId, String uid) throws Exception {
		Orders order = orderMapper.selectByPrimaryKey(orderId);
		if (order == null || order.getDeleted()) {
			throw new MyException("订单不存在");
		}
		// 订单发货前允许取消订单
		if (!order.getState().equals(OrderStateEnum.待发货.code())
				&& !order.getState().equals(OrderStateEnum.待付款.code())) {
			throw new MyException("订单状态不允许此操作");
		}
		if (!order.getUid().equals(uid)) {
			throw new MyException("非法访问！");
		}
		order.setDeleted(true);
		orderMapper.updateByPrimaryKeySelective(order);
		// 修改商品库存
		OrderItemExample example = new OrderItemExample();
		example.createCriteria().andOrderIdEqualTo(orderId)
				.andDeletedEqualTo(false);
		List<OrderItem> list = orderItemMapper.selectByExample(example);
		for (OrderItem item : list) {
			productMapper.updateStock(item.getProId(), item.getAmount(), 1);
		}
		// 删除相关订单条目
		orderItemMapper.deleted(orderId);

	}

	@Override
	public void changeState(String orderId, Integer state) throws Exception {
		Orders order = orderMapper.selectByPrimaryKey(orderId);
		// 订单状态验证
		// 发货
		if (state.equals(OrderStateEnum.待收货.code())) {
			if (!order.getState().equals(OrderStateEnum.待发货.code())) {
				throw new MyException("订单状态不允许此操作");
			}
		}
		// 确认收货
		if (state.equals(OrderStateEnum.已完成.code())) {
			if (!order.getState().equals(OrderStateEnum.待收货.code())) {
				throw new MyException("订单状态不允许此操作");
			}
		}
		order.setState(state);
		orderMapper.updateByPrimaryKeySelective(order);

	}

	@Transactional
	@Override
	public OrderDto settle(String uid, String[] proIds) throws Exception {
		// 根据商品条目查询卖家ID
		List<String> idList = productMapper.getSellerList(proIds);
		if (idList == null || idList.size() <= 0) {
			throw new MyException("数据异常");
		}

		OrderDto result = new OrderDto();
		BigDecimal all = new BigDecimal(0);
		List<OrderItemDto> list = new ArrayList<OrderItemDto>();
		List<String> ids = new ArrayList<String>();
		// 根据卖家划分订单
		String orderNum = MyRandomUtils.RandomNumber(12);
		Date date = new Date();
		for (String sellerId : idList) {
			// 订单信息，不同卖家拆分不同订单
			String orderId = UUIDUtils.uuid();
			Orders order = new Orders();
			order.setOrderId(orderId);
			order.setState(OrderStateEnum.待付款.code());
			order.setUid(uid);
			order.setCreateTime(date);
			order.setSellerId(sellerId);
			order.setOrderNum(orderNum);
			BigDecimal subTotal = new BigDecimal(0);
			for (String proId : proIds) {
				// 卖家和购物车条目商品卖家相同
				Product pro = productMapper.selectByPrimaryKey(proId);
				if (sellerId.equals(pro.getSellerId())) {
					CartItem cart = cartItemMapper.selectOne(proId, uid);
					if (cart == null || cart.getDeleted()) {
						throw new MyException("购物车记录不存在");
					}

					// 添加订单条目
					OrderItem item = new OrderItem();
					BeanUtils.copyProperties(cart, item);
					item.setOrderItemId(UUIDUtils.uuid());
					item.setOrderId(orderId);
					item.setCreateTime(date);
					orderItemMapper.insertSelective(item);

					// 修改商品库存
					productMapper.updateStock(proId, cart.getAmount(), 0);

					subTotal = subTotal.add(cart.getTotal());
					// 删除购物车条目
					cart.setDeleted(true);
					cartItemMapper.updateByPrimaryKeySelective(cart);

					// 返回信息处理
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
		// 订单状态列表
		result.setStatusList(getStatusList());

		result.setOrderPageParam(param);
		// 查询总数
		int count = orderMapper.getCount(param);
		if (count <= 0) {
			return result;
		}
		result.getOrderPageParam().setTotalCount(count);
		// 页数
		int page = count / param.getPageSize().intValue() + 1;
		if (count % (param.getPageSize().intValue()) == 0) {
			page = count / param.getPageSize().intValue();
		}
		result.getOrderPageParam().setTotalPage(page);
		// 要查询页面超过最大页，查询最大页
		if (param.getQueryPage() > page)
			param.setQueryPage(page);
		// 设置分页查询开始位置
		param.setOffset((param.getQueryPage().intValue() - 1)
				* param.getPageSize().intValue());
		List<OrderDto> list = orderMapper.getPagingList(param);
		// 格式化下单时间
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
		//所有日期
		List<String> dayList=getDays(beginDate,endDate);
		List<IncomeInfo> list=orderMapper
				.getIncomeListBySellerId(sellerId, beginDate, endDate);
		//补充没有收入的日期
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
		//获取相差天数
		int between=DateUtils.daysBetween(beginDate, endDate);
		if(between<0){
			return result;
		}
		//获取从开始时间到结束时间的天
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
		//获得卖家所有商品
		List<Product>proList=productMapper.getListBySellerId(sellerId);
		//查询所有销量
		List<SalesInfo> list=orderItemMapper.getSalesList(sellerId, beginDate, endDate);
		if(list!=null&&list.size()>0){
			result=list;
			return result;
		}
		//补充销量为0数据
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
		//获取最近半年月份
		List<String> months=getHarfYearMonths();
		result.setMonths(months);
		//获得卖家所有商品
		List<Product>proList=productMapper.getListBySellerId(sellerId);
		//获取最近半年每个月每个农产品销量
		List<MonthSalesDetail>salesList=orderItemMapper.getMonthSalesList(sellerId,months);
		//封装数据
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
				//该月没有销量，补充为0
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
