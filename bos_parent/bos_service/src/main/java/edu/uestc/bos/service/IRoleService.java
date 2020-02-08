package edu.uestc.bos.service;

import java.util.List;

import edu.uestc.bos.domain.Role;
import edu.uestc.bos.utils.PageBean;

public interface IRoleService {

	public void add(Role model, String functionIds);

	public void pageQuery(PageBean pageBean);

	public List<Role> findAll();

}
