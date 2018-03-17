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
     * 根据类别ID查找最新商品
     * @param cateId
     * @return
     */
	Product getNewProductByCateId(@Param("cateId")Integer cateId);

	/**
	 * 根据卖家I的查询商品列表
	 * @param sellerId
	 * @return
	 */
	List<Product> getListBySellerId(@Param("sellerId")String sellerId);

	/**
	 * 根据类别ID查询商品列表
	 * @param cateId
	 * @param num 查询个数
	 * @return
	 */
	List<Product> getListByCateId(@Param("cateId")Integer cateId, @Param("num")Integer num);

	/**
	 * 获取分页查询列表
	 * @param param
	 * @return
	 */
	List<Product> getPagingList(ProPagingParam param);

	/**
	 * 获取查询总数
	 * @param param
	 * @return
	 */
	int getCount(ProPagingParam param);
}