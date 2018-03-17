package cn.itcast.shop.controller;

import javassist.compiler.ast.Keyword;

import javax.servlet.http.HttpSession;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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

	/**
	 * 后台添加农产品页面初始化
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/addInit")
	public String addInit(Model model) {
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
	 */
	@RequestMapping("/getAdminPagingList")
	public String getAdminPagingList(Model model, HttpSession session,
			ProPagingParam param) {
		Seller seller = (Seller) session.getAttribute("sellerSession");
		if (seller == null) {
			String message = "您还未登陆，请先登录";
			model.addAttribute("message", message);
			return "forward:/adminjsps/login.jsp";
		}
		param.setSellerId(seller.getSellerId());
		if (param.getQueryPage() == null)
			param.setQueryPage(1);
		param.setPageSize(2);
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
		// 封面图
		if (head == null || head.getOriginalFilename() == null
				|| head.getOriginalFilename().length() <= 0) {

			productParam.setErrorMsg("proImage", "封面图不能为空");
			flag = false;

		}
		if (!productParam.validate()) {
			flag = false;
		}
		if (!flag) {
			model.addAttribute("productParam", productParam);
			return "forward:/adminjsps/addPro.jsp";
		} else {
			productParam.setSellerId(seller.getSellerId());
			ProductParam pro = new ProductParam();
			BeanUtils.copyProperties(
					productService.add(productParam, pic, head), pro);
			model.addAttribute("productParam", pro);
			return "forward:/adminjsps/addPro.jsp";

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
		ProductDto product = null;
		if (user != null)
			product = productService.getProById(id, user.getUid());
		else
			product = productService.getProById(id, null);
		model.addAttribute("productParam", product);
		return "forward:/jsps/introduction.jsp";
	}

	/**
	 * 
	 * @param model
	 * @param id
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/mainInit", method = { RequestMethod.GET })
	public String mainInit(Model model, String id, HttpSession session)
			throws Exception {
		// User user=(User)session.getAttribute("loginSession");
		ProInitDto dto = productService.mainInit();
		// if(user!=null)
		// product=productService.getProById(id,user.getUid());
		// else
		// product=productService.getProById(id,null);
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
		if (param.getQueryPage() == null)
			param.setQueryPage(1);
		param.setPageSize(3);
		ProInitDto proInitDto = productService.getPagingList(param);
		model.addAttribute("proInitDto", proInitDto);
		return "forward:/jsps/proList.jsp";
	}
}
