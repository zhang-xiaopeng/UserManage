package edu.uestc.bos.web.action;

import java.io.IOException;
import java.util.List;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import edu.uestc.bos.domain.Staff;
import edu.uestc.bos.service.IStaffService;
import edu.uestc.bos.web.action.base.BaseAction;

@Controller
@Scope("prototype")
public class StaffAction extends BaseAction<Staff>{
	
	//属性驱动，接受页面提交的分页参数,ids参数
	private String ids ;
	
	@Autowired
	private IStaffService staffService ;
	
	/**
	 * 添加取派员
	 */
	public String add(){
		staffService.save(model) ;
		return LIST ;
	}
	
	/**
	 * 分页查询取派员
	 * @throws IOException 
	 */
	public String pageQuery() throws IOException{

		staffService.pageQuery(pageBean) ;
		
		//使用json-lib将pageBean对象转为json，通过输出流写回页面中
		//JSONObject --  将单一对象转为json
		//JSONArray  --  将数组或集合转为json
		this.javaToJson(pageBean, new String[]{"currentPage","pageSize","detachedCriteria","decidedzones"});
		
		return NONE ;
	}
	
	/**
	 * 批量删除
	 * @return
	 */
	@RequiresPermissions("staff-delete") //执行这个方法，需要当前用户拥有staff-delete权限
	public String deleteBatch(){
		staffService.deleteBatch(ids) ;
		return LIST ;
	}
	
	/**
	 * 修改取派员信息
	 * @return
	 */
	public String edit(){
		//显查询数据库，根据id查询原始数据
		Staff staff = staffService.findById(model.getId());
		//使用页面提交的数据进行覆盖
		staff.setName(model.getName());
		staff.setTelephone(model.getTelephone());
		staff.setHaspda(model.getHaspda());
		staff.setStandard(model.getStandard());
		staff.setStation(model.getStation());
		staffService.update(staff);

		return LIST ;
	}
	
	/**
	 * 查询所有未删除的取派员，并返回json数据
	 * @return
	 */
	public String listajax(){
		List<Staff> list = staffService.findListNotDelete() ;
		this.javaToJson(list, new String[]{"telephone","haspda","deltag","station","standart","decidedzones"});
		return NONE ;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}
}
