package cn.itcast.shop.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import cn.itcast.shop.exception.MyException;
import cn.itcast.shop.mapper.ProductMapper;
import cn.itcast.shop.pojo.ProInitDto;
import cn.itcast.shop.pojo.ProPagingParam;
import cn.itcast.shop.pojo.ProductDto;
import cn.itcast.shop.pojo.ProductParam;
import cn.itcast.shop.pojo.Seller;
import cn.itcast.shop.pojo.User;
import cn.itcast.shop.service.ICategoryService;
import cn.itcast.shop.service.ICityService;
import cn.itcast.shop.service.IProductService;

@RequestMapping("/product")
@Controller
public class ProductController {
	@Autowired
	private ICategoryService categoryService;
	@Autowired
	private ICityService cityService;
	@Autowired
	private IProductService productService;
	@Autowired
	private ProductMapper productMapper;

	/**
	 * 后台添加农产品页面初始化
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/addInit")
	public String addInit(Model model,HttpSession session) {
		Seller seller = (Seller) session.getAttribute("sellerSession");
		if (seller == null) {
			String message = "您还未登陆，请先登录";
			model.addAttribute("message", message);
			return "forward:/adminjsps/login.jsp";
		}
		ProInitDto proInitDto = new ProInitDto();
		proInitDto.setCategoryList(categoryService.getList());
		proInitDto.setCityList(cityService.getListByPid(1));
		model.addAttribute("proInitDto", proInitDto);
		return "forward:/adminjsps/addPro.jsp";
	}

	/**
	 * 后台获取商品列表初始化
	 * 
	 * @param model
	 * @param session
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/getAdminPagingList")
	public String getAdminPagingList(Model model, HttpSession session,
			ProPagingParam param) throws Exception {
		Seller seller = (Seller) session.getAttribute("sellerSession");
		if (seller == null) {
			String message = "您还未登陆，请先登录";
			model.addAttribute("message", message);
			return "forward:/adminjsps/login.jsp";
		}
		//处理get请求乱码问题
		String keyword=param.getKeyword();
		if(!StringUtils.isEmpty(keyword)&&keyword.equals(new String(keyword.getBytes("iso8859-1"), "iso8859-1"))){
			param.setKeyword(new String(keyword.getBytes("ISO8859-1"), "UTF-8"));
		}
		param.setSellerId(seller.getSellerId());
		//设置分页查询页面
		if (param.getQueryPage() == null)
			param.setQueryPage(1);
		//设置每页显示数
		param.setPageSize(6);
		ProInitDto proInitDto = productService.getPagingList(param);
		model.addAttribute("proInitDto", proInitDto);
		return "forward:/adminjsps/productList.jsp";
	}

	/**
	 * 后台添加农产品
	 * 
	 * @param productParam
	 * @param model
	 * @param pic
	 * @param head
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/add")
	public String add(ProductParam productParam, Model model,
			@RequestParam("pic") MultipartFile[] pic,
			@RequestParam("head") MultipartFile head, HttpSession session)
			throws Exception {

		Seller seller = (Seller) session.getAttribute("sellerSession");
		if (seller == null) {
			String message = "您还未登陆，请先登录";
			model.addAttribute("message", message);
			return "forward:/adminjsps/login.jsp";
		}
		// 校验信息
		Boolean flag = true;
		
		//新增商品
		if(StringUtils.isEmpty(productParam.getProId())){
			// 封面图
			if (head == null || head.getOriginalFilename() == null
					|| head.getOriginalFilename().length() <= 0) {
				productParam.setErrorMsg("proImage", "封面图不能为空");
				flag = false;
	
			}
		}
		if (!productParam.validate()) {
			flag = false;
		}
		if (!flag) {
			model.addAttribute("productParam", productParam);
			return "forward:/adminjsps/addPro.jsp";
		} else {
			productParam.setSellerId(seller.getSellerId());
			productService.add(productParam, pic, head);
			return "redirect:/product/getAdminPagingList.action";

		}
	}

	/**
	 * 根据ID查询商品
	 * 
	 * @param model
	 * @param id
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getProById", method = { RequestMethod.GET })
	public String getProById(Model model, String id, HttpSession session)
			throws Exception {
		User user = (User) session.getAttribute("loginSession");
		ProInitDto proInitDto = null;
		if (user != null)
			proInitDto = productService.getProDetailInfo(id, user.getUid());
		else
			proInitDto = productService.getProDetailInfo(id, null);
		model.addAttribute("proInitDto", proInitDto);
		return "forward:/jsps/introduction.jsp";
	}

	/**
	 * 首页初始化
	 * @param model
	 * @param id
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/mainInit", method = { RequestMethod.GET })
	public String mainInit(Model model, String id, HttpSession session)
			throws Exception {
		ProInitDto dto = productService.mainInit();
		model.addAttribute("mainProInitDto", dto);
		return "forward:/jsps/main.jsp";
	}

	/**
	 * 分页查询商品列表
	 * 
	 * @param model
	 * @param param
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getPagingList")
	public String getPagingList(Model model, ProPagingParam param,
			HttpSession session) throws Exception {
		String keyword=param.getKeyword();
		//处理get请求乱码问题
		if(!StringUtils.isEmpty(keyword)&&keyword.equals(new String(keyword.getBytes("iso8859-1"), "iso8859-1"))){
			param.setKeyword(new String(keyword.getBytes("ISO8859-1"), "UTF-8"));
		}
		if (param.getQueryPage() == null)
			param.setQueryPage(1);
		param.setPageSize(8);
		ProInitDto proInitDto = productService.getPagingList(param);
		model.addAttribute("proInitDto", proInitDto);
		return "forward:/jsps/proList.jsp";
	}
	@RequestMapping(value = "/deleted")
	public String deleted(Model model, String[] proIds,
			HttpSession session) throws Exception {
		Seller seller = (Seller) session.getAttribute("sellerSession");
		if (seller == null) {
			String message = "您还未登陆，请先登录";
			model.addAttribute("message", message);
			return "forward:/adminjsps/login.jsp";
		}
		
		productService.deleted(proIds,seller.getSellerId());
		return "redirect:/product/getAdminPagingList.action";
	}
	
	@RequestMapping(value = "/changeStatusTrue")
	public String changeStatusTrue(Model model, String[] proIds,
			HttpSession session) throws Exception {
		Seller seller = (Seller) session.getAttribute("sellerSession");
		if (seller == null) {
			String message = "您还未登陆，请先登录";
			model.addAttribute("message", message);
			return "forward:/adminjsps/login.jsp";
		}
		
		productService.changeStatus(proIds,seller.getSellerId(),1);
		return "redirect:/product/getAdminPagingList.action";
	}
	
	@RequestMapping(value = "/changeStatusFalse")
	public String changeStatusFalse(Model model, String[] proIds,
			HttpSession session) throws Exception {
		Seller seller = (Seller) session.getAttribute("sellerSession");
		if (seller == null) {
			String message = "您还未登陆，请先登录";
			model.addAttribute("message", message);
			return "forward:/adminjsps/login.jsp";
		}
		
		productService.changeStatus(proIds,seller.getSellerId(),0);
		return "redirect:/product/getAdminPagingList.action";
	}
	
	/**
	 * 编辑商品
	 * 
	 * @param model
	 * @param id
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/editProduct", method = { RequestMethod.GET })
	public String editProduct(Model model, String id, HttpSession session)
			throws Exception {
		if(StringUtils.isEmpty(id)){
			throw new MyException("id不能为空");
		}
		Seller seller = (Seller) session.getAttribute("sellerSession");
		if (seller == null) {
			String message = "您还未登陆，请先登录";
			model.addAttribute("message", message);
			return "forward:/adminjsps/login.jsp";
		}
		ProductParam product = new ProductParam();
		BeanUtils.copyProperties(productMapper.selectByPrimaryKey(id), product);
		model.addAttribute("productParam", product);
		return "forward:/adminjsps/addPro.jsp";
	}
}
