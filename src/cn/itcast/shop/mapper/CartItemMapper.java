package cn.itcast.shop.mapper;

import cn.itcast.shop.pojo.CartItem;
import cn.itcast.shop.pojo.CartItemExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CartItemMapper {
    int countByExample(CartItemExample example);

    int deleteByExample(CartItemExample example);

    int deleteByPrimaryKey(String cartItemId);

    int insert(CartItem record);

    int insertSelective(CartItem record);

    List<CartItem> selectByExample(CartItemExample example);

    CartItem selectByPrimaryKey(String cartItemId);

    int updateByExampleSelective(@Param("record") CartItem record, @Param("example") CartItemExample example);

    int updateByExample(@Param("record") CartItem record, @Param("example") CartItemExample example);

    int updateByPrimaryKeySelective(CartItem record);

    int updateByPrimaryKey(CartItem record);

    /**
     * 查询购物车条目
     * @param proId
     * @param uid
     * @return
     */
	CartItem selectOne(@Param("proId")String proId, @Param("uid")String uid);

	void delete(@Param("proIds")String[] proIds, @Param("uid")String uid);

	/**
	 * 查询购物车条目数量
	 * @param uid
	 * @return
	 */
	Integer getCount(@Param("uid")String uid);
}