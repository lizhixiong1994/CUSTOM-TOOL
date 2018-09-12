<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>我的订单 - 达内学子商城</title>
<link href="../css/orders.css" rel="stylesheet" />
<link href="../css/header.css" rel="stylesheet" />
<link href="../css/footer.css" rel="stylesheet" />
<link href="../css/personage.css" rel="stylesheet" />
<link href="../css/common.css" rel="stylesheet" />
</head>
<body>
	<!-- 顶部区域 -->
	<c:import url="header.jsp"></c:import>
	<!-- 我的订单导航栏-->
	<div id="nav_order">
		<ul>
			<li><a href="">首页<span>&gt;</span>个人中心
			</a></li>
		</ul>
	</div>
	<!--我的订单内容区域 #container-->
	<div id="container" class="clearfix">
		<!-- 左边栏-->
		<c:import url="user_left_side_bar.jsp"></c:import>
		<!-- 右边栏-->
		<div class="rightsidebar_box rt">
			<!--标题栏-->
			<div class="rs_header">
				<span class="address_title">收获地址管理</span>
			</div>
			<!--收货人信息填写栏-->
			<div class="rs_content">

				<!--已有地址栏-->
				<div class="address_list" >
					<!-- 待加入列表 -->
					<!-- 待加入列表 -->
					<!-- 待加入列表 -->
				</div>
			</div>
			<div class="buttons-block">
				<a href="#" class="button-blue" onclick="showPopup(0)">增加地址</a>
			</div>
		</div>
	</div>
	</div>

	<!-- 品质保障，私人定制等-->
	<div id="foot_box">
		<div class="icon1 lf">
			<img src="../images/footer/icon1.png" alt="" />

			<h3>品质保障</h3>
		</div>
		<div class="icon2 lf">
			<img src="../images/footer/icon2.png" alt="" />

			<h3>私人定制</h3>
		</div>
		<div class="icon3 lf">
			<img src="../images/footer/icon3.png" alt="" />

			<h3>学员特供</h3>
		</div>
		<div class="icon4 lf">
			<img src="../images/footer/icon4.png" alt="" />

			<h3>专属特权</h3>
		</div>
	</div>
	<!-- 页面底部-->
	<div class="foot_bj">
		<div id="foot">
			<div class="lf">
				<p class="footer1">
					<img src="../images/footer/logo.png" alt="" class=" footLogo" />
				</p>
				<p class="footer2">
					<img src="../images/footer/footerFont.png" alt="" />
				</p>
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
					<li><img src="../images/footer/wechat.png" alt="" /> <img
						src="../images/footer/sinablog.png" alt="" /></li>
				</ul>
			</div>
			<div class="service">
				<p>学子商城客户端</p>
				<img src="../images/footer/ios.png" class="lf"> <img
					src="../images/footer/android.png" alt="" class="lf" />
			</div>
			<div class="download">
				<img src="../images/footer/erweima.png">
			</div>
			<!-- 页面底部-备案号 #footer -->
			<div class="record">&copy;2017 达内集团有限公司 版权所有 京ICP证xxxxxxxxxxx</div>
		</div>
	</div>
	<!-- 弹窗 -->
	<a href="#" class="show_popup" onclick="showPopup()">弹出</a>

	<div id="popup_content">

		<form method="post" action="" id="address-form">
			<h3>新增收货人地址</h3>
			<!-- 关闭弹窗 -->
			<!--收货人姓名-->
			<div class="recipients">
				<span class="red">*</span><span class="kuan">收货人：</span><input
					type="text" name="recvName" id="recvName" />
			</div>
			<!--收货人所在城市等信息-->
			<div data-toggle="distpicker" class="address_content">
				<span class="red">*</span> <span class="kuan">省&nbsp;&nbsp;份：</span>
				<select data-province="---- 选择省 ----" id="recvProvince"
					onchange="getCity(this.value)" name="recvProvince">

				</select> 城市：<select data-city="---- 选择市 ----" id="recvCity"
					onchange="getArea(this.value)" name="recvCity">

				</select> 区/县：<select data-district="---- 选择区 ----" id="recvArea"
					name="recvArea">

				</select>
			</div>


			<!--收货人详细地址-->
			<div class="address_particular">
				<span class="red">*</span><span class="kuan">详细地址：</span>
				<textarea name="recvAddr" id="recvAddr" cols="60" rows="3"
					placeholder="建议您如实填写详细收货地址"></textarea>
			</div>
			<!--收货人地址-->
			<div class="address_tel">
				<span class="red">*</span><span class="kuan">手机号码：</span><input
					type="tel" id="recvPhone" name="recvPhone" />固定电话：<input
					type="text" name="recvTel" id="recvTel" />
			</div>
			<!--邮政编码-->
			<div class="address_postcode">
				<span class="red">&nbsp;</span><span class="kuan">邮政编码：</span><input
					type="text" name="recvZip" id="recvZip"/>
			</div>
			<!--地址名称-->
			<div class="address_name">
				<span class="red">&nbsp;</span><span class="kuan">地址名称：</span><input
					type="text" id="addressName" name="recvTag" />如：<span class="sp">家</span><span
					class="sp">公司</span><span class="sp">宿舍</span>
			</div>
			
			<!-- 处理按钮 -->
			<div class="buttons-block">
				<!--保存收货人信息-->
				<input type="hidden" name="id" id="id" />
				<!--保存收货人信息-->
				<a href="#" class="button-blue" onclick="postForm()">保存收货人信息</a>
				<!--关闭按钮-->
				<a href="#" class="button-blue" onclick="dismissPopup()">取消</a>
				<div style="clear: both;"></div>
			</div>

		</form>

	</div>

	<div id="mask"></div>
