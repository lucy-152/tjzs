package com.zs.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;

import com.zs.Service.UserService;
import com.zs.pms.vo.QueryUser;
@Controller
public class UserController {
	@Autowired
	UserService us;
	
	
	public String list(QueryUser query,String page,ModelMap map){
		//page是空
		if(page==null||"".equals(page)){
			page="1";//默认第一页
		}
		//带回分页数据
		map.addAttribute("LIST",us.queryByPage(query,Integer.parseInt(page)));
		//带回总页数
		map.addAttribute("PAGECONT",us.queryPageCount(query));
		//回带当前页数
		map.addAttribute("PAGE",page);
		//回带查询条件
		map.addAttribute("QUERY",query);
		//返回user/list.jsp
		return "user/list";
	}
}
