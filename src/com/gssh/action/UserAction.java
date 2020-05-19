package com.gssh.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.gssh.dao.UserDaoImpl;
import com.gssh.entity.User;
import com.gssh.util.Pager;
import com.gssh.util.StringUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;

@Controller("userAction")
@Scope("prototype")
public class UserAction extends BaseAction implements ModelDriven<User> {

	private User user = null;
	@Autowired
	private UserDaoImpl userDao;

	public UserDaoImpl getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDaoImpl userDao) {
		this.userDao = userDao;
	}

	/**
	 * 返回list 列表
	 */
	public String list() {
		StringBuilder bf = new StringBuilder();
		bf.append("from User where 1= 1 ");
		if (null != user && StringUtils.isNotEmpty(user.getUsername())) {
			bf.append(" and username = '" + user.getUsername() + "'");
		}
		Pager<User> pagers = userDao.find(bf.toString());
		ActionContext.getContext().put("pagers", pagers);
		ActionContext.getContext().put("bean", user);
		return SUCCESS;
	}
	
	/**
	 * 返回list 列表
	 */
	public String listpx() {
		StringBuilder bf = new StringBuilder();
		bf.append("from User where 1= 1 order by jifen desc");
		Pager<User> pagers = userDao.find(bf.toString());
		ActionContext.getContext().put("userlist", pagers.getDatas());
		ActionContext.getContext().put("bean", user);
		return SUCCESS;
	}

	/**
	 * 跳转添加页面
	 */
	public String add() {
		return SUCCESS;
	}

	/**
	 * 查询修改
	 * 
	 * @return
	 */
	public String edit() {
		User bean = userDao.findById(user.getId());
		ActionContext.getContext().put("User", bean);
		return SUCCESS;
	}

	/**
	 * 添加信息保存
	 */
	public String save() {
		userDao.save(user);
		ActionContext.getContext().put("url", "/user_list.action");
		return "redirect";
	}
	/**
	 * 保存修改信息
	 */
	public String update() {
		userDao.updates(user);
		ActionContext.getContext().put("url", "/user_list.action");
		return "redirect";
	}
	/*
	 * 用户退出
	 */
	public String tuichu() {
		getSession().removeAttribute("user");
		ActionContext.getContext().put("url", "/index_index.action");
		return "redirect";
	}

	/**
	 * 用户注册
	 */
	public String reg() {
		StringBuilder bf = new StringBuilder();
		bf.append("from User where 1= 1 ");
		if (null != user && StringUtils.isNotEmpty(user.getUsername())) {
			bf.append(" and username = '" + user.getUsername() + "'");
		}
		Pager<User> pagers = userDao.find(bf.toString());
		if(pagers.getDatas().size() > 0){
			ActionContext.getContext().put("msg", "用户名重复不能注册!");
			ActionContext.getContext().put("url", "/index_reg.action");
			return "qiantai";
		}
		userDao.save(user);
		ActionContext.getContext().put("url", "/index_login.action");
		return "qiantai";
	}
	/**
	 * 用户保存修改信息
	 */
	public String qupdate() {
		userDao.updates(user);
		ActionContext.getContext().put("url", "/user_list.action");
		return "qiantai";
	}
	/**
	 * 删除信息
	 */
	public String del() {
		//user.setDel(1);
		//userDao.updates(user);
		userDao.delete(user.getId());
		ActionContext.getContext().put("url", "/user_list.action");
		return "redirect";
	}

	@Override
	public User getModel() {
		if (null == user) {
			user = new User();
		}
		return user;
	}

}

