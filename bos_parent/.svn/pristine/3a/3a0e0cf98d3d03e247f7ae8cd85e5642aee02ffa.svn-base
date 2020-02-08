package edu.uestc.bos.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.uestc.bos.dao.IDecidedzoneDao;
import edu.uestc.bos.dao.ISubareaDao;
import edu.uestc.bos.domain.Decidedzone;
import edu.uestc.bos.domain.Subarea;
import edu.uestc.bos.service.IDecidedzoneService;
import edu.uestc.bos.utils.PageBean;

@Service
@Transactional
public class DecidedzoneService implements IDecidedzoneService {

	@Autowired
	private IDecidedzoneDao decidedzoneDao ;
	@Autowired
	private ISubareaDao subareaDao ;
	
	/**
	 * 添加定区，同时需要关联分区
	 */
	@Override
	public void save(Decidedzone model, String[] subareaid) {
		decidedzoneDao.save(model) ;
		for (String id : subareaid) {
			Subarea subarea = subareaDao.findById(id);
			//model.getSubareas().add(subarea) ;  一方（定区）已经放弃了维护外键的权利，只能由多方（分区）维护外键
			subarea.setDecidedzone(model) ; //分区关联定区
		}
	}

	@Override
	public void pageQuery(PageBean pageBean) {
		decidedzoneDao.pageQuery(pageBean);
	}

}
