package cn.itcast.shop.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.itcast.shop.exception.MyException;
import cn.itcast.shop.mapper.ProductMapper;
import cn.itcast.shop.mapper.ScanMapper;
import cn.itcast.shop.pojo.Product;
import cn.itcast.shop.pojo.Scan;
import cn.itcast.shop.pojo.ScanDto;
import cn.itcast.shop.service.IScanService;

@Service
public class ScanService implements IScanService {
	@Autowired
	private ScanMapper scanMapper;
	@Autowired
	private ProductMapper productMapper; 

	@Override
	public List<ScanDto> getList(String uid) {
		List<ScanDto> result=new ArrayList<ScanDto>();
		List<Scan> list=scanMapper.getListByUid(uid);
		if(list==null){
			return result;
		}else{
			for(Scan scan:list){
				//浏览信息
				ScanDto dto=new ScanDto();
				BeanUtils.copyProperties(scan, dto);
				//农产品信息
				Product pro=productMapper.selectByPrimaryKey(scan.getProId());
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
			throw new MyException("参数有误");
		}
		Scan scan=scanMapper.selectByPrimaryKey(id);
		if(scan==null){
			throw new MyException("浏览记录不存在");
		}
		scan.setDeleted(true);
		scanMapper.updateByPrimaryKey(scan);
	}

}
