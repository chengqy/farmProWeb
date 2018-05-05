package cn.itcast.shop.service.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.itcast.shop.exception.MyException;
import cn.itcast.shop.mapper.CartItemMapper;
import cn.itcast.shop.mapper.ProductMapper;
import cn.itcast.shop.pojo.CartItem;
import cn.itcast.shop.pojo.CartItemDto;
import cn.itcast.shop.pojo.CartItemExample;
import cn.itcast.shop.pojo.CartItemParam;
import cn.itcast.shop.pojo.Product;
import cn.itcast.shop.service.ICartItemService;
import cn.itcast.shop.service.IMyCollectionService;
import cn.itcast.shop.utils.UUIDUtils;

@Service
public class CartItemService implements ICartItemService {
	@Autowired
	private CartItemMapper cartItemMapper;
	@Autowired
	private ProductMapper productMapper;
	@Autowired
	IMyCollectionService myCollectionService;

	@Transactional
	@Override
	public void addCartItem(CartItemParam param, HttpSession session) throws Exception {
		if(param.getProId()==null){
			throw new MyException("��ƷID����Ϊ��");
		}
		Product pro=productMapper.selectByPrimaryKey(param.getProId());
		//���ﳵ�Ƿ��Ѵ��ڸ���Ʒ
		CartItem record=cartItemMapper.selectOne(param.getProId(),param.getUid());
		//����
		if(record==null){
			CartItem cartItem=new CartItem();
			BeanUtils.copyProperties(param, cartItem);
			cartItem.setCartItemId(UUIDUtils.uuid());
			cartItem.setTotal(new BigDecimal(param.getAmount()).multiply(pro.getPrice()));
			cartItem.setCreateTime(new Date());
			cartItemMapper.insertSelective(cartItem);
			//�޸Ĺ��ﳵ����session
			Integer cartSession=(Integer)session.getAttribute("cartSession");
			if (cartSession!=null) {
				cartSession=cartSession+1;
				session.setAttribute("cartSession", cartSession);
			}
		}else{
			record.setCreateTime(new Date());
			//�ɼ�¼��ɾ��
			if(record.getDeleted()){
				record.setAmount(param.getAmount());
				record.setTotal(new BigDecimal(param.getAmount()).multiply(pro.getPrice()));
				record.setDeleted(false);
				cartItemMapper.updateByPrimaryKey(record);
				//�޸Ĺ��ﳵ����session
				Integer cartSession=(Integer)session.getAttribute("cartSession");
				if (cartSession!=null) {
					cartSession=cartSession+1;
					session.setAttribute("cartSession", cartSession);
				}
			}else{
				int amount=record.getAmount();
				BigDecimal total=record.getTotal();
				record.setAmount(amount+param.getAmount());
				record.setTotal(total.add(new BigDecimal(param.getAmount()).multiply(pro.getPrice())));
				cartItemMapper.updateByPrimaryKey(record);
			}
		}
		
	}

	@Override
	public List<CartItemDto> getList(String uid) {
		List<CartItemDto> result=new ArrayList<CartItemDto>();
		CartItemExample example=new CartItemExample();
		example.createCriteria().andUidEqualTo(uid).andDeletedEqualTo(false);
		List<CartItem> list=cartItemMapper.selectByExample(example);
		if(list==null){
			return result;
		}else{
			for(CartItem cart:list){
				CartItemDto dto=new CartItemDto();
				BeanUtils.copyProperties(cart, dto);
				Product pro=productMapper.selectByPrimaryKey(cart.getProId());
				if(pro!=null){
					BeanUtils.copyProperties(pro, dto);
				}
				result.add(dto);
			}
			return result;
		}
		
	}

	@Override
	public void delete(String[] proIds,String uid) {
		cartItemMapper.delete(proIds,uid);
	}

	@Transactional
	@Override
	public void moveCollect(String[] proIds, String uid) throws Exception {
		//�����ղؼ�
		myCollectionService.collect(proIds,uid);
		//ɾ���������ղؼ���Ŀ
		this.delete(proIds, uid);
	}

}
