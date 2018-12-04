package com.zs.Po;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class TUser implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int id;
	private String loginname;
	private String realname;
	private String sex;
	private Date birthday;
	
	//private int dept;
	private TDept dept;//关联
	
	//关联权限列表
	private List<TPermission> permission;
	
	private String email;
	private int isenabled;
	private String password;
	private int creator;
	private Date createtime;
	private int updator;
	private Date updatetime;
	private String picurl;
	
	//左侧菜单，由permission整理出来
	private List<TPermission> menu=new ArrayList<>();
	//整理菜单
	public List<TPermission> getMenu() {
		//清空
		menu.clear();
		for(TPermission per1:permission){
			//一级菜单
			if(per1.getPid()==0){
				//清空
				per1.getChildren().clear();
				//装载一级菜单下的二级菜单
				for(TPermission per2:permission){
					//一级菜单的id==二级菜单的id，说明该权限是一级菜单的子权限
					if(per1.getId()==per2.getPid()){
						per1.getChildren().add(per2);
					}
				}
				//将装载好的一级菜单放入菜单中
				menu.add(per1);
			}
		}
		return menu;
	}
	public void setMenu(List<TPermission> menu) {
		this.menu = menu;
	}
	public List<TPermission> getPermission() {
		return permission;
	}
	public void setPermission(List<TPermission> permission) {
		this.permission = permission;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getLoginname() {
		return loginname;
	}
	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public TDept getDept() {
		return dept;
	}
	public void setDept(TDept dept) {
		this.dept = dept;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getIsenabled() {
		return isenabled;
	}
	public void setIsenabled(int isenabled) {
		this.isenabled = isenabled;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getCreator() {
		return creator;
	}
	public void setCreator(int creator) {
		this.creator = creator;
	}
	public Date getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	public int getUpdator() {
		return updator;
	}
	public void setUpdator(int updator) {
		this.updator = updator;
	}
	public Date getUpdatetime() {
		return updatetime;
	}
	public void setUpdatetime(Date updatetime) {
		this.updatetime = updatetime;
	}
	public String getPicurl() {
		return picurl;
	}
	public void setPicurl(String picurl) {
		this.picurl = picurl;
	}
	
	
}
