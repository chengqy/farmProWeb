package cn.itcast.shop.mapper;

import cn.itcast.shop.pojo.User;
import cn.itcast.shop.pojo.UserExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    int countByExample(UserExample example);

    int deleteByExample(UserExample example);

    int deleteByPrimaryKey(String uid);

    int insert(User record);

    int insertSelective(User record);

    List<User> selectByExample(UserExample example);

    User selectByPrimaryKey(String uid);

    int updateByExampleSelective(@Param("record") User record, @Param("example") UserExample example);

    int updateByExample(@Param("record") User record, @Param("example") UserExample example);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    /**
     * 根据用户名或手机号查询用户
     * @param keyword
     * @return
     */
    User getUser(@Param("keyword") String keyword);
    
    /**
     * 根据手机号查询用户
     * @param phone
     * @return
     */
    User getUserByPhone(@Param("phone") String phone);

}