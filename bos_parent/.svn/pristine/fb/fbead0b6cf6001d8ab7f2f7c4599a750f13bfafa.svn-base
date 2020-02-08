package edu.uestc.bos.web.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import edu.uestc.bos.domain.Noticebill;
import edu.uestc.bos.service.INoticebillService;
import edu.uestc.bos.web.action.base.BaseAction;
import edu.uestc.crm.Customer;
import edu.uestc.crm.ICustomerService;

/**
 * 业务通知单管理
 * @author HIPAA
 *
 */
@Controller
@Scope("prototype")
public class NoticebillAction extends BaseAction<Noticebill> {

	//注入crm客户端代理对象
	@Autowired
	private ICustomerService customerService ;
	@Autowired
	private INoticebillService noticebillService ;
	
	/**
	 * 远程调用crm服务，根据手机号查询客户信息
	 */
	public String findCustomerByTelephone(){
		String telephone = model.getTelephone();
		Customer customer = customerService.findCustomerByTelephone(telephone);
		this.javaToJson(customer, new String[]{});
		return NONE ;
	}
	
	/**
	 * 保存业务通知单，并尝试自动分单
	 */
	public String add(){
		noticebillService.save(model) ;
		return "noticebill_add" ;
	}
}
