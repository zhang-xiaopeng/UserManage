<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>tabs</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script>
</head>
<body class="easyui-layout">
	<!-- 使用div元素描述每个区域 -->
	<div data-options="region:'north'" style="height:100px;" title="XXX管理系统">北部区域</div>
	<div data-options="region:'west'" style="width:200px;" title="系统菜单">
		<!-- accordion折叠面板 -->
		<div class="easyui-accordion" data-options="fit:'true'">
			<!-- 使用子div表示每个面板 -->
			<div title = "用户管理" data-options="iconCls:'icon-edit'">
				<a id="button1" class="easyui-linkbutton">用户管理</a>	
				<script type="text/javascript">
					$(function(){
						//页面加载完成后，为上面的按钮绑定事件
						$("#button1").click(function(){
							//判断选项卡面板是否存在，如果存在，选中面板;否则，添加面板
							var e = $("#mytabs").tabs("exists","用户面板") ;
							if(e){
								$("#mytabs").tabs("select","用户面板") ;
							}else{
								//调用tabs对象的add方法动态添加一个选项卡
								$("#mytabs").tabs("add",{
									title:'用户面板',
									iconCls:'icon-edit',
									closable:true,
									content:'<iframe frameborder="0" height="100%" width="100%" src="https://www.baidu.com"></iframe>'
								}) ;
							}
						}) ;
					}) ;
				</script>
			</div>
			<div title = "角色管理" data-options="iconCls:'icon-save'">角色管理</div>
			<div title = "友情链接" data-options="iconCls:'icon-cut'">友情链接</div>
		</div>
	</div>
	<div data-options="region:'center'">
		<!-- tabs选项卡面板 -->
		<div id="mytabs" class="easyui-tabs" data-options="fit:'true'">
			<!-- 使用子div表示每个面板 -->
			<div title = "用户管理" data-options="iconCls:'icon-edit',closable:'true'">用户管理</div>
			<div title = "角色管理" data-options="iconCls:'icon-save',closable:'true'">角色管理</div>
			<div title = "友情链接" data-options="iconCls:'icon-cut',closable:'true'">友情链接</div>
		</div>
	</div>
	<div data-options="region:'east'" style="width:50px;">东部区域</div>
	<div data-options="region:'south'" style="height:50px;">南部区域</div>
	
</body>
</html>