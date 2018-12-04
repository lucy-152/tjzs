package com.zs.Service;

import java.util.List;

import com.zs.Po.TUser;
import com.zs.pms.vo.QueryUser;

public interface UserService {
	
	public List<TUser> queryByPage(QueryUser query,int page);
	
	public int 	queryPageCount(QueryUser query);
}