</body>
<script type="text/javascript" src="../js/jquery-3.1.1.min.js"></script>
<script src="../js/jquery.page.js"></script>
<script type="text/javascript" src="../js/orders.js"></script>
<script type="text/javascript" src="../js/distpicker111.data.js"></script>
<script type="text/javascript" src="../js/distpicker111.js"></script>
<script type="text/javascript" src="../js/personal.js"></script>
<script type="text/javascript">
//地址列表中每个条数据的HTML代码(带有特殊字符用于占位的HTML代码)
var header = '<div class="header">' + '<span class="tag">地址名称</span>'
		+ '<span class="name">姓名</span>' + '<span class="addr">地址详情</span> '
		+ '<span class="phone">联系电话</span> ' + '<span class="op">操作</span>'
		+ '</div>';
var htmlTemplate = '<div class="content %CONTENT-ACTIVE%">'
		+ '<span class="tag  %TAG-ACTIVE%">%TAG%</span>'
		+ '<span class="name">%NAME%</span>'
		+ '<span class="addr">%ADDRESS%</span>'
		+ '<span class="phone">%PHONE%</span>' + '<span class="op">'
		+ '<a href="###" onclick="showPopup(%ID%)" >修改</a>' + '|'
		+ '<a href="###" onclick="deleteAddress(%ID%)">删除</a>' + '</span>'
		+ '<span class="set_default">' + '<a href="###" onclick="serDefault(%ID%)">%设为默认%</a>'
		+ '</span>' + '</div>';
