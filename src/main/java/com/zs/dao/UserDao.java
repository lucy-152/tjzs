package com.zs.dao;

import java.util.List;

import com.zs.Po.TUser;
import com.zs.pms.vo.QueryUser;



public interface UserDao {
	//通过条件查询
	public List<TUser> queryByCon(QueryUser query);
	//通过id查询用户信息
	public TUser queryById(int id);
	//批量删除
	public void deleteByIds(int[] ids);
	//修改
	public void update(TUser user);
	//新增
	public int insert(TUser user);
	//删除
	public void delete(int id);
	//查询总数
	public int queryCount(QueryUser query);
}
