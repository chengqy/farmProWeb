package cn.itcast.shop.service;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import cn.itcast.shop.pojo.PersonInit;
import cn.itcast.shop.pojo.User;
import cn.itcast.shop.pojo.UserParam;

@Service
public interface IUserService {

	/**
	 * 登录
	 */
	public User login(UserParam param) throws Exception;

	/**
	 * 通过手机号查找用户
	 * 
	 * @param phone
	 * @return
	 */
	public User getUserByKeyword(String phone);

	/**
	 * 添加用户
	 * 
	 * @param user
	 * @return
	 */
	public int addUser(User user);

	/**
	 * 查找用户
	 * 
	 * @param uid
	 * @return
	 */
	public User getUserById(String uid);

	/**
	 * 修改用户
	 * 
	 * @param uid
	 * @param user
	 */
	public int update(User user,HttpSession session);

	/**
	 * 个人主页初始化
	 * @param uid
	 * @return
	 */
	public PersonInit personInit(String uid);
}
