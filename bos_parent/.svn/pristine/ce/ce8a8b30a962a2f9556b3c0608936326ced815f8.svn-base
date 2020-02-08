<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>highcharts</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/highcharts/highcharts.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/highcharts/modules/exporting.js"></script>
<script type="text/javascript">
	$(function(){
		//页面加载完成之后，动态创建图表
		$("#test").highcharts({
			chart: {
				plotBackgroundColor: null,
				plotBorderWidth: null,
				plotShadow: false,
				type: 'pie'
			},
			title: {
				text: '2018年1月浏览器市场份额'
			},
			tooltip: {
				pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
			},
			plotOptions: {
				pie: {
					allowPointSelect: true,
					cursor: 'pointer',
					dataLabels: {
						enabled: true,
						format: '<b>{point.name}</b>: {point.percentage:.1f} %',
						style: {
							color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
						}
					}
				}
			},
			series: [{
				name: 'Brands',
				colorByPoint: true,
				data: [{
					name: 'Chrome',
					y: 61.41,
					sliced: true,
					selected: true
				}, {
					name: 'Internet Explorer',
					y: 11.84
				}, {
					name: 'Firefox',
					y: 10.85
				}, {
					name: 'Edge',
					y: 4.67
				}, {
					name: 'Safari',
					y: 4.18
				}, {
					name: 'Sogou Explorer',
					y: 1.64
				}, {
					name: 'Opera',
					y: 1.6
				}, {
					name: 'QQ',
					y: 1.2
				}, {
					name: 'Other',
					y: 2.61
				}]
			}]
		}) ;
	});
</script>
</head>
<body>
	<div id="test"></div>
</body>
</html>