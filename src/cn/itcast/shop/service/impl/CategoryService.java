package cn.itcast.shop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.itcast.shop.mapper.CategoryMapper;
import cn.itcast.shop.pojo.Category;
import cn.itcast.shop.service.ICategoryService;

@Service
public class CategoryService implements ICategoryService {
	@Autowired
	private CategoryMapper categoryMapper;

	@Override
	public List<Category> getList() {
		
		return categoryMapper.getList();
	}

}
