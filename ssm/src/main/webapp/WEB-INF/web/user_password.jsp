<%@ page 
 contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>我的订单 - 达内学子商城</title>
    <link href="../css/orders.css" rel="Stylesheet"/>
    <link href="../css/header.css" rel="Stylesheet"/>
    <link href="../css/footer.css" rel="Stylesheet"/>
    <link href="../css/personage.css" rel="stylesheet" />
</head>
<body>
<body>
<!-- 顶部区域 -->
<c:import url="header.jsp"></c:import>
<!-- 我的订单导航栏-->
<div id="nav_order">
    <ul>
        <li><a href="">首页<span>&gt;</span>个人中心</a></li>
    </ul>
</div>
<!--我的订单内容区域 #container-->
<div id="container" class="clearfix">
<!-- 左边栏-->
		<c:import url="user_left_side_bar.jsp"></c:import>
    <!-- 右边栏-->
    <!--个人信息头部-->
    <div class="rightsidebar_box rt">
        <div class="rs_header">
            <span ><a href="profile.do">我的信息</a></span>
            <span class="rs_header_active"><a href="password.do">安全管理</a></span>
        </div>

        <!--安全管理 -->
        <div class="rs_content">
            <p class="change_password_title">更改密码</p>
            <div class="new_password">
                <span class="word">输入旧密码：</span><input type="password" id="old_password"/><span id="old_password_hint" class="change_hint"></span>
            </div>
            <div class="new_password">
                <span class="word">输入新密码：</span><input type="password" id="new_password"/><span id="new_password_hint" class="change_hint"></span>
            </div>
            <div class="confirm_password">
                <span class="word">确认新密码：</span><input type="password" id="confirm_password"/><span id="confirm_password_hint" class="confirm_hint"></span>
            </div>
            <div class="buttons-block">
                <a href="#" class="button-blue" onclick="changePassword()" >保存更改</a>
            </div>
        </div>


    </div>
</div>

<!-- 品质保障，私人定制等-->
<div id="foot_box">
    <div class="icon1 lf">
        <img src="../images/footer/icon1.png" alt=""/>

        <h3>品质保障</h3>
    </div>
    <div class="icon2 lf">
        <img src="../images/footer/icon2.png" alt=""/>

        <h3>私人定制</h3>
    </div>
    <div class="icon3 lf">
        <img src="../images/footer/icon3.png" alt=""/>

        <h3>学员特供</h3>
    </div>
    <div class="icon4 lf">
        <img src="../images/footer/icon4.png" alt=""/>

        <h3>专属特权</h3>
    </div>
</div>
<!-- 页面底部-->
<div class="foot_bj">
    <div id="foot">
        <div class="lf">
             <p class="footer1"><img src="../images/footer/logo.png" alt="" class=" footLogo"/></p>
             <p class="footer2"><img src="../images/footer/footerFont.png" alt=""/></p>
        </div>
        <div class="foot_left lf">
            <ul>
                <li><a href="#"><h3>买家帮助</h3></a></li>
                <li><a href="#">新手指南</a></li>
                <li><a href="#">服务保障</a></li>
                <li><a href="#">常见问题</a></li>
            </ul>
            <ul>
                <li><a href="#"><h3>商家帮助</h3></a></li>
                <li><a href="#">商家入驻</a></li>
                <li><a href="#">商家后台</a></li>
            </ul>
            <ul>
                <li><a href="#"><h3>关于我们</h3></a></li>
                <li><a href="#">关于达内</a></li>
                <li><a href="#">联系我们</a></li>
                <li>
                    <img src="../images/footer/wechat.png" alt=""/>
                    <img src="../images/footer/sinablog.png" alt=""/>
                </li>
            </ul>
        </div>
        <div class="service">
            <p>学子商城客户端</p>
            <img src="../images/footer/ios.png" class="lf">
            <img src="../images/footer/android.png" alt="" class="lf"/>
        </div>
        <div class="download">
            <img src="../images/footer/erweima.png">
        </div>
		<!-- 页面底部-备案号 #footer -->
        <div class="record">
            &copy;2017 达内集团有限公司 版权所有 京ICP证xxxxxxxxxxx
        </div>
    </div>

</div>
</body>
<style>
	.msg-error{
		background: #f00;color:#fff;padding:5px;
	}
	.msg-correct{
		background: #0f0;color:#fff;padding:5px;
	}
