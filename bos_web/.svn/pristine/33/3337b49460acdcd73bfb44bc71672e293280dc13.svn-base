package edu.uestc.bos.web.interceptor;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;
import edu.uestc.bos.domain.User;
import edu.uestc.bos.utils.BOSUtils;

/**
 * 自定义拦截器。如果用户未登录，则跳转到登录页面
 * @author HIPAA
 *
 */
@SuppressWarnings("serial")
public class LoginInterceptor extends MethodFilterInterceptor{

	//拦截方法
	@Override
	protected String doIntercept(ActionInvocation invocation) throws Exception {
		
		//从session中获取用户对象
		User user = BOSUtils.getLoginUser() ;
		if(user == null){
			//没有登录，跳转到登录页面
			return "login" ;
		}else{
			//登录了，则放行
			return invocation.invoke() ;
		}
	}

}

