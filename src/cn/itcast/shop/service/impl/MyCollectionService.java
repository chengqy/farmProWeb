package cn.itcast.shop.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import cn.itcast.shop.exception.MyException;
import cn.itcast.shop.mapper.MyCollectionMapper;
import cn.itcast.shop.mapper.ProductMapper;
import cn.itcast.shop.pojo.MyCollection;
import cn.itcast.shop.pojo.MyCollectionDto;
import cn.itcast.shop.pojo.Product;
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
	public void collect(String[] proIds, String uid) throws Exception {
		for(String id:proIds){
			if(StringUtils.isEmpty(id)){
				throw new MyException("�����ڸ���Ʒ");
			}
			Product pro=productMapper.selectByPrimaryKey(id);
			if(pro==null||pro.getDeleted()){
				throw new MyException("�����ڸ���Ʒ");
			}
			MyCollection collect=myCollectionMapper.getCollect(id,uid);
			if(collect==null){
				collect=new MyCollection();
				collect.setId(UUIDUtils.uuid());
				collect.setProId(id);
				collect.setUid(uid);
				collect.setCreateTime(new Date());
				myCollectionMapper.insertSelective(collect);
			}else{
				collect.setCreateTime(new Date());
				collect.setDeleted(false);
				myCollectionMapper.updateByPrimaryKeySelective(collect);
			}
		}
	}

	@Override
	public List<MyCollectionDto> getList(String uid,Integer limit) {
		List<MyCollectionDto> result=new ArrayList<MyCollectionDto>();
		List<MyCollection> list=myCollectionMapper.getListByUid(uid,null);
		if(list==null){
			return result;
		}else{
			for(MyCollection collect:list){
				//�ղ���Ϣ
				MyCollectionDto dto=new MyCollectionDto();
				BeanUtils.copyProperties(collect, dto);
				//ũ��Ʒ��Ϣ
				Product pro=productMapper.selectByPrimaryKey(collect.getProId());
				if(pro!=null){
					BeanUtils.copyProperties(pro, dto);
				}
				result.add(dto);
			}
			return result;
		}
	}

	@Override
	public void delete(String id) throws Exception {
		if(id==null){
			throw new MyException("��������");
		}
		MyCollection col=myCollectionMapper.selectByPrimaryKey(id);
		if(col==null){
			throw new MyException("�ղؼ�¼������");
		}
		col.setDeleted(true);
		myCollectionMapper.updateByPrimaryKey(col);
	}
	
	
}
