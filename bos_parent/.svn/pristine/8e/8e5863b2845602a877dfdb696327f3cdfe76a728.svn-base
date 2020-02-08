package edu.uestc.bos.web.action;

import java.io.IOException;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import edu.uestc.bos.domain.Workordermanage;
import edu.uestc.bos.service.IWorkordermanageService;
import edu.uestc.bos.web.action.base.BaseAction;

@Controller
@Scope("prototype")
public class WorkordermanageAction extends BaseAction<Workordermanage>{

	@Autowired
	private IWorkordermanageService workordermanageService ;
	
	String f = "1" ;
	
	public String add() throws IOException{
		try {
			workordermanageService.save(model) ;
		} catch (Exception e) {
			e.printStackTrace();
			f = "0" ;
		} 
		
		ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
		ServletActionContext.getResponse().getWriter().print(f);
		
		return NONE ;
	}
}
