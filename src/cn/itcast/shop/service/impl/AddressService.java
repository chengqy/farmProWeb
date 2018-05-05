package cn.itcast.shop.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mysql.jdbc.StringUtils;

import cn.itcast.shop.exception.MyException;
import cn.itcast.shop.mapper.AddressMapper;
import cn.itcast.shop.pojo.Address;
import cn.itcast.shop.pojo.AddressExample;
import cn.itcast.shop.pojo.AddressParam;
import cn.itcast.shop.service.IAddressService;
import cn.itcast.shop.service.ICityService;
import cn.itcast.shop.service.IOrderItemService;
import cn.itcast.shop.service.IProvinceService;
import cn.itcast.shop.utils.MyStringUtils;
import cn.itcast.shop.utils.UUIDUtils;

@Service
public class AddressService implements IAddressService {

	@Autowired
	private AddressMapper addressMapper;
	@Autowired
	private IProvinceService provinceService;
	@Autowired
	private ICityService cityService;
	@Autowired
	private IOrderItemService orderItemService;

	@Override
	public boolean IsAddressStatusTrue(String uid) {
		AddressExample example = new AddressExample();
		example.createCriteria().andStatusEqualTo(true).andUidEqualTo(uid)
				.andDeletedEqualTo(false);
		List<Address> list = addressMapper.selectByExample(example);
		if (list != null && list.size() > 0) {
			return true;
		} else
			return false;
	}

	@Override
	public List<Address> getList(String uid) {
		List<Address> result=addressMapper.getList(uid);
		for(Address addr:result){
			addr.setPhone(MyStringUtils.encrypt(addr.getPhone()));
		}
		
		return result;
	}

	@Override
	public Address getAddressByID(String id) {
		Address address = addressMapper.selectByPrimaryKey(id);
		if (address == null || address.getDeleted().equals(true))
			return null;
		return address;
	}

	@Transactional
	@Override
	public void update(AddressParam addressParam, String uid) {
		Address address = new Address();
		BeanUtils.copyProperties(addressParam, address);
		// 获取省和市名
		address.setProvince(provinceService.getProvinceById(
				Integer.valueOf(addressParam.getProvince())).getPname());
		address.setCity(cityService.getCityById(
				Integer.valueOf(addressParam.getCity())).getCityName());
		// 是否设置为默认值，如果是将其他设为非默认值
		if (address.getStatus() != null && address.getStatus().intValue() == 1) {
			if (this.IsAddressStatusTrue(uid))
				addressMapper.changeAllStatus(uid);
		}
		address.setUid(uid);
		if (StringUtils.isNullOrEmpty(addressParam.getId())) {
			address.setId(UUIDUtils.uuid());
			address.setCreateTime(new Date());
			addressMapper.insertSelective(address);
		} else {
			addressMapper.updateByPrimaryKeySelective(address);
		}

	}

	@Transactional
	@Override
	public void deleteById(String id) throws Exception {
		Address address = this.getAddressByID(id);
		if (address == null) {
			throw new MyException("地址不存在");
		}
		address.setDeleted(true);
		addressMapper.updateByPrimaryKeySelective(address);
	}

	@Transactional
	@Override
	public void changeStatusTrue(Address address, String uid) {
		// 修改已存在默认地址为非默认
		if (this.IsAddressStatusTrue(uid)) {
			addressMapper.changeAllStatus(uid);
		}
		// 设置状态为默认
		address.setStatus(Integer.valueOf(1));
		addressMapper.updateByPrimaryKeySelective(address);
	}
}
