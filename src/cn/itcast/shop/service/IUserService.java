package cn.itcast.shop.service;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import cn.itcast.shop.pojo.PersonInit;
import cn.itcast.shop.pojo.User;
import cn.itcast.shop.pojo.UserParam;

@Service
public interface IUserService {

	/**
	 * ��¼
	 */
	public User login(UserParam param) throws Exception;

	/**
	 * ͨ���ֻ��Ų����û�
	 * 
	 * @param phone
	 * @return
	 */
	public User getUserByKeyword(String phone);

	/**
	 * ����û�
	 * 
	 * @param user
	 * @return
	 */
	public int addUser(User user);

	/**
	 * �����û�
	 * 
	 * @param uid
	 * @return
	 */
	public User getUserById(String uid);

	/**
	 * �޸��û�
	 * 
	 * @param uid
	 * @param user
	 */
	public int update(User user,HttpSession session);

	/**
	 * ������ҳ��ʼ��
	 * @param uid
	 * @return
	 */
	public PersonInit personInit(String uid);
}
