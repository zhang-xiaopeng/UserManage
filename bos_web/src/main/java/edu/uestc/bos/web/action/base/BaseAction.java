package edu.uestc.bos.web.action.base;

import java.io.IOException;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import edu.uestc.bos.utils.PageBean;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

@SuppressWarnings("all")
public class BaseAction<T> extends ActionSupport implements ModelDriven<T> {
	
	public static final String HOME = "home" ;
	public static final String LIST = "list" ;

	protected T model ;
	protected PageBean pageBean = new PageBean() ;
	
	//创建离线条件查询对象
	DetachedCriteria detachedCriteria = null ;
	
	public void setPage(int page) {
		pageBean.setCurrentPage(page);
	}

	public void setRows(int rows) {
		pageBean.setPageSize(rows) ;
	}
	
	/**
	 * 将制定java对象转为json，并响应到客户端
	 * @param o
	 */
	public void javaToJson(Object o, String[] excludes){
		JsonConfig jsonConfig = new JsonConfig() ;
		jsonConfig.setExcludes(excludes);
		String json = JSONObject.fromObject(o,jsonConfig).toString();
		ServletActionContext.getResponse().setContentType("text/json;charset=utf-8") ;
		try {
			ServletActionContext.getResponse().getWriter().print(json);
		} catch (IOException e) {
			e.printStackTrace();
		} ;
	}
	/**
	 * 将制定java集合转为json，并响应到客户端
	 * @param o
	 */
	public void javaToJson(List o, String[] excludes){
		JsonConfig jsonConfig = new JsonConfig() ;
		jsonConfig.setExcludes(excludes);
		String json = JSONArray.fromObject(o,jsonConfig).toString();
		ServletActionContext.getResponse().setContentType("text/json;charset=utf-8") ;
		try {
			ServletActionContext.getResponse().getWriter().print(json);
		} catch (IOException e) {
			e.printStackTrace();
		} ;
	}
	
	//在构造方法中动态获取实体类型，通过反射创建model对象
	public BaseAction(){
		ParameterizedType superclass = (ParameterizedType) this.getClass().getGenericSuperclass();
		Type[] actualTypeArguments = superclass.getActualTypeArguments();
		Class<T> entityClass = (Class<T>) actualTypeArguments[0];
		
		detachedCriteria = DetachedCriteria.forClass(entityClass) ;
		pageBean.setDetachedCriteria(detachedCriteria) ;
		//通过反射创造对象
		try {
			model = entityClass.newInstance() ;
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public T getModel() {
		return model ;
	}
	


}

