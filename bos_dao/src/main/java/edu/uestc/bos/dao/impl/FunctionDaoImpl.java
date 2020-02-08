package edu.uestc.bos.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import edu.uestc.bos.dao.IFunctionDao;
import edu.uestc.bos.dao.base.impl.BaseDaoImpl;
import edu.uestc.bos.domain.Function;

@Repository
public class FunctionDaoImpl extends BaseDaoImpl<Function> implements IFunctionDao{
	public List<Function> findAll() {
		String hql = "FROM Function";
		List<Function> list = (List<Function>) this.getHibernateTemplate().find(hql);
		return list;
	}
	
	/**
	 * 根据用户id查询对应的权限
	 */
	@Override
	public List<Function> findFunctionListByUserId(String id) {
		String hql = "SELECT DISTINCT f FROM Function f LEFT OUTER JOIN f.roles r LEFT OUTER JOIN r.users u WHERE u.id = ? " ;
		List<Function> list = (List<Function>) this.getHibernateTemplate().find(hql, id);
		return list ;
	}

	/**
	 * 查询所有菜单
	 */
	@Override
	public List<Function> findAllMenu() {
		String hql = "FROM Function f WHERE f.generatemenu = '1' ORDER BY f.zindex " ;
		List<Function> list = (List<Function>) this.getHibernateTemplate().find(hql);
		return list ;
	}

	/**
	 * 根据用户id查询菜单
	 */
	@Override
	public List<Function> findMenuByUserId(String userId) {
		String hql = "SELECT DISTINCT f FROM Function f LEFT OUTER JOIN f.roles r LEFT OUTER JOIN r.users u "
				+ "WHERE u.id = ? AND f.generatemenu = '1' ORDER BY f.zindex " ;
		List<Function> list = (List<Function>) this.getHibernateTemplate().find(hql,userId);
		return list ;
	}
	
}
