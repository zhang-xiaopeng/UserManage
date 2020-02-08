package edu.uestc.bos.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.uestc.bos.dao.IRegionDao;
import edu.uestc.bos.domain.Region;
import edu.uestc.bos.service.IRegionService;
import edu.uestc.bos.utils.PageBean;

@Service
@Transactional
public class RegionServiceImpl implements IRegionService{

	@Autowired
	private IRegionDao regionDao ;
	
	/**
	 * 区域数据批量保存
	 */
	@Override
	public void saveBatch(List<Region> list) {
		for (Region region : list) {
			regionDao.saveOrUpdate(region) ;
		}
	}

	/**
	 * 区域分页查询
	 */
	@Override
	public void pageQuery(PageBean pageBean) {
		regionDao.pageQuery(pageBean);
	}

	/**
	 * 区域列表查询
	 */
	@Override
	public List<Region> findAll() {
		return regionDao.findAll() ;
	}
	
	/**
	 * 根据页面输入进行模糊查询
	 */
	@Override
	public List<Region> findListByQ(String q) {
		
		return regionDao.findListByQ(q);
	}

}