</style>
<script type="text/javascript" src="../js/jquery-3.1.1.min.js"></script>
<script src="../js/index.js"></script>
<script src="../js/jquery.page.js"></script>
<script type="text/javascript" src="../js/orders.js"></script>
<script>
	function changePassword(){
		//获取值
		var oldPassword = $("#old_password").val();
		var newPassword = $("#new_password").val();
		var confirmPassword = $("#confirm_password").val();
		//判断值
		if(
			checkPasswordLength(oldPassword) 
			&& checkPasswordLength(newPassword) 
			&& checkPasswordLength(confirmPassword) 
			&& checkPasswordEquals()	
		){
			//验证成功
			//使用异步请求
			$.ajax({
				"url":"handle_change_password.do",
				"data":"old_password="+oldPassword+"&new_password="+newPassword,
				"type":"POST",
				"dataType":"json",
				"success":function (obj) {
					if(obj.state == 1){
						//表示修改成功
						$("#old_password").val("");
						$("#new_password").val("");
						$("#confirm_password").val("");
						$("#old_password_hint").html("");
						$("#new_password_hint").html("");
						$("#confirm_password_hint").html("");	
						alert("密码修改成功");
					}else{
						alert(obj.message);
					}
				},
				"error":function(){
					alert("error!!!");
					location.href="../main/index.do";
				}
			});
		}else{
			//有规则不满足失败
			alert("请检查错误，修改后再提交！");
		}
	}
	//原密码丢失焦点时
	$("#old_password").blur(function(){
		//获取原密码
		var oldPassword = $("#old_password").val();
		//判断长度
		if(checkPasswordLength(oldPassword)){
			//长度ok
			$("#old_password_hint").html("密码格式正确");
			$("#old_password_hint").attr("class","msg-correct");
		}else{
			//长度NG
			$("#old_password_hint").html("密码长度必须在6-10位之间");
			$("#old_password_hint").attr("class","msg-error");
		}
	});
	//新密码丢失焦点
	$("#new_password").blur(function(){
		//获取原密码
		var newPassword = $("#new_password").val();
		//判断长度
		if(checkPasswordLength(newPassword)){
			//长度ok
			$("#new_password_hint").html("密码格式正确");
			$("#new_password_hint").attr("class","msg-correct");
		}else{
			//长度NG
			$("#new_password_hint").html("密码长度必须在6-10位之间");
			$("#new_password_hint").attr("class","msg-error");
			return;
		}
		checkPasswordEquals();
	});
	//确认密码丢失焦点
	$("#confirm_password").blur(function(){
		//获取确认密码
		var confirmPassword = $("#confirm_password").val();
		//判断长度
		if(checkPasswordLength(confirmPassword)){
			//长度ok
			$("#confirm_password_hint").html("密码格式正确");
			$("#confirm_password_hint").attr("class","msg-correct");
		}else{
			//长度NG
			$("#confirm_password_hint").html("密码长度必须在6-10位之间");
			$("#confirm_password_hint").attr("class","msg-error");
			return;
		}
		checkPasswordEquals();
	});
	function checkPasswordLength(password){
		return password.length<=10 && password.length>=6;
	}
	function checkPasswordEquals(){
		//验证长度
		var newPassword = $("#new_password").val();
		var confirmPassword = $("#confirm_password").val();
		if(newPassword == confirmPassword){
			//一致
			$("#confirm_password_hint").html("密码格式正确");
			$("#confirm_password_hint").attr("class","msg-correct");
			return true;
		}else{
			//不一致
			$("#confirm_password_hint").html("两次输入的密码不一致");
			$("#confirm_password_hint").attr("class","msg-error");
			return false;
		}
	}
</script>
<script type="text/javascript">
//自动加载
 $(function(){
		// 关闭所有的
		$("#leftsidebar_box dd").hide();
		// 显示"账号管理"的所有菜单项
		$("#leftsidebar_box .count_managment dd").show();
		// 所有标题的最右侧显示的箭头设置为“向右”
		$("#leftsidebar_box dt img").attr("src", "../images/myOrder/myOrder1.png");
		// 设置为向"账号管理"的箭头，向下
		$("#leftsidebar_box .count_managment img").attr("src",
				"../images/myOrder/myOrder2.png");
		// 并增加class属性
		$("#leftsidebar_box .count_managment dt").addClass("checkTurn");
		$("#leftsidebar_box .count_managment dt").css({
			"background-color" : "#770022"
		});
 });
</script>
</html>