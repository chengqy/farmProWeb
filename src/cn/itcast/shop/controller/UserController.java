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
	 * 登录
	 * 
	 * @param userParam
	 *            输入参数
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
			message = "请输入用户名";
			flag = false;
		} else if (userParam.getPassword() == null
				|| userParam.getPassword().equals("")) {
			message = "请输入密码";
			flag = false;
		}
		// 用户名或密码为空
		if (!flag) {
			model.addAttribute("message", message);
			model.addAttribute("userParam", userParam);
			return "login";
		}
		User user = userService.getUserByKeyword(userParam.getUsername());
		// 用户不存在或密码不正确
		if (user == null
				|| !(user.getPassword().equals(userParam.getPassword()))) {
			message = "用户不存在或密码错误";
			flag = false;

		}
		if (flag) {
			session.setAttribute("loginSession", user);
			// 添加购物车数量session
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
	 * 注册
	 * 
	 * @param userValidatorparam
	 * @param session
	 * @param model
	 * @return
	 */
	// @Validated校验，BindingResult bindingResult接收错误信息，两个配对使用
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
			userValidatorparam.setErrorMsg("code", "验证码不正确");
		}
		// 注册成功
		if (flag) {
			User user = new User();
			BeanUtils.copyProperties(userValidatorparam, user);
			userService.addUser(user);
			session.setAttribute("loginSession", user);
			// 添加购物车数量session
			Integer cart = cartItemMapper.getCount(user.getUid());
			session.setAttribute("cartSession", cart);
			return "main";
		} else {
			//页面数据会回显
			model.addAttribute("userValidatorparam", userValidatorparam);
			return "register";
		}
	}

	/**
	 * 发送注册验证码
	 */
	@RequestMapping(value = "/sendMessage", method = { RequestMethod.GET })
	public String sendMessage(HttpSession session, String phone, Model model)
			throws Exception {
		String message = null;
		if (phone.equals("null") || phone == null || phone.equals("")) {
			message = "请输入手机号";
			model.addAttribute("message", message);
			return "register";
		}
		User user = userService.getUserByKeyword(phone);
		UserValidatorParam userValidatorparam = new UserValidatorParam();
		if (user != null) {
			message = "该手机号已注册";
			model.addAttribute("message", message);
			userValidatorparam.setPhone(phone);
			model.addAttribute("userValidatorparam", userValidatorparam);
			return "register";
		}
		//发送验证码
		message=sendCode(phone, session);
		
		model.addAttribute("message", message);
		//页面数据回显
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
			message = "您还未登陆，请先登录";
			model.addAttribute("message", message);
			return "login";
		}
		User user = userService.getUserById(login.getUid());
		boolean flag = true;
		// 用户名
		String username = userParam.getUsername();
		if (!username.equals("") && !(username.equals(user.getUsername()))) {
			if (username.length() > 10 || username.length() < 3) {
				message = "用户名请输入3~10个字符";
				model.addAttribute("message", message);
				model.addAttribute("username", username);
				return "forward:/jsps/person/information.jsp";
			} else if (userService.getUserByKeyword(username) != null) {
				message = "用户名已存在";
				model.addAttribute("message", message);
				model.addAttribute("username", username);
				return "forward:/jsps/person/information.jsp";
			}
			user.setUsername(username);
			flag = false;
		}
		// 性别
		if (userParam.getSex() != null) {
			user.setSex(userParam.getSex());
			flag = false;
		}
		// 头像
		if (pic != null) {
			// 上传图片的原始名称
			String originalFilename = pic.getOriginalFilename();
			// 上传图片
			if (originalFilename != null && originalFilename.length() > 0) {// 存储图片的物理路径

				String pic_path = "C:\\Program Files (x86)\\Apache Software Foundation\\Tomcat 7.0\\webapps\\farmProShop\\images\\headImg\\";

				// 新的图片名称 UUID.randomUUID()随机数
				String newFilename = UUID.randomUUID()
						+ originalFilename.substring(originalFilename
								.lastIndexOf("."));
				// 新的图片
				File newfile = new File(pic_path + newFilename);
				// 将内存的数据写入磁盘
				System.out.println(System.getProperty("user.dir"));
				pic.transferTo(newfile);
				// 上传成功需要经新的图片名称写到itemsCustom
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
			message = "您还未登陆，请先登录";
			model.addAttribute("message", message);
			return "login";
		}
		String password = userValidatorParam.getPassword();
		String password2 = userValidatorParam.getPassword2();
		// 验证原密码
		if (oldPassword.equals("") || !(oldPassword.equals(user.getPassword()))) {
			message = "原密码不正确";
			model.addAttribute("message", message);
			return "forward:/jsps/person/password.jsp";
		}
		// 新密码校验
		Boolean flag = true;
		if (password.equals("") || !password.matches("^[\\da-zA-Z]{6,10}$")) {
			message = "新密码请输入6-12数字和英文字母组成的字符";
			flag = false;
		} else if (!password2.equals(password)) {
			message = "两次密码不一致";
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
	 * 换绑手机
	 * 
	 * @param session
	 * @param code
	 *            原手机验证码
	 * @param code2
	 *            新手机验证码
	 * @param phone
	 *            新手机
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
			message = "您还未登陆，请先登录";
			model.addAttribute("message", message);
			return "login";
		}
		// 验证手机号
		if (!phone
				.matches("^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(18[0,5-9]))\\d{8}$")) {
			message = "请输入正确的手机号！";
			flag = false;

			// 验证验证码
		} else if (!code.equals(session.getAttribute(user.getPhone()))
				|| !code2.equals(session.getAttribute(phone))) {
			message = "验证码错误";
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
	 * 发送换绑手机验证码
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
		// 验证手机
		String message = null;
		if (phone.equals("null") || phone == null || phone.equals("")) {
			message = "请输入手机号";
		}else if ( userService.getUserByKeyword(phone)!= null) {
			message = "该手机号已注册";
		}else{
			//发送验证码
			message = sendCode(phone, session);
		}
		model.addAttribute("message", message);
		model.addAttribute("phone", phone);
		model.addAttribute("code", code);
		model.addAttribute("code2", code2);
		return "forward:/jsps/person/bindphone.jsp";
	}

	/**
	 * 发送验证码
	 * @param phone
	 * @param session
	 * @return
	 * @throws Exception
	 */
	private String sendCode(String phone, HttpSession session) throws Exception {
		String message = null;
		// 获取随机验证码
		String code = SmsUtils.getCode();
		// 发送短信
		SendSmsResponse smsResponse = SmsUtils.sendSms(phone, code);
		// 发送成功
		if (smsResponse.getCode() != null && smsResponse.getCode().equals("OK")) {
			message = "验证码发送成功！请5分钟内填写";
			// 保存该号码为session，值为验证码
			session.setAttribute(phone, code);
			// 设置session存活时间
			session.setMaxInactiveInterval(60 * 5);

		} else {
			message = "验证码发送失败！请检查手机号是否正确或重新发送";
		}
		return message;
	}

	/**
	 * 发送换绑旧手机验证码
	 */
	@RequestMapping(value = "/sendBindOldMessage")
	public String sendBindOldMessage(HttpSession session, String code, String code2,
			String phone,Model model) throws Exception {
		String message = null;

		User user = (User) session.getAttribute("loginSession");
		if (user == null) {
			message = "您还未登陆，请先登录";
			model.addAttribute("message", message);
			return "login";
		}
		//发送验证码
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
		// 移除购物车数量session
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
			String message = "您还未登陆，请先登录";
			model.addAttribute("message", message);
			return "login";
		}
		PersonInit personInit = userService.personInit(user.getUid());
		model.addAttribute("personInit", personInit);
		return "forward:/jsps/person/index.jsp";
	}

}
