package com.pro.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pro.dao.ResMapper;
import com.pro.entity.Res;
import com.pro.entity.ResExample;
import com.pro.service.ResService;

@Service("resService")
public class ResServiceImpl implements ResService {

	@Autowired
	ResMapper resMapper;

	@Override
	public void insert(Res res) {
		resMapper.insert(res);
	}

	@Override
	public void update(Res res) {
		resMapper.updateByPrimaryKey(res);
	}

	@Override
	public void delete(Long resId) {
		resMapper.deleteByPrimaryKey(resId);
	}

	@Override
	public List<Res> findResByGroupId(Long groupId) {
		ResExample example = new ResExample();
		example.createCriteria().andGroupIdEqualTo(groupId);
		example.setOrderByClause("res_create_time desc");
		return resMapper.selectByExample(example);
	}

	@Override
	public Res findDefaultByGroup(Long groupId) {
		List<Res> reses = findResByGroupId(groupId);
		if (reses != null && reses.size() > 0) {
			return reses.get(0);
		}
		return null;
	}

}
