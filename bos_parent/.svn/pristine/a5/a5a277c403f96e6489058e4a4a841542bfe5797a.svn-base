package edu.uestc.bos.web.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import edu.uestc.bos.domain.Function;
import edu.uestc.bos.service.IFunctionService;
import edu.uestc.bos.web.action.base.BaseAction;

/**
 * 权限管理
 * @author HIPAA
 *
 */
@Controller
@Scope("prototype")
public class FunctionAction extends BaseAction<Function>{
	
	@Autowired
	private IFunctionService functionService ;
	
	/**
	 * 查询所有的权限，并返回json数据
	 */
	public String listajax(){
		List<Function> list = functionService.findAll() ;
		this.javaToJson(list, new String[]{"roles","children","parentFunction"});
		return NONE ;
	}
	
	/**
	 * 增加权限
	 */
	public String add(){
		functionService.save(model) ;
		
		return LIST ;
	}
	
	/**
	 * 权限分页查询
	 */
	public String pageQuery(){
		String page = model.getPage();
		pageBean.setCurrentPage(Integer.parseInt(page)) ;
		functionService.pageQuery(pageBean) ;
		this.javaToJson(pageBean, new String[]{"roles","children","parentFunction"});
		return NONE ;
	}
	
	/**
	 * 根据当前登录人查询对应的菜单数据，返回json数据
	 */
	public String findMenu(){
		List<Function> list = functionService.findMenu() ;
		this.javaToJson(list, new String[]{"roles","children","parentFunction"});
		return NONE ;
	}
}