//****显示List(Address)列表******
function showAddressList() {
	var url = "get_list.do";
	$.ajax({
		"url" : url,
		"type" : "GET",
		"dataType" : "json",
		"success" : function(obj) {
			//先清空原有列表
			$(".address_list").empty();
			//声明变量
			var htmlString = header;
			//obj是服务器响应的整个json字符传对象
			//应该遍历obj.data ,决定如何显示
			for (var i = 0; i < obj.data.length; i++) {
				var address = obj.data[i];
				//准备模板并准备替换符
				htmlString += htmlTemplate;
				htmlString = htmlString.replace("%TAG%", address.recvTag);
				htmlString = htmlString.replace("%NAME%", address.recvName);
				htmlString = htmlString.replace("%ADDRESS%",address.recvDistrict + address.recvAddr);
				htmlString = htmlString.replace("%PHONE%", address.recvPhone);
				htmlString = htmlString.replace(/%ID%/g, address.id);
				if (address.isDefault == 1) {
					htmlString = htmlString.replace('%CONTENT-ACTIVE%',
							"content_active");
					htmlString = htmlString.replace('%TAG-ACTIVE%',
							"tag_active");
					htmlString = htmlString.replace('%设为默认%',
							"");
				} else {
					htmlString = htmlString.replace('%CONTENT-ACTIVE%', "");
					htmlString = htmlString.replace('%TAG-ACTIVE%', "");
					htmlString = htmlString.replace('%设为默认%',
					"设为默认");
				}
			}
			//将内容填入#address_list中
			$(".address_list").html(htmlString);
		}
	});
}
$(".lxdh_normal").each(function(i, e) {
	var phone = $(e).html();
	$(e).html(changePhone(phone));
});
//***弹出窗口**********加载省级列表*****
function showPopup(id) {
	//清空表单中各控件已经存在的值
	$("#address-form")[0].reset();

	//设定提交数据为增加还是修改
	//0 表示新增
	//1 表示编辑
	$("#id").val(id == 0 ? "0" : id);

	//判断类型
	var title = id == 0 ? "新增收货人地址" : "编辑收货人地址";
	$("#popup_content h3").html(title);

	// 获取窗口尺寸
	var ww = $(window).width();
	var wh = $(window).height();

	// 弹出mask
	$("#mask").show();
	$("#mask").css({
		"width" : ww,
		"height" : wh
	});

	// 弹出popup
	var w = 700;
	var h = 420;
	$("#popup_content").css({
		"width" : w,
		"height" : h,
		"left" : (ww - w) / 2,
		"top" : 120
	});
	$("#popup_content").show();

	if (id != 0) {
		//不为0表示修改数据，则加载数据
		var url = "get_address.do";
		//利用ajax获取id对应的adress对象数据
		$.ajax({
			"url" : url,
			"data" : "id=" + id,
			"type" : "GET",
			"dataType" : "json",
			"success" : function(obj) {
				if (obj.state == 1) {
					//已经获取到数据，加载到弹窗中
					$("#recvName").val(obj.data.recvName);
					//$("#recvProvince option[value='"+obj.data.recvProvince+"']").attr("selected","selected");
					getProvince(obj.data.recvProvince);
					getCity(obj.data.recvProvince, obj.data.recvCity);
					getArea(obj.data.recvCity, obj.data.recvArea);
					$("#recvAddr").val(obj.data.recvAddr);
					$("#recvPhone").val(obj.data.recvPhone);
					$("#recvTel").val(obj.data.recvTel);
					$("#recvZip").val(obj.data.recvZip);
					$("#addressName").val(obj.data.recvTag);
				}
			}
		});
	} else {
		//利用ajax获取省级列表,使用默认无参数
		getProvince();
	}
}
//****关闭弹窗*******
function dismissPopup() {
	// 隐藏mask
	$("#mask").hide();
	// 隐藏popup
	$("#popup_content").hide();
}
//*****加载省级列表******
function getProvince(provinceCode) {
	//若provinceCode有值，则选中code对应的值
	var url = "../dict/provinces.do";
	$.ajax({
		"url" : url,
		"type" : "POST",
		"dataType" : "json",
		"success" : function(obj) {
			//创建option节点
			var op = document.createElement("option");
			op.value = -1;
			op.text = "---- 请选择 ----";
			// 将节点添加到<select>中
			document.getElementById("recvProvince").appendChild(op);
			if (obj.state == 1) {
				for (var i = 0; i < obj.data.length; i++) {
					//创建option节点
					var op = document.createElement("option");
					// 配置节点属性
					op.value = obj.data[i].provinceCode;
					op.text = obj.data[i].provinceName;
					// 将节点添加到<select>中
					document.getElementById("recvProvince").appendChild(op);
				}
				if (provinceCode) {
					$("#recvProvince").val(provinceCode);
				}
			}
		}
	});
}
//****根据省级列表查询市级
function getCity(provinceCode, cityCode) {
	//先清空所有的
	$("#recvCity").html("");
	$("#recvArea").html("");

	var url = "../dict/citys.do";
	//利用ajax获取省级列表
	$.ajax({
		"url" : url,
		"data" : "provinceCode=" + provinceCode,
		"type" : "POST",
		"dataType" : "json",
		"success" : function(obj) {
			//创建option节点
			var op = document.createElement("option");
			op.value = -1;
			op.text = "---- 请选择 ----";
			// 将节点添加到<select>中
			document.getElementById("recvCity").appendChild(op);
			if (obj.state == 1) {
				for (var i = 0; i < obj.data.length; i++) {
					//则开始化注入
					//创建option节点
					var op = document.createElement("option");
					// 配置节点属性
					// <option value="值">显示的文字</option>
					op.value = obj.data[i].cityCode;
					op.text = obj.data[i].cityName;
					// 将节点添加到<select>中
					document.getElementById("recvCity").appendChild(op);
				}
				if (cityCode) {
					// 【新】选中默认的选项(Option)
					$("#recvCity").val(cityCode);
				}
			}
		}
	});
}
//****根据市级列表下列的区******
function getArea(cityCode, areaCode) {
	//先清空所有的
	$("#recvArea").html("");
	var url = "../dict/areas.do";
	//利用ajax获取
	$.ajax({
		"url" : url,
		"data" : "cityCode=" + cityCode,
		"type" : "POST",
		"dataType" : "json",
		"success" : function(obj) {
			//创建option节点
			var op = document.createElement("option");
			op.value = -1;
			op.text = "---- 请选择 ----";
			// 将节点添加到<select>中
			document.getElementById("recvArea").appendChild(op);
			if (obj.state == 1) {
				for (var i = 0; i < obj.data.length; i++) {
					//则开始化注入
					//创建option节点
					var op = document.createElement("option");
					// 配置节点属性
					// <option value="值">显示的文字</option>
					op.value = obj.data[i].areaCode;
					op.text = obj.data[i].areaName;
					// 将节点添加到<select>中
					document.getElementById("recvArea").appendChild(op);
				}
				if (areaCode) {
					$("#recvArea").val(areaCode);
				}
			}
		}
	});
}
//****提交数据列表*****
function postForm() {
	//获取隐藏区域的id值，判断
	var url;
	if ($("#id").val() == 0) {//0 表示新增
		url = "../address/add.do";
	} else {
		url = "../address/handle_update.do";
	}
	var data = $("#address-form").serialize();
	//利用ajax
	$.ajax({
		"url" : url,
		"data" : data,
		"type" : "POST",
		"dataType" : "json",
		"success" : function(obj) {
			alert(obj.message);
			//关闭弹窗
			dismissPopup();
			//刷新列表
			showAddressList();
		}
	});
}
//*****删除地址数据******
function deleteAddress(id) {
	if (confirm("确定删除数据？")) {
		var url = "delete.do";
		var data = "id=" + id;
		//利用ajax删除数据
		$.ajax({
			"url" : url,
			"data" : data,
			"type" : "GET",
			"dataType" : "json",
			"success" : function(obj) {
				alert(obj.message);
				if (obj.state == 1) {
					//刷新列表
					showAddressList();
				}
			}
		});
	}
}
//*****设置默认地址*****
function serDefault(id){
	//设置默认
	var url = "set_default.do";
	var data = "id=" + id;
	//利用ajax删除数据
	$.ajax({
		"url" : url,
		"data" : data,
		"type" : "GET",
		"dataType" : "json",
		"success" : function(obj) {
			if (obj.state == 1) {
				//刷新列表
				showAddressList();
			}
		}
	});
}
//========页面加载完成时应该执行的任务=======
$(function() {
	// 关闭所有的
	$("#leftsidebar_box dd").hide();
	// 显示"账号管理"的所有菜单项
	$("#leftsidebar_box .address dd").show();
	// 所有标题的最右侧显示的箭头设置为“向右”
	$("#leftsidebar_box dt img").attr("src", "../images/myOrder/myOrder1.png");
	// 设置为向"账号管理"的箭头，向下
	$("#leftsidebar_box .address img").attr("src",
			"../images/myOrder/myOrder2.png");
	// 并增加class属性
	$("#leftsidebar_box .address dt").addClass("checkTurn");
	$("#leftsidebar_box .address dt").css({
		"background-color" : "#770022"
	});
	//刷新列表
	showAddressList();
});
</script>
</html>
























