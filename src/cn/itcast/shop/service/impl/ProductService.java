package cn.itcast.shop.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import cn.itcast.shop.ENUM.CategoryEnum;
import cn.itcast.shop.exception.MyException;
import cn.itcast.shop.mapper.CategoryMapper;
import cn.itcast.shop.mapper.CityMapper;
import cn.itcast.shop.mapper.MyCollectionMapper;
import cn.itcast.shop.mapper.OrderItemMapper;
import cn.itcast.shop.mapper.ProductMapper;
import cn.itcast.shop.mapper.ScanMapper;
import cn.itcast.shop.pojo.MyCollection;
import cn.itcast.shop.pojo.ProInitDto;
import cn.itcast.shop.pojo.ProPagingParam;
import cn.itcast.shop.pojo.Product;
import cn.itcast.shop.pojo.ProductDto;
import cn.itcast.shop.pojo.ProductParam;
import cn.itcast.shop.pojo.Scan;
import cn.itcast.shop.service.IProductService;
import cn.itcast.shop.utils.DateUtils;
import cn.itcast.shop.utils.MyStringUtils;
import cn.itcast.shop.utils.UUIDUtils;

@Service
public class ProductService implements IProductService {
	@Autowired
	private ProductMapper productMapper;
	@Autowired
	private CategoryMapper categoryMapper;
	@Autowired
	private CityMapper cityMapper;
	@Autowired
	private MyCollectionMapper myCollectionMapper;
	@Autowired
	private ScanMapper scanMapper;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private OrderItemMapper orderItemMapper;

	@Transactional
	@Override
	public Product add(ProductParam productParam, MultipartFile[] pic,
			MultipartFile head) throws Exception {
		// 封面图片
		if (head != null && head.getOriginalFilename() != null
				&& head.getOriginalFilename().length() > 0) {
			// 封面图片的原始名称
			String originalFilename = head.getOriginalFilename();
			// 上传图片
			if (originalFilename != null && originalFilename.length() > 0) {// 存储图片的物理路径

				String head_path = "C:\\Program Files (x86)\\Apache Software Foundation\\Tomcat 7.0\\webapps\\farmProShop\\images\\pro\\";

				// 新的图片名称 UUID.randomUUID()随机数
				String newFilename = UUIDUtils.uuid()
						+ originalFilename.substring(originalFilename
								.lastIndexOf(".")); // 新的图片
				File newfile = new File(head_path + newFilename); // 将内存的数据写入磁盘
				System.out.println(System.getProperty("user.dir"));
				head.transferTo(newfile); // 上传成功需要经新的图片名称写到bean
				productParam.setProImage("images/pro/" + newFilename);
			}
		}
		// 细节图
		List<String> picList = new ArrayList<String>();
		if (pic != null && pic.length > 0) {
			for (MultipartFile picture : pic) {
				if (picture != null) {
					// 上传图片的原始名称
					String originFilename = picture.getOriginalFilename();
					// 上传图片
					if (originFilename != null && originFilename.length() > 0) {// 存储图片的物理路径

						String head_path = "C:\\Program Files (x86)\\Apache Software Foundation\\Tomcat 7.0\\webapps\\farmProShop\\images\\pro\\";

						// 新的图片名称 UUID.randomUUID()随机数
						String newFilename = UUIDUtils.uuid()
								+ originFilename.substring(originFilename
										.lastIndexOf(".")); // 新的图片
						File newfile = new File(head_path + newFilename); // 将内存的数据写入磁盘
						System.out.println(System.getProperty("user.dir"));
						picture.transferTo(newfile); // 上传成功需要经新的图片名称写到bean
						picList.add("images/pro/" + newFilename);
					}
				}
			}
		}
		Product product=null;
		if(StringUtils.isEmpty(productParam.getProId())){
			product= new Product();
			BeanUtils.copyProperties(productParam, product);
			if (picList.size() > 0)
				product.setPictures(MyStringUtils.toString(picList));
			product.setProId(UUIDUtils.uuid());
			product.setCreateTime(new Date());
			productMapper.insertSelective(product);
		}else{
			product = productMapper.selectByPrimaryKey(productParam.getProId());
			BeanUtils.copyProperties(productParam, product);
			if (picList.size() > 0)
				product.setPictures(MyStringUtils.toString(picList));
			productMapper.updateByPrimaryKeySelective(product);
		}
		
		return product;
	}

	@Override
	public List<ProductDto> getListBySellerId(String sellerId) {
		List<Product> list = productMapper.getListBySellerId(sellerId);
		List<ProductDto> result = new ArrayList<ProductDto>();
		if (list == null) {
			return result;
		}
		for (Product pro : list) {
			ProductDto dto = new ProductDto();
			BeanUtils.copyProperties(pro, dto);
			dto.setUpdateTime(DateUtils.parseDate(dto.getCreateTime(),
					"yyyy-MM-dd HH:mm:ss"));
			dto.setCateName(categoryMapper.selectByPrimaryKey(pro.getCateId())
					.getCateName());
			result.add(dto);
		}
		return result;
	}

