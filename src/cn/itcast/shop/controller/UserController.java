package cn.itcast.shop.controller;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import cn.itcast.shop.exception.MyException;
import cn.itcast.shop.mapper.CartItemMapper;
import cn.itcast.shop.pojo.PersonInit;
import cn.itcast.shop.pojo.User;
import cn.itcast.shop.pojo.UserParam;
import cn.itcast.shop.pojo.UserValidatorParam;
import cn.itcast.shop.service.IUserService;
import cn.itcast.shop.sms.SmsUtils;
import cn.itcast.shop.utils.MyStringUtils;

import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;

@RequestMapping("/user")
@Controller
public class UserController {
	@Autowired
	private IUserService userService;
	@Autowired
	private CartItemMapper cartItemMapper;

	/**
	 * ��¼
	 * 
	 * @param userParam
	 *            �������
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("/login")
	public String login(UserParam userParam, HttpSession session, Model model) {
		String message = null;
		boolean flag = true;
		if (userParam.getUsername() == null
				|| userParam.getUsername().equals("")) {
			message = "�������û���";
			flag = false;
		} else if (userParam.getPassword() == null
				|| userParam.getPassword().equals("")) {
			message = "����������";
			flag = false;
		}
		// �û���������Ϊ��
		if (!flag) {
			model.addAttribute("message", message);
			model.addAttribute("userParam", userParam);
			return "login";
		}
		User user = userService.getUserByKeyword(userParam.getUsername());
		// �û������ڻ����벻��ȷ
		if (user == null
				|| !(user.getPassword().equals(userParam.getPassword()))) {
			message = "�û������ڻ��������";
			flag = false;

		}
		if (flag) {
			session.setAttribute("loginSession", user);
			// ��ӹ��ﳵ����session
			Integer cart = cartItemMapper.getCount(user.getUid());
			session.setAttribute("cartSession", cart);
			return "redirect:/jsps/main.jsp";
		} else {
			model.addAttribute("message", message);
			model.addAttribute("userParam", userParam);
			return "login";
		}

	}

	/**
	 * ע��
	 * 
	 * @param userValidatorparam
	 * @param session
	 * @param model
	 * @return
	 */
	// @ValidatedУ�飬BindingResult bindingResult���մ�����Ϣ���������ʹ��
	@RequestMapping("/register")
	public String register(UserValidatorParam userValidatorparam,
			HttpSession session, Model model) {
		boolean flag = true;
		if (!userValidatorparam.validate())
			flag = false;
		if (session.getAttribute(userValidatorparam.getPhone()) == null
				|| !session.getAttribute(userValidatorparam.getPhone()).equals(
						userValidatorparam.getCode())) {
			flag = false;
			userValidatorparam.setErrorMsg("code", "��֤�벻��ȷ");
		}
		// ע��ɹ�
		if (flag) {
			User user = new User();
			BeanUtils.copyProperties(userValidatorparam, user);
			userService.addUser(user);
			session.setAttribute("loginSession", user);
			// ��ӹ��ﳵ����session
			Integer cart = cartItemMapper.getCount(user.getUid());
			session.setAttribute("cartSession", cart);
			return "main";
		} else {
			//ҳ�����ݻ����
			model.addAttribute("userValidatorparam", userValidatorparam);
			return "register";
		}
	}

	/**
	 * ����ע����֤��
	 */
	@RequestMapping(value = "/sendMessage", method = { RequestMethod.GET })
	public String sendMessage(HttpSession session, String phone, Model model)
			throws Exception {
		String message = null;
		if (phone.equals("null") || phone == null || phone.equals("")) {
			message = "�������ֻ���";
			model.addAttribute("message", message);
			return "register";
		}
		User user = userService.getUserByKeyword(phone);
		UserValidatorParam userValidatorparam = new UserValidatorParam();
		if (user != null) {
			message = "���ֻ�����ע��";
			model.addAttribute("message", message);
			userValidatorparam.setPhone(phone);
			model.addAttribute("userValidatorparam", userValidatorparam);
			return "register";
		}
		//������֤��
		message=sendCode(phone, session);
		
		model.addAttribute("message", message);
		//ҳ�����ݻ���
		userValidatorparam.setPhone(phone);
		model.addAttribute("userValidatorparam", userValidatorparam);
		return "register";
	}

