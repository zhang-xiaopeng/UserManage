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
<link rel="stylesheet" href="${pageContext.request.contextPath }/js/ztree/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/ztree/jquery.ztree.all-3.5.js"></script>
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
			<div title = "角色管理" data-options="iconCls:'icon-save'">
				<!-- 展示ztree效果，使用标准接送数据构造ztree -->
				<ul id="ztree1" class="ztree"></ul>
				<script type="text/javascript">
					$(function(){
						//页面加载完成后，执行这段代码------动态创建ztree
						var setting =  {} ;
						//构造节点数据
						var zNodes = [
						              {
						            	 "name":"节点一",
						            	 "children":[
						            	             {"name":"子节点1"},
						            	             {"name":"子节点2"}
						            	             ]
						              },  //每个json对象表示一个节点数据
						              {"name":"节点二"},
						              {"name":"节点三"}
						              ] ;
						//调用api初始化ztree
						$.fn.zTree.init($("#ztree1"),setting,zNodes) ;
					}) ;
				</script>
			</div>
			<div title = "友情链接" data-options="iconCls:'icon-cut'">
				<ul id="ztree2" class="ztree"></ul>
				<script type="text/javascript">
					$(function(){
						var setting2 = {
								data:{
									simpleData:{
										enable:true  //表示要使用简单json构造ztree节点
									}
								}
						} ;
						var zNodes2 = [
						              {"id":"1","pId":"0","name":"节点一"},
						              {"id":"2","pId":"1","name":"节点二"},
						              {"id":"3","pId":"2","name":"节点三"},
						              ] ;
						$.fn.zTree.init($("#ztree2"),setting2,zNodes2) ;
					}) ;
				</script>
			</div>
			<div title="系统管理" data-options="iconCls:'icon-remove'">
				<ul id="ztree3" class="ztree"></ul>
				<script type="text/javascript">
					$(function(){
						var setting3 = {
								data:{
									simpleData:{
										enable:true  //表示要使用简单json构造ztree节点
									}
								},
								//为节点绑定单击事件
								callback:{
									onClick:function(event,treeId,treeNode){
										if(treeNode.page != undefined){
											if($("#mytabs").tabs("exists",treeNode.name)){
												$("#mytabs").tabs("select",treeNode.name) ;
											}else{
												//动态添加选项卡
												$("#mytabs").tabs("add",{
													title:treeNode.name,
													content:'<iframe frameborder="0" height="100%" width="100%" src="'+ treeNode.page +'"></iframe>' ,
													closable:true
												}) ;
											}
										}
									}
								}
						} ;
	
						//发送ajax请求，获取json数据
						$.post("${pageContext.request.contextPath}/json/menu.json",{},function(data){
							$.fn.zTree.init($("#ztree3"),setting3,data) ;
						},'json') ;
						
					}) ;
				</script>
			</div>
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