	@Override
	public ProductDto getProById(String id, String uid) throws Exception {
		Product pro = productMapper.selectByPrimaryKey(id);
		if (pro == null || pro.getDeleted() || pro.getStatus() == 0) {
			throw new MyException("商品不存在或已下架");
		}
		ProductDto result = new ProductDto();
		BeanUtils.copyProperties(pro, result);
		// 转换细节图为list
		result.setPictureList(MyStringUtils.toList(pro.getPictures()));
		//类别名
		result.setCateName(categoryMapper.selectByPrimaryKey(
				Integer.valueOf(pro.getCateId())).getCateName());
		//产地
		result.setCityName(cityMapper.selectByPrimaryKey(
				Integer.valueOf(pro.getCityId())).getCityName());

		if (uid != null) {
			// 查询收藏记录
			MyCollection col = myCollectionMapper.getCollect(id, uid);
			if (col != null && col.getDeleted().equals(false)) {
				result.setIsCollect(1);
			} else {
				result.setIsCollect(0);
			}
			Boolean flag = true;
			// 足迹
			Scan scan = scanMapper.getScan(uid);
			if (scan == null) {
				flag = false;
			} else {
				// 和上一条浏览记录不同
				if (!scan.getProId().equals(id)) {
					flag = false;
				}
			}
			if (flag) {
				scan.setCreateTime(new Date());
				scanMapper.updateByPrimaryKey(scan);
			} else {
				Scan record = new Scan();
				record.setId(UUIDUtils.uuid());
				record.setUid(uid);
				record.setProId(id);
				record.setCreateTime(new Date());
				scanMapper.insertSelective(record);
			}
		}
		return result;
	}

	@Override
	public ProInitDto mainInit() {
		ProInitDto result = new ProInitDto();
		ProductDto special = new ProductDto(); // 特产
		ProductDto fruit = new ProductDto();// 水果
		ProductDto sea = new ProductDto();// 水产
		ProductDto vegetable = new ProductDto();// 蔬菜

		BeanUtils.copyProperties(
				productMapper.getNewProductByCateId(CategoryEnum.特产专区.code()),
				special);
		result.setSpecial(special);
		BeanUtils.copyProperties(
				productMapper.getNewProductByCateId(CategoryEnum.生鲜水果.code()),
				fruit);
		result.setFruit(fruit);
		BeanUtils.copyProperties(
				productMapper.getNewProductByCateId(CategoryEnum.海味河鲜.code()),
				sea);
		result.setSea(sea);
		BeanUtils.copyProperties(
				productMapper.getNewProductByCateId(CategoryEnum.新鲜蔬菜.code()),
				vegetable);
		result.setVegetable(vegetable);
		// 特产表
		result.setSpecialList(productMapper.getListByCateId(
				CategoryEnum.特产专区.code(), 12));
		// 水果列表
		result.setFruitList(productMapper.getListByCateId(
				CategoryEnum.生鲜水果.code(), 12));
		// 海味列表
		result.setSeaList(productMapper.getListByCateId(
				CategoryEnum.海味河鲜.code(), 12));
		return result;
	}

	@Override
	public ProInitDto getPagingList(ProPagingParam param) {
		ProInitDto result = new ProInitDto();
		// 获取分类列表
		result.setCategoryList(categoryService.getList());
		// 获取广东省地区列表
		result.setCityList(cityMapper.getListByPid(1));
		result.setProPageParam(param);
		// 查询总数
		int count = productMapper.getCount(param);
		if (count <= 0) {
			result.getProPageParam().setTotalPage(1);
			result.getProPageParam().setCurrent(1);
			return result;

		}
		result.getProPageParam().setTotalCount(count);
		// 页数
		int page = count / param.getPageSize().intValue() + 1;
		if (count % (param.getPageSize().intValue()) == 0) {
			page = count / param.getPageSize().intValue();
		}
		result.getProPageParam().setTotalPage(page);
		// 要查询页面超过最大页，查询最大页
		if (param.getQueryPage() > page)
			param.setQueryPage(page);
		// 设置分页查询开始位置
		param.setOffset((param.getQueryPage().intValue() - 1)
				* param.getPageSize().intValue());
		List<Product> list = productMapper.getPagingList(param);
		List<ProductDto> dtoList = new ArrayList<ProductDto>();
		for (Product pro : list) {
			ProductDto dto = new ProductDto();
			BeanUtils.copyProperties(pro, dto);
			dto.setUpdateTime(DateUtils.parseDate(dto.getCreateTime(),
					"yyyy-MM-dd HH:mm:ss"));
			dto.setCateName(categoryMapper.selectByPrimaryKey(pro.getCateId())
					.getCateName());
			dtoList.add(dto);
		}
		result.setProductList(dtoList);
		result.getProPageParam().setCurrent(param.getQueryPage());
		return result;
	}

	@Override
	public void deleted(String[] proIds, String sellerId) {
		productMapper.deleted(proIds, sellerId);
	}

	@Override
	public void changeStatus(String[] proIds, String sellerId, int status) {
		productMapper.changeStatus(proIds, sellerId, status);
	}

	@Override
	public ProInitDto getProDetailInfo(String id, String uid) throws Exception {
		ProInitDto result=new ProInitDto();
		//农产品信息
		ProductDto dto=this.getProById(id, uid);
		//月销量
		Integer sales=orderItemMapper.getSalesByProId(id,DateUtils.getCurrentMonthStartTime(),DateUtils.getCurrentMonthEndTime());
		if(sales==null){
			sales=0;
		}
		dto.setSales(sales.intValue());
		result.setProduct(dto);
		result.setSpecialList(productMapper.getListByCateId(dto.getCateId(), 5));
		
		return result;
	}

}
