package edu.uestc.bos.utils;

import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import edu.uestc.bos.domain.User;

/**
 * BOS项目工具类
 * @author HIPAA
 *
 */
public class BOSUtils {

	//获取session对象
	public static HttpSession getSession(){
		return ServletActionContext.getRequest().getSession() ;
	}
	
	//获取用户登录对象
	public static User getLoginUser(){
		return (User)getSession().getAttribute("loginUser") ;
	}
}
