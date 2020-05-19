package com.gssh.action;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.gssh.dao.ShebeiDaoImpl;
import com.gssh.dao.UserDaoImpl;
import com.gssh.entity.Shebei;
import com.gssh.entity.User;
import com.gssh.util.DateUtils;
import com.gssh.util.Pager;
import com.gssh.util.StringUtils;

@Controller("apiAction")
@Scope("prototype")
public class ApiAction extends BaseAction {
	@Autowired
	private UserDaoImpl userDao;

	public UserDaoImpl getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDaoImpl userDao) {
		this.userDao = userDao;
	}
	
	@Autowired
	private ShebeiDaoImpl shebeiDao;

	public ShebeiDaoImpl getShebeiDao() {
		return shebeiDao;
	}

	public void setShebeiDao(ShebeiDaoImpl shebeiDao) {
		this.shebeiDao = shebeiDao;
	}
	/**
	 * 用户注册接口
	 * 接口：api_reg.do
	 *  参考：
	 *  		username// 用户名
			    password"// 密码
			    name// 真实姓名
			    telephone// 电话
			    emall // 邮箱
			    sex// 性别
	 * 返回值:  
	 * {
	 *   msgstatus:0:状态   0  为失败，1位成功
	 *   msg:消息
	 * }
	 */
	public String reg() {
		// 最简单跨域的处理方式
		getResponse().setHeader("Access-Control-Allow-Origin","*");
		
		StringBuilder bf = new StringBuilder();
		bf.append("from User where 1= 1 ");
		String usernameTemp = getRequest().getParameter("username") ;
		if (null != usernameTemp && StringUtils.isNotEmpty(usernameTemp)) {
			bf.append(" and username = '" + usernameTemp + "'");
		}
		Pager<User> pagers = userDao.find(bf.toString());
		if(pagers.getDatas().size() > 0){
			jsonMap.put("msgstatus", "0");//错误
			jsonMap.put("msg", "用户名重复");
			return "json";
		}else{
			User userObj = new User();//
			userObj.setAddtime(DateUtils.format(new Date()));// 添加时间
			userObj.setUsername(getRequest().getParameter("username"));// 用户名
			userObj.setPassword(getRequest().getParameter("password"));// 密码
			userObj.setName(getRequest().getParameter("name"));// 真实姓名
			userObj.setTelephone(getRequest().getParameter("telephone"));// 电话
			userObj.setEmall(getRequest().getParameter("emall")); // 邮箱
			userObj.setSex(getRequest().getParameter("sex"));
			userObj.setStatus(0);//用户状态	
			userObj.setJifen(0);//积分
			userDao.save(userObj);		
			jsonMap.put("msgstatus", "1");//正确
			return "json";
		}
	}

	/**
	 * 登陆接口
	 * 接口：api_login.do?username=&password=
	 * 返回值:  
	 * {
	 *   msgstatus:0:状态   0  为失败，1位成功
	 *   msg:消息
	 *   user:用户对象
	 * }
	 */
	public String login(){
		// 最简单跨域的处理方式
		getResponse().setHeader("Access-Control-Allow-Origin","*");
		
		String userName = getRequest().getParameter("username");// 用户名
		String userPw = getRequest().getParameter("password");// 密码
		String sql = "from User where 1=1 and username=? and password=?";
		Object[] con = { userName, userPw };
		Pager<User> pagers = userDao.find(sql, con);
		if (pagers.getTotal() == 0) {
			jsonMap.put("msgstatus", "0");//登陆失败
			jsonMap.put("msg", "用户名或者密码错误!");
			return "json";
		} else {
			User user = (User) pagers.getDatas().get(0);
			getSession().setAttribute("userType", 1);
			getSession().setAttribute("user", user);
			jsonMap.put("msgstatus", "1");//登陆成功
			jsonMap.put("data", user);
			return "json";
		}
	}
	
	
	/**
	 * 设备详情接口
	 * 接口：api_shebeidetail.do?id=
	 * 返回值:  
	 * {
	 *   msgstatus:0:状态   0  为失败，1位成功
	 *   msg:消息
	 * }
	 */
	public String shebeidetail(){
		// 最简单跨域的处理方式
		getResponse().setHeader("Access-Control-Allow-Origin","*");
		
		String id = getRequest().getParameter("id");// 用户名
		Shebei shebeiObj = shebeiDao.getById(Integer.parseInt(id));
		if (shebeiObj == null) {
			jsonMap.put("msgstatus", "0");//登陆失败
			jsonMap.put("msg", "参数错误!");
			return "json";
		} else {
			jsonMap.put("msgstatus", "1");//登陆成功
			jsonMap.put("data", shebeiObj);
			return "json";
		}
	}
	
	
	/**
	 * 登陆接口
	 * 接口：api_shebeiupadte.do?id=&password=
	 * 返回值:  
	 * {
	 *   msgstatus:0:状态   0  为失败，1位成功
	 *   msg:消息
	 *   user:用户对象
	 * }
	 */
	public String shebeiupadte(){
		// 最简单跨域的处理方式
		
		getResponse().setHeader("Access-Control-Allow-Origin","*");
		
		
		String id = getRequest().getParameter("id");// ID
		System.out.println("+++++++++++++++++++++++++++++++++++++++++");
		String shebeino = getRequest().getParameter("shebeino");//设备编号

		String name = getRequest().getParameter("name");// 设备名称

		String leixing = getRequest().getParameter("leixing");//设备类型

		String jiaoshiname = getRequest().getParameter("jiaoshiname");// 所属教室

		String status = getRequest().getParameter("status");//设备状态

		
		Shebei obj = shebeiDao.findById(Integer.parseInt(id));
		if (obj == null) {
			jsonMap.put("msgstatus", "0");//登陆失败
			jsonMap.put("msg", "参数错误!");
			return "json";
		} else {
			obj.setShebeino(shebeino);
			obj.setName(name);
			obj.setLeixing(leixing);
			obj.setJiaoshiname(jiaoshiname);
			obj.setStatus(status);
			shebeiDao.update(obj);
			
			jsonMap.put("msgstatus", "1");//登陆成功
			jsonMap.put("data", "修改成功");
			return "json";
		}
	}
}
