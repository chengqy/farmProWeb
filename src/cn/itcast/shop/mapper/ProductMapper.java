package cn.itcast.shop.mapper;

import cn.itcast.shop.pojo.ProPagingParam;
import cn.itcast.shop.pojo.Product;
import cn.itcast.shop.pojo.ProductExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ProductMapper {
    int countByExample(ProductExample example);

    int deleteByExample(ProductExample example);

    int deleteByPrimaryKey(String proId);

    int insert(Product record);

    int insertSelective(Product record);

    List<Product> selectByExample(ProductExample example);

    Product selectByPrimaryKey(String proId);

    int updateByExampleSelective(@Param("record") Product record, @Param("example") ProductExample example);

    int updateByExample(@Param("record") Product record, @Param("example") ProductExample example);

    int updateByPrimaryKeySelective(Product record);

    int updateByPrimaryKey(Product record);

    /**
     * �������ID����������Ʒ
     * @param cateId
     * @return
     */
	Product getNewProductByCateId(@Param("cateId")Integer cateId);

	/**
	 * ��������I�Ĳ�ѯ��Ʒ�б�
	 * @param sellerId
	 * @return
	 */
	List<Product> getListBySellerId(@Param("sellerId")String sellerId);

	/**
	 * �������ID��ѯ��Ʒ�б�
	 * @param cateId
	 * @param num ��ѯ����
	 * @return
	 */
	List<Product> getListByCateId(@Param("cateId")Integer cateId, @Param("num")Integer num);

	/**
	 * ��ȡ��ҳ��ѯ�б�
	 * @param param
	 * @return
	 */
	List<Product> getPagingList(ProPagingParam param);

	/**
	 * ��ȡ��ѯ����
	 * @param param
	 * @return
	 */
	int getCount(ProPagingParam param);
}