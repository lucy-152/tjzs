package com.zs.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.zs.UserBean.UserBean;
import com.zs.serviceimpl.ServiceImpl;

@Controller
public class HelloController {
	@Autowired
	ServiceImpl sa;
	
	@RequestMapping("/hello.do")//和页面上的url地址对应
	public String hello(String name,ModelMap model){//name:传进来的参数
		System.out.println("hello spring mvc"+name);
		//数据会带页面
		model.addAttribute("DNAME","你好"+name);//dname:变量或者key，逗号后面的是value
		return "hello";
	}
	@RequestMapping("/input.do")
	public String input(UserBean user,ModelMap model){
		//会带user对象到页面
		model.addAttribute("USER",user);
		//调业务层
		model.addAttribute("WELCOME",sa.getWelcome());
		return "hello";
	}
	@RequestMapping("/login.do")//和浏览器上的url要一致，这是jsp跳转后要到的地址
	public String login(UserBean user,ModelMap model){
		model.addAttribute("LOGIN",user);
		model.addAttribute("PAS",user);
		return "";
	}
	
}