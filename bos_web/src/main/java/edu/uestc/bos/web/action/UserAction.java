package edu.uestc.bos.web.action;

import java.io.IOException;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import edu.uestc.bos.domain.User;
import edu.uestc.bos.service.IUserService;
import edu.uestc.bos.utils.BOSUtils;
import edu.uestc.bos.utils.MD5Utils;
import edu.uestc.bos.web.action.base.BaseAction;

@Controller
@Scope("prototype")
@SuppressWarnings("all")
public class UserAction extends BaseAction<User> {

	//属性驱动，接受页面输入的验证码
	private String checkcode ;
	
	//属性驱动，接收角色id
	private String roleIds[] ;
	
	public void setRoleIds(String[] roleIds) {
		this.roleIds = roleIds;
	}
	public void setCheckcode(String checkcode) {
		this.checkcode = checkcode;
	}
	
	@Autowired
	private IUserService userService ;

	/**
	 * 用户登录,使用shiro框架提供的方式进行认证
	 * @return
	 */
	public String login(){

		//1.判断验证码是否正确
		//从session中获取生成的验证码
		String validateCode = (String) ServletActionContext.getRequest().getSession().getAttribute("key");
		if(StringUtils.isNotBlank(checkcode) && checkcode.equalsIgnoreCase(validateCode)){
			//输入的验证码是正确的
			//2.判断用户名或密码是否正确
			Subject subject = SecurityUtils.getSubject() ; //获得当前用户对象，状态为“未认证”
			AuthenticationToken token = new UsernamePasswordToken(model.getUsername(),MD5Utils.md5(model.getPassword())) ; //创建用户名密码令牌对象
			try{
				subject.login(token);
			}catch(UnknownAccountException e){
				e.printStackTrace();
				this.addActionError("用户不存在！");
				return LOGIN ;
			}catch(IncorrectCredentialsException e){
				e.printStackTrace();
				this.addActionError("密码错误！");
				return LOGIN ;
			}catch(Exception e){
				e.printStackTrace();
				return LOGIN ;
			}
			//登录成功后将用户放到session中
			User user = (User)subject.getPrincipal();
			ServletActionContext.getRequest().getSession().setAttribute("loginUser", user);
			return HOME ;
			
		}else{
			//输入的验证码是错误的，设置提示信息，跳转到登录页面
			this.addActionError("验证码错误！");
			return LOGIN ;
		}
		
	}
	/**
	 * 用户登录
	 * @return
	 */
	public String login_back(){

		//1.判断验证码是否正确
		//从session中获取生成的验证码
		String validateCode = (String) ServletActionContext.getRequest().getSession().getAttribute("key");
		if(StringUtils.isNotBlank(checkcode) && checkcode.equalsIgnoreCase(validateCode)){
			//输入的验证码是正确的
			//2.判断用户名或密码是否正确
			User user = userService.login(model) ;
			if(user != null){
				//登录成功,将User对象放到session中，并跳转到首页
				ServletActionContext.getRequest().getSession().setAttribute("loginUser", user);
				return HOME ;
			}else{
				//登录失败,设置提示信息，跳转到登录页面
				this.addActionError("用户名或密码错误！");
				return LOGIN ;
			}
		}else{
			//输入的验证码是错误的，设置提示信息，跳转到登录页面
			this.addActionError("验证码输入错误！");
			return LOGIN ;
		}
		
	}
	
	/**
	 * 用户注销
	 */
	public String logout(){
		ServletActionContext.getRequest().getSession().invalidate() ;
		return LOGIN ;
	}
	
	/**
	 * 修改密码
	 * @throws IOException 
	 */
	public String editPassword() throws IOException{
		
		String flag = "success" ;
		
		//修改当前用户的密码
		User user = BOSUtils.getLoginUser();
		
		try {
			userService.editPassword(user.getId(),model.getPassword()) ;
		} catch (Exception e) {
			flag = "fail" ;
			e.printStackTrace();
		}
		
		//将结果写到前端页面
		ServletActionContext.getResponse().setContentType("text/html;charset=utf-8") ;
		ServletActionContext.getResponse().getWriter().print(flag);
		
		return NONE ;
	}
	
	/**
	 * 保存用户
	 */
	public String add(){
		userService.save(model,roleIds) ;
		return LIST ;
	}
	
	/**
	 * 用户数据分页查询
	 */
	public String pageQuery(){
		userService.pageQuery(pageBean) ;
		this.javaToJson(pageBean, new String[]{"noticebills","roles"});
		return NONE ;
	}
}
