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
	 * ���ũ��Ʒ
	 * @param productParam
	 * @param pic
	 * @param head
	 * @return
	 * @throws Exception
	 */
	Product add(ProductParam productParam, MultipartFile[] pic, MultipartFile head)throws Exception;

	/**
	 * �����̼�Id��ȡ��Ʒ�б�
	 * @param sellerId
	 * @return
	 */
	List<ProductDto> getListBySellerId(String sellerId);

	/**
	 * ����id��ѯ��Ʒ
	 * @param id
	 * @return
	 * @throws Exception 
	 */
	ProductDto getProById(String id,String uid) throws Exception;

	/**
	 * ��ҳ��ʼ��
	 * @return
	 */
	ProInitDto mainInit();

	/**
	 * ��ҳ��ѯ�б�
	 * @param param
	 * @return
	 */
	ProInitDto getPagingList(ProPagingParam param);


}
