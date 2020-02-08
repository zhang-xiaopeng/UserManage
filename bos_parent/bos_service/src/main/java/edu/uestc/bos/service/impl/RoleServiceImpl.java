package edu.uestc.bos.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.uestc.bos.dao.IRoleDao;
import edu.uestc.bos.domain.Function;
import edu.uestc.bos.domain.Role;
import edu.uestc.bos.service.IRoleService;
import edu.uestc.bos.utils.PageBean;

@Service
@Transactional
public class RoleServiceImpl implements IRoleService {

	@Autowired
	private IRoleDao roleDao ;
	
	/**
	 * 保存一个角色，同时要关联权限
	 */
	@Override
	public void add(Role role, String functionIds) {
		roleDao.save(role);
		if(StringUtils.isNotBlank(functionIds)){
			String[] ids = functionIds.split(",");
			for (String functionId : ids) {
				//手动构造一个权限对象，设置id,对象状态为托管态
				Function function = new Function(functionId) ;
				//角色关联权限
				role.getFunctions().add(function) ;
			}
		}
	}

	@Override
	public void pageQuery(PageBean pageBean) {
		roleDao.pageQuery(pageBean);
	}

	@Override
	public List<Role> findAll() {
		return roleDao.findAll() ;
	}

}
