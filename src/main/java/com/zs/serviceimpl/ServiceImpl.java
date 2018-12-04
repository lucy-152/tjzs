package com.zs.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zs.Po.TUser;
import com.zs.exception.AppException;
import com.zs.dao.UserDao;
import com.zs.pms.vo.QueryUser;



@Service
public class ServiceImpl {
	
	@Autowired
	private UserDao udao;
	
	public String getWelcome(){
		return "欢迎";
	}
	//建立方法，关于获取菜单的数据
	
	
	
	
	public TUser chkLogin(QueryUser query) throws AppException {
		// TODO Auto-generated method stub
		List<TUser> list=udao.queryByCon(query);
		if(list==null||list.size()!=1){
			throw new AppException("用户名或密码有误，请重新输入！", 1000);
		}
		/*
		 * 根据querybycon获得id（根据用户名密码获取用户id），再根据id调用querybyid
		 * querybyid根据用户id查询出用户权限信息
		 */
		TUser us=udao.queryById(list.get(0).getId());
		return us;
	}

}
