package cn.itcast.shop.service.impl;

import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.itcast.shop.exception.MyException;
import cn.itcast.shop.mapper.UserMapper;
import cn.itcast.shop.pojo.User;
import cn.itcast.shop.pojo.UserParam;
import cn.itcast.shop.service.IUserService;
import cn.itcast.shop.utils.MyRandomUtils;

@Service
public class UserService implements IUserService {

	@Autowired
	private UserMapper userMapper;

	@Override
	public User login(UserParam param) throws Exception {
		User user = userMapper.getUser(param.getUsername());
		if (user == null) {
			throw new MyException("用户名不存在!");
		}
		if (!param.getPassword().equals(user.getPassword())) {
			throw new MyException("您输入的密码不正确！");
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
		session.setAttribute("loginSession", user);
		return userMapper.updateByPrimaryKey(user);
	}

}
