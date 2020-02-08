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
<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/locale/easyui-lang-zh_CN.js"></script>
</head>
<body>
	<!-- 方式一：将静态HTML代码渲染为datagrid样式 -->
	<table class="easyui-datagrid">
		<thead>
			<tr>
				<th data-options="field:'id'">编号</th>
				<th data-options="field:'name'">姓名</th>
				<th data-options="field:'age'">年龄</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>001</td>
				<td>宋江</td>
				<td>35</td>
			</tr>
			<tr>                           
				<td>002</td>               
				<td>卢俊义</td>            
				<td>34</td>                
			</tr>                          
		</tbody>
	</table>
	
	<hr>
	
	<!-- 方式二：发送ajax请求获取json数据创建datagrid -->
	<table class="easyui-datagrid" data-options="url:'${ pageContext.request.contextPath }/json/datagrid_data.json'" >
		<thead>
			<tr>
				<th data-options="field:'id'">编号</th>
				<th data-options="field:'name'">姓名</th>
				<th data-options="field:'age'">年龄</th>
			</tr>
		</thead>
	</table>
	
		<hr>
	
	<!-- 方式三：使用easyUI提供的API创建datagrid -->
	<table id="mytable" ></table>
	<script type="text/javascript">
		$(function(){
			//页面加载完成后，创建数据表格datagrid
			$("#mytable").datagrid({
				//定义标题行所有的列
				columns:[[
				         {title:'编号',field:'id',checkbox:'true'},
				         {title:'姓名',field:'name'},
				         {title:'年龄',field:'age'},
				         {title:'地址',field:'address'}
				         ]],
				//请求地址
				url:'${ pageContext.request.contextPath }/json/datagrid_data.json',
				//行号
				rownumbers:true,
				//单选
				singleSelect:true,
				//工具条
				toolbar:[
				         {text:'添加',iconCls:'icon-add',handler:function(){
				        	 $.messager.alert("系统提示","增加","iconCls:'icon-add'") ;
				         }},
				         {text:'删除',iconCls:'icon-remove'},
				         {text:'修改',iconCls:'icon-edit'},
				         {text:'查询',iconCls:'icon-search'}
				         ],
				//分页条
				pagination:true
			}) ;
		}) ;
	</script>
</body>