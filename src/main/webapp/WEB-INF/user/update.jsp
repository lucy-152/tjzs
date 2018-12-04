<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="res/lecheng/css/admin.css" rel="stylesheet" type="text/css" />
<link href="res/common/css/theme.css" rel="stylesheet" type="text/css" />
<link href="res/common/css/jquery.validate.css" rel="stylesheet"
	type="text/css" />
<link href="res/common/css/jquery.treeview.css" rel="stylesheet"
	type="text/css" />
<link href="res/common/css/jquery.ui.css" rel="stylesheet"
	type="text/css" />

<!-- <script src="/thirdparty/ckeditor/ckeditor.js" type="text/javascript"></script> -->
<!-- <script src="/thirdparty/My97DatePicker/WdatePicker.js" type="text/javascript"></script> -->
<script type="text/javascript" src="res/fckeditor/fckeditor.js"></script>
<script src="res/common/js/jquery.js" type="text/javascript"></script>
<script src="res/common/js/jquery.ext.js" type="text/javascript"></script>
<script src="res/common/js/jquery.form.js" type="text/javascript"></script>
<script src="res/common/js/lecheng.js" type="text/javascript"></script>
<script src="res/lecheng/js/admin.js" type="text/javascript"></script>
<!-- 引入jQuery -->
<script type="text/javascript" language="javascript" src="js/jquery-1.11.0.min.js"></script>
<!-- 引入日期控件 -->
<script type="text/javascript" language="javascript" src="js/DatePicker/WdatePicker.js"></script>
<link rel="stylesheet" href="res/css/style.css" />
<title>user-update</title>
<!-- 添加表单验证 -->
<script type="text/javascript">
	//用户名必须包含数字与字母，结束前不能全都是数字，6-16位
	var CHKLOGOINNAME="^(?![0-9]+$)[a-zA-Z0-9]{6,16}$";	
	//密码必须包含数字与字母，结束前不能全都是数字或者字母，6-16位
	var CHKPASSWORD="^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{6,16}$";
	//出生日期必须符合yyyy-MM-dd的格式，月份1-12    日期只有1-31
	var CHKDATE="^[0-9]{4}-(0?[1-9]|1[0-2])-(0?[1-9]|[1-2][0-9]|3[0-1])$";
	//邮箱必须符合xxxxxx@xxx.com，可以包含下划线_      企业邮箱：qwe@huawei.com.cn
	var CHKEMAIL="^[a-zA-Z0-9_]+@[a-z0-9]{2,5}(\\.[a-z]{2,3}){1,2}$";
	//真实姓名必须包含两个字以上
	var CHKREALNAME="^[\u4e00-\u9fa5]{2,}$";
	//验证用户名
	function chkLoginname() {
		
		//获取用户名
		var lgnEle=document.getElementById("loginname");
		var loginname=$("#loginname").val();
		//定义用户匹配的正则表达式
		var reg=new RegExp(CHKLOGOINNAME);
		if(reg.test(loginname)){
			if(chkExistLoginname(loginname)){//表示不重复
				return true;
			}else{
				return false;
			}
		}else{
			$("#resultName").html("用户名必须包含数字与字母且不能低于六位");
			$("#resultName").css("color","red");
			//清空文本
			//lgnEle.value="";
			//重新聚焦
			//lgnEle.focus();
			return false;
		}
	}
	//
	function chkEmail() {
		
		//获取用户名
		var lgnEle=document.getElementById("email");
		var email=$("#email").val();
		//定义用户匹配的正则表达式
		var reg=new RegExp(CHKDATE);
		if(reg.test(email)){
			if(chkExistEmail(email)){//表示不重复
				return true;
			}else{
				return false;
			}
		}else{
			$("#resultEml").html("邮箱必须符合xxxxxx@xxx.com");
			$("#resultEml").css("color","red");
			//清空文本
			//lgnEle.value="";
			//重新聚焦
			//lgnEle.focus();
			return false;
		}
	}
	
	
	//检查用户名是否存在
	function chkExistLoginname(loginname){
		var flag=false;
		$.ajax({
			//请求路径
			url:'chkExist.do',
			//请求方式
			type:'post',
			//请求参数
			data:'type=1&loginname='+loginname,
			//是否异步
			async:false,
			//预期服务器响应的类型
			dataType:'text',
			//响应成功回调函数
			success:function(flag){
				if(flag=='true'){//没有重复
					$("#resultName").html("√");
					$("#resultName").css('color','green');
					flag=true;
				}else{
					$("#resultName").html("此用户名已存在");
					$("#resultName").css('color','red');
					flag=false;
				}
			},
			error:function(){
				alert('请求数据失败。。。。。');
			}
		});
		return flag;
	}
	
	//检查邮箱是否存在
	function chkExistEmail(email){
		var flag=false;
		$.ajax({
			//请求路径
			url:'chkExist.do',
			//请求方式
			type:'post',
			//请求参数
			data:'type=2&email='+email,
			//是否异步
			async:false,
			//预期服务器响应的类型
			dataType:'text',
			//响应成功回调函数
			success:function(flag){
				if(flag=='true'){//没有重复
					$("#resultEml").html("√");
					$("#resultEml").css('color','green');
					flag=true;
				}else{
					$("#resultEml").html("此邮箱已存在");
					$("#resultEml").css('color','red');
					flag=false;
				}
			},
			error:function(){
				alert('请求数据失败。。。。。');
			}
		});
		return flag;
	}
	//验证所有
	function chkAll() {
		
		//return chkLoginname()&&chkPassword()&&chkRePwd();
		return chkEmail()&&chkLoginname();
	}
