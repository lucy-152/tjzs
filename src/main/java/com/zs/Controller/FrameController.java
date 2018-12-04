package com.zs.Controller;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zs.Po.TUser;

import com.zs.exception.AppException;
import com.zs.pms.until.DateUtil;
import com.zs.pms.vo.QueryUser;
import com.zs.serviceimpl.ServiceImpl;

@Controller
public class FrameController {
	@Autowired
	ServiceImpl us;
	
	
	@RequestMapping("/tologin.do")
	public String toLogin(){
		return "login";
	}
	
	@RequestMapping("/totop.do")
	public String top(){
		return "top";
	}
	
	@RequestMapping("/toleft.do")
	public String left(){
		return "left";
	}
	
	@RequestMapping("/toright.do")
	public String right(){
		return "right";
	}
	@RequestMapping("/login.do")
	public String login(QueryUser user,String code,HttpSession session,ModelMap model){
		//验证码验证，从session中取得kaptcha生成的验证码
		String ocode=(String)session.getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
		//验证码不相同
		if(!ocode.equals(code)){
			//页面回带信息
			model.addAttribute("MSG","验证码输入有误，请重新输入");
			//回到登录页面
			return "login";
		}
		//验证码相同，校验登录
		TUser users;
		try{
		users=us.chkLogin(user);
		session.setAttribute("CUSER", users);
		//
		session.setAttribute("TODAY", DateUtil.getStrDate(new Date()));
		
		return "main";
		}catch(AppException e){//业务异常
			//页面带信息
			model.addAttribute("MSG",e.getErrMsg());
			//回到登录页面
			return "login";
		}catch(Exception e1){//系统异常
			e1.printStackTrace();
			return "error";
		}
	}
}
