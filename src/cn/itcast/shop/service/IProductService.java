package cn.itcast.shop.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import cn.itcast.shop.pojo.ProInitDto;
import cn.itcast.shop.pojo.ProPagingParam;
import cn.itcast.shop.pojo.Product;
import cn.itcast.shop.pojo.ProductDto;
import cn.itcast.shop.pojo.ProductParam;

public interface IProductService {

	/**
	 * 添加农产品
	 * @param productParam
	 * @param pic
	 * @param head
	 * @return
	 * @throws Exception
	 */
	Product add(ProductParam productParam, MultipartFile[] pic, MultipartFile head)throws Exception;

	/**
	 * 根据商家Id获取商品列表
	 * @param sellerId
	 * @return
	 */
	List<ProductDto> getListBySellerId(String sellerId);

	/**
	 * 根据id查询商品
	 * @param id
	 * @return
	 * @throws Exception 
	 */
	ProductDto getProById(String id,String uid) throws Exception;

	/**
	 * 首页初始化
	 * @return
	 */
	ProInitDto mainInit();

	/**
	 * 分页查询列表
	 * @param param
	 * @return
	 */
	ProInitDto getPagingList(ProPagingParam param);


}
