package edu.uestc.bos.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.uestc.bos.dao.IWorkordermanageDao;
import edu.uestc.bos.domain.Workordermanage;
import edu.uestc.bos.service.IWorkordermanageService;

@Service
@Transactional
public class WorkordermanageServiceImpl implements IWorkordermanageService {

	
	@Autowired
	private IWorkordermanageDao workordermanageDao ;
	@Override
	public void save(Workordermanage model) {
		workordermanageDao.save(model);
	}

}
