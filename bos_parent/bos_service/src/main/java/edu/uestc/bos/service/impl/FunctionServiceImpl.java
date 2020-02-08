package edu.uestc.bos.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.uestc.bos.dao.IFunctionDao;
import edu.uestc.bos.domain.Function;
import edu.uestc.bos.domain.User;
import edu.uestc.bos.service.IFunctionService;
import edu.uestc.bos.utils.BOSUtils;
import edu.uestc.bos.utils.PageBean;

@Service
@Transactional
public class FunctionServiceImpl implements IFunctionService {
	
	@Autowired
	private IFunctionDao functionDao ;

	@Override
	public List<Function> findAll() {
		return functionDao.findAll() ;
	}

	/**
	 * 添加权限
	 */
	@Override
	public void save(Function model) {
		Function parentFunction = model.getParentFunction();
		if(parentFunction != null && parentFunction.getId().equals("")){
			model.setParentFunction(null) ;
		}
		functionDao.save(model);
	}

	@Override
	public void pageQuery(PageBean pageBean) {
		functionDao.pageQuery(pageBean);
	}

	/**
	 * 根据当前登录人查询对应的菜单数据，返回json
	 */
	@Override
	public List<Function> findMenu() {
		List<Function> list = null ;
		User user = BOSUtils.getLoginUser();
		if(user.getUsername().equals("zhangsan")){
			//如果是zhangsan,查询所有菜单
			list = functionDao.findAllMenu() ;
		}else{
			//其它用户需要根据用户id查询菜单
			list = functionDao.findMenuByUserId(user.getId()) ;
		}
		return list ;
	}



}
