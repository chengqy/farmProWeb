package cn.itcast.shop.mapper;

import cn.itcast.shop.pojo.Address;
import cn.itcast.shop.pojo.AddressExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AddressMapper {
    int countByExample(AddressExample example);

    int deleteByExample(AddressExample example);

    int deleteByPrimaryKey(String id);

    int insert(Address record);

    int insertSelective(Address record);

    List<Address> selectByExample(AddressExample example);

    Address selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") Address record, @Param("example") AddressExample example);

    int updateByExample(@Param("record") Address record, @Param("example") AddressExample example);

    int updateByPrimaryKeySelective(Address record);

    int updateByPrimaryKey(Address record);
    /**
	 * 修改指定用户所有地址为非默认值
	 */
	void changeAllStatus(@Param("uid") String uid);

	/**
	 * 获取指定用户所有地址信息
	 * 
	 * @return
	 */
	List<Address> getList(@Param("uid") String uid);
}