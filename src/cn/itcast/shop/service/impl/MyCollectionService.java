package cn.itcast.shop.service.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import cn.itcast.shop.exception.MyException;
import cn.itcast.shop.mapper.MyCollectionMapper;
import cn.itcast.shop.mapper.ProductMapper;
import cn.itcast.shop.pojo.MyCollection;
import cn.itcast.shop.pojo.Product;
import cn.itcast.shop.pojo.User;
import cn.itcast.shop.service.IMyCollectionService;
import cn.itcast.shop.utils.UUIDUtils;

@Service
public class MyCollectionService implements IMyCollectionService {

	@Autowired
	private MyCollectionMapper myCollectionMapper;
	@Autowired
	private ProductMapper productMapper;

	@Transactional
	@Override
	public void collect(String id, User user) throws Exception {
		if(StringUtils.isEmpty(id)){
			throw new MyException("不存在该商品");
		}
		Product pro=productMapper.selectByPrimaryKey(id);
		if(pro==null||pro.getDeleted()){
			throw new MyException("不存在该商品");
		}
		MyCollection collect=myCollectionMapper.getCollect(id,user.getUid());
		if(collect==null){
			collect=new MyCollection();
			collect.setId(UUIDUtils.uuid());
			collect.setProId(id);
			collect.setUid(user.getUid());
			collect.setCreateTime(new Date());
			myCollectionMapper.insertSelective(collect);
		}else{
			collect.setCreateTime(new Date());
			collect.setDeleted(false);
			myCollectionMapper.updateByPrimaryKeySelective(collect);
		}
				
	}
	
	
}