	@RequestMapping(value = "/update")
	public String update(HttpSession session, UserParam userParam, Model model,
			@RequestParam("pic") MultipartFile pic) throws Exception {
		String message = null;
		User login = (User) session.getAttribute("loginSession");
		if (login == null) {
			message = "����δ��½�����ȵ�¼";
			model.addAttribute("message", message);
			return "login";
		}
		User user = userService.getUserById(login.getUid());
		boolean flag = true;
		// �û���
		String username = userParam.getUsername();
		if (!username.equals("") && !(username.equals(user.getUsername()))) {
			if (username.length() > 10 || username.length() < 3) {
				message = "�û���������3~10���ַ�";
				model.addAttribute("message", message);
				model.addAttribute("username", username);
				return "forward:/jsps/person/information.jsp";
			} else if (userService.getUserByKeyword(username) != null) {
				message = "�û����Ѵ���";
				model.addAttribute("message", message);
				model.addAttribute("username", username);
				return "forward:/jsps/person/information.jsp";
			}
			user.setUsername(username);
			flag = false;
		}
		// �Ա�
		if (userParam.getSex() != null) {
			user.setSex(userParam.getSex());
			flag = false;
		}
		// ͷ��
		if (pic != null) {
			// �ϴ�ͼƬ��ԭʼ����
			String originalFilename = pic.getOriginalFilename();
			// �ϴ�ͼƬ
			if (originalFilename != null && originalFilename.length() > 0) {// �洢ͼƬ������·��

				String pic_path = "C:\\Program Files (x86)\\Apache Software Foundation\\Tomcat 7.0\\webapps\\farmProShop\\images\\headImg\\";

				// �µ�ͼƬ���� UUID.randomUUID()�����
				String newFilename = UUID.randomUUID()
						+ originalFilename.substring(originalFilename
								.lastIndexOf("."));
				// �µ�ͼƬ
				File newfile = new File(pic_path + newFilename);
				// ���ڴ������д�����
				System.out.println(System.getProperty("user.dir"));
				pic.transferTo(newfile);
				// �ϴ��ɹ���Ҫ���µ�ͼƬ����д��itemsCustom
				user.setHeadImg("images/headImg/" + newFilename);
				flag = false;
			}
		}
		if (!flag) {
			userService.update(user, session);
		}
		return "redirect:/jsps/person/information.jsp";
	}

	@RequestMapping(value = "/updatePassword")
	public String updatePassword(HttpSession session,
			UserValidatorParam userValidatorParam, Model model,
			String oldPassword) throws Exception {
		String message = null;
		User user = (User) session.getAttribute("loginSession");
		if (user == null) {
			message = "����δ��½�����ȵ�¼";
			model.addAttribute("message", message);
			return "login";
		}
		String password = userValidatorParam.getPassword();
		String password2 = userValidatorParam.getPassword2();
		// ��֤ԭ����
		if (oldPassword.equals("") || !(oldPassword.equals(user.getPassword()))) {
			message = "ԭ���벻��ȷ";
			model.addAttribute("message", message);
			return "forward:/jsps/person/password.jsp";
		}
		// ������У��
		Boolean flag = true;
		if (password.equals("") || !password.matches("^[\\da-zA-Z]{6,10}$")) {
			message = "������������6-12���ֺ�Ӣ����ĸ��ɵ��ַ�";
			flag = false;
		} else if (!password2.equals(password)) {
			message = "�������벻һ��";
			flag = false;
		}
		if (flag) {
			user.setPassword(password);
			userService.update(user, session);
			return "forward:/jsps/person/index.jsp";
		}
		model.addAttribute("message", message);
		return "forward:/jsps/person/password.jsp";
	}

