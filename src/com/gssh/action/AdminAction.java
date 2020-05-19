package com.gssh.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.gssh.dao.AdminDaoImpl;
import com.gssh.entity.Admin;
import com.gssh.util.Pager;
import com.gssh.util.StringUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;

@Controller("adminAction")
@Scope("prototype")
public class AdminAction extends BaseAction implements ModelDriven<Admin> {

	private Admin admin = null;
	@Autowired
	private AdminDaoImpl adminDao;

	public AdminDaoImpl getAdminDao() {
		return adminDao;
	}

	public void setAdminDao(AdminDaoImpl adminDao) {
		this.adminDao = adminDao;
	}

	/**
	 * 返回list 列表
	 */
	public String list() {
		StringBuilder bf = new StringBuilder();
		bf.append("from Admin where 1= 1 ");
		if (null != admin && StringUtils.isNotEmpty(admin.getUsername())) {
			bf.append(" and username like '%" + admin.getUsername() + "%'");
		}
		Pager<Admin> pagers = adminDao.find(bf.toString());
		ActionContext.getContext().put("pagers", pagers);
		ActionContext.getContext().put("bean", admin);
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
		Admin bean = adminDao.findById(admin.getId());
		ActionContext.getContext().put("Admin", bean);
		return SUCCESS;
	}

	/**
	 * 添加信息保存
	 */
	public String save() {
		adminDao.save(admin);
		ActionContext.getContext().put("url", "/admin_list.action");
		return "redirect";
	}

	/**
	 * 保存修改信息
	 */
	public String update() {
		adminDao.updates(admin);
		ActionContext.getContext().put("url", "/admin_list.action");
		return "redirect";
	}
	
	
	/**
	 * 个人信息修改信息
	 */
	public String myedit() {
		adminDao.updates(admin);
		getSession().setAttribute("admin", admin);
		return SUCCESS;
	}

	/**
	 * 删除信息
	 */
	public String del() {
		//admin.setDel(1);
		//adminDao.updates(admin);
		adminDao.delete(admin.getId());
		ActionContext.getContext().put("url", "/admin_list.action");
		return "redirect";
	}

	@Override
	public Admin getModel() {
		if (null == admin) {
			admin = new Admin();
		}
		return admin;
	}

}

