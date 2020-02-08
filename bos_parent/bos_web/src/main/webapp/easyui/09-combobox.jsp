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
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.ocupload-1.1.2.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
	<!-- <select class="easyui-combobox">
		<option>关羽</option>
		<option>张飞</option>
		<option>赵云</option>
		<option>马超</option>
		<option>黄忠</option>
	</select> -->
	<!-- 动态加载下拉框 -->
	<input class="easyui-combobox" data-options="url:'${ pageContext.request.contextPath }/json/combobox_data.json',valueField:'id',textField:'name',editable:false" />
</body>