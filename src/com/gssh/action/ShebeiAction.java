package com.gssh.action;

import java.io.File;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.gssh.dao.ShebeiDaoImpl;
import com.gssh.entity.Shebei;
import com.gssh.util.Pager;
import com.gssh.util.StringUtils;
import com.gssh.util.code.QRCodeEncoder;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;

@Controller("shebeiAction")
@Scope("prototype")
public class ShebeiAction extends BaseAction implements ModelDriven<Shebei> {

	private Shebei shebei = null;
	@Autowired
	private ShebeiDaoImpl shebeiDao;

	public ShebeiDaoImpl getShebeiDao() {
		return shebeiDao;
	}

	public void setShebeiDao(ShebeiDaoImpl shebeiDao) {
		this.shebeiDao = shebeiDao;
	}

	/**
	 * 返回list 列表
	 */
	public String list() {
		StringBuilder bf = new StringBuilder();
		bf.append("from Shebei where 1= 1 ");
		if (null != shebei && StringUtils.isNotEmpty(shebei.getName())) {
			bf.append(" and name like '%" + shebei.getName() + "%'");
		}
		if (null != shebei && StringUtils.isNotEmpty(shebei.getStatus())) {
			bf.append(" and status = '" + shebei.getStatus() + "'");
		}
		if (null != shebei && StringUtils.isNotEmpty(shebei.getJiaoshiname())) {
			bf.append(" and jiaoshiname like '%" + shebei.getJiaoshiname() + "%'");
		}
		if (null != shebei && StringUtils.isNotEmpty(shebei.getAddshijian())) {
			bf.append(" and addshijian like '%" + shebei.getAddshijian() + "%'");
		}
		Pager<Shebei> pagers = shebeiDao.find(bf.toString());
		ActionContext.getContext().put("pagers", pagers);
		ActionContext.getContext().put("bean", shebei);
		return SUCCESS;
	}

	/**
	 * 跳转添加页面
	 */
	public String add() {
		return SUCCESS;
	}

	
	/**
	 * 生成二维码
	 * @return
	 */
	public String gencode() {
		Shebei bean = shebeiDao.findById(shebei.getId());
		String imgpath = "/" +new Date().getTime() + ".jpg";
		String saveurl = getRequest().getRealPath("/upload/erweima");
		File file =new File(saveurl + "/" + imgpath);   
		String url = bean.getShebeino();
		String path = saveurl+"/"+imgpath ;
		System.out.println("path : " + path);
		QRCodeEncoder.getQRCode(url, path);//生成二维码
      	bean.setErweima("/upload/erweima/" + imgpath );
		shebeiDao.updates(bean);
		ActionContext.getContext().put("url", "/shebei_list.action");
		return "redirect";
	}
	
	/**
	 * 查询修改
	 * 
	 * @return
	 */
	public String edit() {
		Shebei bean = shebeiDao.findById(shebei.getId());
		ActionContext.getContext().put("Shebei", bean);
		return SUCCESS;
	}
	
	
	/**
	 * 查询修改
	 * 
	 * @return
	 */
	public String show() {
		Shebei bean = shebeiDao.findById(shebei.getId());
		ActionContext.getContext().put("Shebei", bean);
		return SUCCESS;
	}

	
	/**
	 * 保存修改信息
	 */
	public String showupdate() {
		shebeiDao.updates(shebei);
		ActionContext.getContext().put("msg", "设备修改成功");
		return "succ";
	}
	
	/**
	 * 添加信息保存
	 */
	public String save() {
		shebeiDao.save(shebei);
		ActionContext.getContext().put("url", "/shebei_list.action");
		return "redirect";
	}

	/**
	 * 保存修改信息
	 */
	public String update() {
		shebeiDao.updates(shebei);
		ActionContext.getContext().put("url", "/shebei_list.action");
		return "redirect";
	}

	/**
	 * 删除信息
	 */
	public String del() {
		//shebei.setDel(1);
		//shebeiDao.updates(shebei);
		shebeiDao.delete(shebei.getId());
		ActionContext.getContext().put("url", "/shebei_list.action");
		return "redirect";
	}

	@Override
	public Shebei getModel() {
		if (null == shebei) {
			shebei = new Shebei();
		}
		return shebei;
	}

}