	/**
	 * �����ֻ�
	 * 
	 * @param session
	 * @param code
	 *            ԭ�ֻ���֤��
	 * @param code2
	 *            ���ֻ���֤��
	 * @param phone
	 *            ���ֻ�
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/bindphone")
	public String bindphone(HttpSession session, String code, String code2,
			String phone, Model model) throws Exception {
		String message = null;
		Boolean flag = true;
		User user = (User) session.getAttribute("loginSession");
		if (user == null) {
			message = "����δ��½�����ȵ�¼";
			model.addAttribute("message", message);
			return "login";
		}
		// ��֤�ֻ���
		if (!phone
				.matches("^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(18[0,5-9]))\\d{8}$")) {
			message = "��������ȷ���ֻ��ţ�";
			flag = false;

			// ��֤��֤��
		} else if (!code.equals(session.getAttribute(user.getPhone()))
				|| !code2.equals(session.getAttribute(phone))) {
			message = "��֤�����";
			flag = false;
		}
		if (flag) {
			user.setPhone(phone);
			userService.update(user, session);
			return "redirect:/jsps/person/bindphone.jsp";
		} else {
			model.addAttribute("message", message);
			model.addAttribute("phone", phone);
			model.addAttribute("code", code);
			model.addAttribute("code2", code2);
			return "forward:/jsps/person/bindphone.jsp";
		}

	}

	/**
	 * ���ͻ����ֻ���֤��
	 * @param session
	 * @param code
	 * @param code2
	 * @param phone
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/sendBindMessage")
	public String sendBindMessage(HttpSession session, String code, String code2,
			String phone,   Model model)
			throws Exception {
		// ��֤�ֻ�
		String message = null;
		if (phone.equals("null") || phone == null || phone.equals("")) {
			message = "�������ֻ���";
		}else if ( userService.getUserByKeyword(phone)!= null) {
			message = "���ֻ�����ע��";
		}else{
			//������֤��
			message = sendCode(phone, session);
		}
		model.addAttribute("message", message);
		model.addAttribute("phone", phone);
		model.addAttribute("code", code);
		model.addAttribute("code2", code2);
		return "forward:/jsps/person/bindphone.jsp";
	}

	/**
	 * ������֤��
	 * @param phone
	 * @param session
	 * @return
	 * @throws Exception
	 */
	private String sendCode(String phone, HttpSession session) throws Exception {
		String message = null;
		// ��ȡ�����֤��
		String code = SmsUtils.getCode();
		// ���Ͷ���
		SendSmsResponse smsResponse = SmsUtils.sendSms(phone, code);
		// ���ͳɹ�
		if (smsResponse.getCode() != null && smsResponse.getCode().equals("OK")) {
			message = "��֤�뷢�ͳɹ�����5��������д";
			// ����ú���Ϊsession��ֵΪ��֤��
			session.setAttribute(phone, code);
			// ����session���ʱ��
			session.setMaxInactiveInterval(60 * 5);

		} else {
			message = "��֤�뷢��ʧ�ܣ������ֻ����Ƿ���ȷ�����·���";
		}
		return message;
	}

	/**
	 * ���ͻ�����ֻ���֤��
	 */
	@RequestMapping(value = "/sendBindOldMessage")
	public String sendBindOldMessage(HttpSession session, String code, String code2,
			String phone,Model model) throws Exception {
		String message = null;

		User user = (User) session.getAttribute("loginSession");
		if (user == null) {
			message = "����δ��½�����ȵ�¼";
			model.addAttribute("message", message);
			return "login";
		}
		//������֤��
		message=sendCode(user.getPhone(), session);
		model.addAttribute("message", message);
		model.addAttribute("phone", phone);
		model.addAttribute("code", code);
		model.addAttribute("code2", code2);
		return "forward:/jsps/person/bindphone.jsp";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session, Model model) {
		User user = (User) session.getAttribute("loginSession");
		if (user != null) {
			session.removeAttribute("loginSession");
		}
		// �Ƴ����ﳵ����session
		Integer cartSession = (Integer) session.getAttribute("cartSession");
		if (cartSession != null) {
			session.removeAttribute("cartSession");
		}
		return "redirect:/jsps/main.jsp";
	}

	@RequestMapping("/personInit")
	public String personInit(HttpSession session, Model model) {
		User user = (User) session.getAttribute("loginSession");
		if (user == null) {
			String message = "����δ��½�����ȵ�¼";
			model.addAttribute("message", message);
			return "login";
		}
		PersonInit personInit = userService.personInit(user.getUid());
		model.addAttribute("personInit", personInit);
		return "forward:/jsps/person/index.jsp";
	}

}
