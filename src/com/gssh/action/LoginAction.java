package com.gssh.action;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.gssh.dao.AdminDaoImpl;
import com.gssh.dao.UserDaoImpl;
import com.gssh.entity.Admin;
import com.gssh.entity.User;
import com.gssh.util.Pager;
import com.gssh.util.StringUtils;

@Controller("loginAction")
@Scope("prototype")
public class LoginAction extends BaseAction {
	private Integer userType;
	private String userName;
	private String userPw;

	public Integer getUserType() {
		return userType;
	}

	public void setUserType(Integer userType) {
		this.userType = userType;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	@Autowired
	private AdminDaoImpl adminDao;

	public AdminDaoImpl getAdminDao() {
		return adminDao;
	}

	public void setAdminDao(AdminDaoImpl adminDao) {
		this.adminDao = adminDao;
	}
	@Autowired
	private UserDaoImpl userDao;

	public UserDaoImpl getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDaoImpl userDao) {
		this.userDao = userDao;
	}
	/**
	 * 登陆接口
	 * @param request
	 * @param response
	 * @return
	 */
	public String login() {
			System.out.println("userType" + userType);
			try {
				Thread.sleep(700);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			if(StringUtils.isEmpty(userName) || StringUtils.isEmpty(userPw) || (null == userType )){
				ServletActionContext.getRequest().getSession()
				.setAttribute("msg", "用户名或者密码错误!");
				return "login";
			}
			if (userType == 0)//
			{
				String sql = "from Admin where 1=1 and username=? and userpwd=?";
				Object[] con = { userName, userPw };
				Pager<Admin> pagers = adminDao.find(sql, con);
				if (pagers.getTotal() == 0) {
					ServletActionContext.getRequest().getSession().setAttribute("msg", "用户名或者密码错误!");
					return "login";
				} else {
					Admin admin = (Admin) pagers.getDatas().get(0);
					getSession().setAttribute("userType", 0);
					getSession().setAttribute("admin", admin);
					getSession().setAttribute("name", admin.getUsername());
					getSession().setAttribute("identity", admin.getIdentity());
					System.out.println(admin.getIdentity());
					
					return "index";
				}
			}
			if (userType == 1)
			{
				String sql = "from User where 1=1 and username=? and password=?";
				Object[] con = { userName, userPw };
				Pager<User> pagers = userDao.find(sql, con);
				if (pagers.getTotal() == 0) {
					ServletActionContext.getRequest().getSession()
					.setAttribute("msg", "用户名或者密码错误!");
					return "login";
				} else {
					User user = (User) pagers.getDatas().get(0);
					getSession().setAttribute("userType", 1);
					getSession().setAttribute("user", user);
					getSession().setAttribute("name", user.getUsername());
					getSession().setAttribute("identity", "用户");
					return "index";
				}
			}
			return "index";
	}
	
	public String tuichu() {
		ServletActionContext.getRequest().getSession().removeAttribute("admin");
		ServletActionContext.getRequest().getSession().removeAttribute("userType");
		return "login";
	}
}
