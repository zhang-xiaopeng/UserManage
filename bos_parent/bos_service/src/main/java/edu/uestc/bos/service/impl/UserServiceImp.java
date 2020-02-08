package edu.uestc.bos.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.uestc.bos.dao.IUserDao;
import edu.uestc.bos.domain.Role;
import edu.uestc.bos.domain.User;
import edu.uestc.bos.service.IUserService;
import edu.uestc.bos.utils.MD5Utils;
import edu.uestc.bos.utils.PageBean;

@Service
@Transactional
public class UserServiceImp implements IUserService {

	@Autowired
	private IUserDao userDao ;
	
	/**
	 * 用户登录
	 */
	@Override
	public User login(User user) {
		//使用MD5加密密码
		String password = MD5Utils.md5(user.getPassword());
		return userDao.findUserByUsernameAndPassword(user.getUsername(),password) ;
	}

	/**
	 * 根据用户id修改用户密码
	 */
	@Override
	public void editPassword(String id, String password) {
		password = MD5Utils.md5(password);
		userDao.executeUpdate("user.editPassword", password,id);
	}

	/**
	 * 添加用户，并关联角色
	 */
	@Override
	public void save(User user, String[] roleIds) {
		String password = user.getPassword();
		password = MD5Utils.md5(password) ;
		user.setPassword(password) ;
		
		userDao.save(user);
		if(roleIds != null && roleIds.length > 0){
			for (String roleId : roleIds) {
				//手动构造一个托管对象
				Role role = new Role(roleId) ;
				//用户对象关联角色对象
				user.getRoles().add(role) ;
			}
		}
	}

	/**
	 * 分页查询
	 */
	@Override
	public void pageQuery(PageBean pageBean) {
		userDao.pageQuery(pageBean);
	}

}