</script>
</head>
<body>
	<div class="box-positon">
		<div class="rpos">当前位置: 用户管理 - 修改</div>
		<form class="ropt">
			<input type="submit" onclick="javascript:history.back()"
				value="返回列表" class="return-button" />
		</form>
		<div class="clear"></div>
	</div>
	<div class="body-box" style="float: right">
		<form action="userupdate.do?id=${user.id}" method="post" onsubmit="chkAll();">
			<table cellspacing="1" cellpadding="2" width="100%" border="0"
				class="pn-ftable">
				<tbody>
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h"><span
							class="pn-frequired"></span> <span class="pn-frequired">${msg}</span>
						</td>
					</tr>
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h"><span
							class="pn-frequired">*</span> 用户名:</td>
						<td width="80%" class="pn-fcontent"><input type="text"
							class="required" name="loginname" id="loginname" maxlength="100"
							value="${user.loginname }"  onblur="chkLoginname()"/>
							<span id="resultName"></span>
							</td>
					</tr>
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h"><span
							class="pn-frequired">*</span> 真实姓名:</td>
						<td width="80%" class="pn-fcontent"><input type="text"
							class="required" name="realname" maxlength="100"
							value="${user.realname }" /></td>
					</tr>
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h">性别:</td>
						<td width="80%" class="pn-fcontent"><c:if
								test="${user.sex=='男' }">
								<input type="radio" name="sex" value="男" checked="checked" />男
							<input type="radio" name="sex" value="女" />女
						</c:if> <c:if test="${user.sex=='女' }">
								<input type="radio" name="sex" value="男" />男
							<input type="radio" name="sex" value="女" checked="checked" />女
						</c:if></td>
					</tr>
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h">出生日期:</td>
						<td width="80%" class="pn-fcontent"><input type="text"
							class="Wdate" onclick="WdatePicker()" name="birthday" maxlength="80"
							value="${user.birthday }" /></td>
					</tr>
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h">部门:</td>
						<td width="80%" class="pn-fcontent"><select name="dep">
								<c:forEach items="${depts}" var="dep">
									<!-- 显示所属部门 -->
									<c:if test="${user.dep==dep.id}">
										<option value="${dep.id}" selected="selected">${dep.dname}</option>
									</c:if>
									<!-- 显示其他部门 -->
									<c:if test="${user.dep!=dep.id }">
										<option value="${dep.id}">${dep.dname}</option>
									</c:if>
								</c:forEach>
						</select></td>
					</tr>
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h">是否可用:</td>
						<td width="80%" class="pn-fcontent"><c:if
								test="${user.enabled==1 }">
								<input type="radio" class="required" name="enabled"
									maxlength="80" value="1" checked="checked" />可用
							<input type="radio" class="required" name="enabled"
									maxlength="80" value="2" />不可用
						</c:if> <c:if test="${user.enabled==2 }">
								<input type="radio" class="required" name="enabled"
									maxlength="80" value="1" />可用
							<input type="radio" class="required" name="enabled"
									maxlength="80" value="2" checked="checked" />不可用
						</c:if></td>
					</tr>
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h">邮箱:</td>
						<td width="80%" class="pn-fcontent"><input type="text"
							class="required" name="email" id="email" maxlength="80"
							value="${user.email }" onblur="chkEmail()" />
							<span id="resultEml"></span>
							</td>
					</tr>
				</tbody>
				<tbody>
					<tr>
						<td class="pn-fbutton" colspan="2"><input type="submit"
							class="submit" value="提交" /> &nbsp; <input type="reset"
							class="reset" value="重置" /></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>