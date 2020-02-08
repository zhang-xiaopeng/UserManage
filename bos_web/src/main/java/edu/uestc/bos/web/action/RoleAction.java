package edu.uestc.bos.web.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import edu.uestc.bos.domain.Role;
import edu.uestc.bos.service.IRoleService;
import edu.uestc.bos.web.action.base.BaseAction;

/**
 * 角色管理
 * @author HIPAA
 *
 */
@Controller
@Scope("prototype")
public class RoleAction extends BaseAction<Role>{
	
	@Autowired
	private IRoleService roleService ;

	//属性驱动，接收权限id
	private String functionIds ;
	public String getFunctionIds() {
		return functionIds;
	}
	public void setFunctionIds(String functionIds) {
		this.functionIds = functionIds;
	}
	
	/**
	 * 添加角色
	 */
	public String add(){
		roleService.add(model,functionIds) ;
		return LIST ;
	}
	/**
	 * 分页查询
	 */
	public String pageQuery(){
		roleService.pageQuery(pageBean) ;
		this.javaToJson(pageBean, new String[]{"functions","users"});
		return NONE ; 
	}
	
	/**
	 * 查询所有的角色数据，并返回json
	 */
	public String listajax(){
		List<Role> list = roleService.findAll() ;
		this.javaToJson(list, new String[]{"functions","users"});
		return NONE ;
	}
}
