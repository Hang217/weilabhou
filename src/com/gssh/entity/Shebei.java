package com.gssh.entity;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
/**
 * 设备信息
 */
@Entity
@Table(name="t_shebei")
public class Shebei {


    private Integer id;  // ID
    private String shebeino;  // 设备编号
    private String name;  // 设备名称
    private String leixing;  // 设备类型
    private String fujian;  // 图片
    private String detail;  // 设备简介
    private String jiaoshiname;  // 所属教室
    private String status;  // 设备状态
    private String addshijian;  // 添加时间
	private Integer userid;//用户ID
	private String username;//用户名
	private Integer jiage;//价格

	private String erweima;//二维码
	public Shebei() {
	}
	
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	public String getShebeino() {
		return shebeino;
	}

	public void setShebeino(String shebeino) {
		this.shebeino = shebeino;
	}
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	public String getLeixing() {
		return leixing;
	}

	public void setLeixing(String leixing) {
		this.leixing = leixing;
	}
	public String getFujian() {
		return fujian;
	}

	public void setFujian(String fujian) {
		this.fujian = fujian;
	}
	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getJiaoshiname() {
		return jiaoshiname;
	}

	public void setJiaoshiname(String jiaoshiname) {
		this.jiaoshiname = jiaoshiname;
	}
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	public String getAddshijian() {
		return addshijian;
	}

	public void setAddshijian(String addshijian) {
		this.addshijian = addshijian;
	}

	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getErweima() {
		return erweima;
	}

	public void setErweima(String erweima) {
		this.erweima = erweima;
	}

	public Integer getJiage() {
		return jiage;
	}

	public void setJiage(Integer jiage) {
		this.jiage = jiage;
	}
	
		
}