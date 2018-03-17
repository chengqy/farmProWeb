package cn.itcast.shop.mapper;

import cn.itcast.shop.pojo.MyCollection;
import cn.itcast.shop.pojo.MyCollectionExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface MyCollectionMapper {
    int countByExample(MyCollectionExample example);

    int deleteByExample(MyCollectionExample example);

    int deleteByPrimaryKey(String id);

    int insert(MyCollection record);

    int insertSelective(MyCollection record);

    List<MyCollection> selectByExample(MyCollectionExample example);

    MyCollection selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") MyCollection record, @Param("example") MyCollectionExample example);

    int updateByExample(@Param("record") MyCollection record, @Param("example") MyCollectionExample example);

    int updateByPrimaryKeySelective(MyCollection record);

    int updateByPrimaryKey(MyCollection record);

    /**
     * ²éÑ¯ÊÕ²Ø¼ÇÂ¼
     * @param proId
     * @param uid
     * @return
     */
	MyCollection getCollect(@Param("proId")String proId, @Param("uid")String uid);
}