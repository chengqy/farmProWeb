package cn.itcast.shop.service.impl;

import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.itcast.shop.ENUM.OrderStateEnum;
import cn.itcast.shop.exception.MyException;
import cn.itcast.shop.mapper.OrderItemMapper;
import cn.itcast.shop.mapper.OrdersMapper;
import cn.itcast.shop.mapper.ProductMapper;
import cn.itcast.shop.mapper.UserMapper;
import cn.itcast.shop.pojo.PersonInit;
import cn.itcast.shop.pojo.User;
import cn.itcast.shop.pojo.UserParam;
import cn.itcast.shop.service.IUserService;
import cn.itcast.shop.utils.MyRandomUtils;
import cn.itcast.shop.utils.MyStringUtils;

@Service
public class UserService implements IUserService {

	@Autowired
	private UserMapper userMapper;
	@Autowired
	private OrdersMapper orderMapper;
	@Autowired
	private MyCollectionService myCollectionService;
	@Autowired
	private OrderItemMapper orderItemMapper;
	@Autowired
	private ProductMapper productMapper;


	@Override
	public User login(UserParam param) throws Exception {
		User user = userMapper.getUser(param.getUsername());
		if (user == null) {
			throw new MyException("�û���������!");
		}
		if (!param.getPassword().equals(user.getPassword())) {
			throw new MyException("����������벻��ȷ��");
		}
		return user;
	}

	@Override
	public User getUserByKeyword(String keyword) {
		User user = userMapper.getUser(keyword);
		return user;
	}
	@Transactional
	@Override
	public int addUser(User user) {
		user.setUid(UUID.randomUUID().toString().replace("-", ""));
		String username=MyRandomUtils.genRandomNum();
		User record=userMapper.getUser(username);
		while(record!=null){
			username=MyRandomUtils.genRandomNum();
			record=userMapper.getUser(username);
		}
		user.setUsername(username);
		user.setCreateTime(new Date());
		return (userMapper.insertSelective(user));
	}

	@Override
	public User getUserById(String uid) {
		return userMapper.selectByPrimaryKey(uid);
	}

	@Transactional
	@Override
	public int update( User user,HttpSession session) {
		int rs=userMapper.updateByPrimaryKey(user);
		session.setAttribute("loginSession", user);
		return rs;
	}

	@Override
	public PersonInit personInit(String uid) {
		PersonInit result=new PersonInit();
		//�����������
		result.setPayCount(orderMapper.getStateCount(uid,OrderStateEnum.������.code()));
		//��������������
		result.setSendCount(orderMapper.getStateCount(uid,OrderStateEnum.������.code()));
		//���ջ���������
		result.setConfirmCount(orderMapper.getStateCount(uid,OrderStateEnum.���ջ�.code()));
		//�ղ��б�
		result.setCollection(myCollectionService.getList(uid,8));
		//������Ʒ
		String proId=orderItemMapper.getHot();
		result.setHot(productMapper.selectByPrimaryKey(proId));
		return result;
	}

}
