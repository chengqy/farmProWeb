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
     * �����û�id��ѯ���������¼
     * @param uid �û�id
     * @return
     */
	Scan getScan(@Param("uid") String uid);

	/**
	 * ��ѯ�����¼�б�
	 * @param uid
	 * @return
	 */
	List<Scan> getListByUid(@Param("uid")String uid);
}