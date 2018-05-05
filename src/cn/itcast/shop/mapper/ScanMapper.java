package cn.itcast.shop.mapper;

import cn.itcast.shop.pojo.Scan;
import cn.itcast.shop.pojo.ScanExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ScanMapper {
    int countByExample(ScanExample example);

    int deleteByExample(ScanExample example);

    int deleteByPrimaryKey(String id);

    int insert(Scan record);

    int insertSelective(Scan record);

    List<Scan> selectByExample(ScanExample example);

    Scan selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") Scan record, @Param("example") ScanExample example);

    int updateByExample(@Param("record") Scan record, @Param("example") ScanExample example);

    int updateByPrimaryKeySelective(Scan record);

    int updateByPrimaryKey(Scan record);

    /**
     * 根据用户id查询最新浏览记录
     * @param uid 用户id
     * @return
     */
	Scan getScan(@Param("uid") String uid);

	/**
	 * 查询浏览记录列表
	 * @param uid
	 * @return
	 */
	List<Scan> getListByUid(@Param("uid")String uid);
}