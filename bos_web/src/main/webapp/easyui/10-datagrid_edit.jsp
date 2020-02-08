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
	
	<table id="mytable" ></table>
	<script type="text/javascript">
		$(function(){
			var myIndex = -1 ;   //全局变量，值为正在编辑行的索引
			//页面加载完成后，创建数据表格datagrid
			$("#mytable").datagrid({
				//定义标题行所有的列
				columns:[[
				         {title:'编号',field:'id',checkbox:'true'},
				         {width:150,title:'姓名',field:'name',editor:{
				        	 								type:'validatebox',
				        	 								options:{}
				         }},
				         {width:150,title:'年龄',field:'age',editor:{
															type:'numberbox',
							 								options:{}
				         }},
				         {width:150,title:'日期',field:'address',editor:{
															type:'datebox',
							 								options:{}
				         }}
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
				        	 $("#mytable").datagrid("insertRow",{
				        		 index:0, //在第一行插入数据
				        		 row:{}  //空行
				        	 }) ;
				        	 $("#mytable").datagrid("beginEdit",0) ;
				        	 myIndex = 0 ;
				         }},
				         {text:'删除',iconCls:'icon-remove',handler:function(){
				        	//获得选中的行对象
				        	 var rows = $("#mytable").datagrid("getSelections") ;
				        	 if(rows.length == 1){
				        		 var row = rows[0] ;
				        		 //获得指定行的索引
				        		 myIndex = $("#mytable").datagrid("getRowIndex",row) ;
				        	 }
				        	 $("#mytable").datagrid("deleteRow",myIndex) ;
				        	 //删除之后触发事件
				        	 $.post() ;
				         }},
				         {text:'修改',iconCls:'icon-edit',handler:function(){
				        	 //获得选中的行对象
				        	 var rows = $("#mytable").datagrid("getSelections") ;
				        	 if(rows.length == 1){
				        		 var row = rows[0] ;
				        		 //获得指定行的索引
				        		 myIndex = $("#mytable").datagrid("getRowIndex",row) ;
				        	 }
				        	 $("#mytable").datagrid("beginEdit",myIndex) ;
				         }},
				         {text:'保存',iconCls:'icon-save',handler:function(){
				        	 $("#mytable").datagrid("endEdit",myIndex) ;
				         }}
				         ],
				//分页条
				pagination:true,
				//结束编辑事件
				onAfterEdit:function(index,data,changes){
					$.post() ;
				}
			}) ;
		}) ;
	</script>
</body>