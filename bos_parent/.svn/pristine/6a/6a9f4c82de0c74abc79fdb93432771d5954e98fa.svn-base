package edu.uestc.bos.web.action;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import edu.uestc.bos.domain.Decidedzone;
import edu.uestc.bos.service.IDecidedzoneService;
import edu.uestc.bos.web.action.base.BaseAction;
import edu.uestc.crm.Customer;
import edu.uestc.crm.ICustomerService;

/**
 * 定区管理
 * @author HIPAA
 *
 */
@Controller
@Scope("prototype")
public class DecidedzoneAction extends BaseAction<Decidedzone> {
	
	@Autowired
	private IDecidedzoneService decidedzoneService ;
	//属性驱动，接收多个分区id
	private String[] subareaid ;

	public void setSubareaid(String[] subareaid) {
		this.subareaid = subareaid;
	}
	
	
	/**
	 * 添加定区
	 */
	public String add(){
		decidedzoneService.save(model,subareaid) ;
		return LIST ;
	}
	
	/**
	 * 分页查询方法
	 */
	public String pageQuery() throws IOException{

		decidedzoneService.pageQuery(pageBean) ;
		
		this.javaToJson(pageBean, new String[]{"currentPage","pageSize","detachedCriteria","subareas","decidedzones"});
		
		return NONE ;
	}
	
	//注入crm的代理对象
	@Autowired
	private ICustomerService proxy ;
	/**
	 * 远程调用crm，查询未关联的客户
	 * @return
	 */
	public String findListNotAssociation(){
		List<Customer> list = proxy.findListNotAssociation();
		this.javaToJson(list, new String[]{});
		return NONE ;
	}
	
	/**
	 * 远程调用crm，查询已关联的客户
	 * @return
	 */
	public String findListHasAssociation(){
		String id = model.getId() ;
		List<Customer> list = proxy.findListHasAssociation(id);
		this.javaToJson(list, new String[]{});
		return NONE ;
	}
	
	//属性驱动，接收页面提交的多个客户id
	private List<Integer> customerIds ;
	public List<Integer> getCustomerIds() {
		return customerIds;
	}
	public void setCustomerIds(List<Integer> customerIds) {
		this.customerIds = customerIds;
	}
	/**
	 * 远程调用crm,将客户关联到定区
	 */
	public String assigncustomerstodecidedzone(){
		proxy.assigncustomerstodecidedzone(model.getId(), customerIds);
		return LIST ;
	}

}
