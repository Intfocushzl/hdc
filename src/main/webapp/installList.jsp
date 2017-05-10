<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
		<meta content="yes" name="apple-mobile-web-app-capable" />
		<meta content="telephone=no" name="format-detection" />
		<meta name="browsermode" content="application">
		<meta name="renderer" content="webkit">
<%@include file="/common/taglibs.jsp"%>
<script type="text/javascript" >
    var ctx = "${ctx}";	
</script>
<title>数据通上报</title>
		<link rel="stylesheet" type="text/css" href="${ctx}/casher/css/global.css"/>
		<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
		<script src="${ctx}/casher/js/global.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="${ctx}/js/comUtil.js"></script>  
</head>
<body>
		<!-- 选择项目名称 -->
		<div  class="i-itemName">
			<div class="i-itemName-name">项目名称</div>
			<div class="i-itemName-list">
				<div id="itemName" data-select="" onclick="app.select(this,3,Window.selected)" placeholder ="请选择项目" ></div>
			</div>
		</div>
		<!-- 项目状态 -->
		<div class="i-itemStyle">
			<div class="i-itemStyle-title"></div>
			<div class="i-itemStyle-list">
<!-- 				<div>
					<p>项目经理</p>
					<p>张三</p>
					<p>项目版本</p>
					<p>1.3</p>
				</div>
				<div>
					<p>项目状态</p>
					<p>维护</p>
					<p>更新时间</p>
					<p>2017.2.27</p>
				</div> -->
			</div>
		</div>
		<!-- 搜索 -->
		<div class="i-itemSeek">
			<input type="text" id="middle" />
			<div></div>
		</div>
		<!-- 2个下拉 -->
		<div class="i-itemXl">		
			<div class="i-itemXl-list">
				<div id="eqType" data-select="" onclick="app.select(this,1,equipmentTypeSeach)"></div>
			</div>
			<div class="i-itemXl-list">
				<div data-select=""  id = "installState" onclick="app.select(this,1,shopStateSeach)"></div>
			</div>
		</div>
		<!-- 项目详情 -->
		<div class="i-itemDetail">
			<div class="i-itemDetail-area">

			</div>
	
		</div>
		<!-- 新建抄表 -->
		<div class="i-addTable">
			<div class="icon"></div>
			<div class="text" id = 'create'><a href="javascript:void(0)"  onClick = "gotoDetail()"target="_self">新建抄表</a></div>
		</div>

		
		<script type="text/javascript">
		 var gotoDetail =  function(){
				location.href = ctx + "/installDetails.jsp";
			} 
			$(function(){
			//	comboboxForProState();
				//comboboxForEqType();
				
				
				

				
				 $.ajax({ 
				 		url:ctx + '/project/getSome',
				 		type:'get',
						data:{
								},
				 		dataType:'json',
				 		success:function(rs){
			/* 	  			 alert(JSON.stringify(rs)); */
							 var str = '';
							 var i = 0 ;
				  			 $.each(rs,function(index,item){
				  				 
				  				 if(0  == i){
				  					 i++;
				  					 str = str + item.proName;
				  				 }else{
				  					 str = str + ","+item.proName;
				  				 }
				  				 
				  			 });
					  			$('#itemName').attr("data-select",str);
					  			shopStateSeach();
				 		},
				  		error:function(rs){
				 		}
				  });	
				 $.ajax({ 
				 		url:ctx + '/project/getSome',
				 		type:'get',
						data:{
							isLast:1
								},
				 		dataType:'json',
				 		success:function(rs){
								
				 			//加载最后一次选择的项目信息
				 			 $(".i-itemStyle-title").html(rs[0].proName);
				 			$('#itemName').html(rs[0].proName);
							$('.i-itemStyle-list').html(
									"				<div>" +
									"					<p>项目经理</p>" +
									"					<p>"+rs[0].proManagerPro+"</p>" +
									"					<p>项目版本</p>" +
									"					<p>"+rs[0].proEdition+"</p>" +
									"				</div>" +
									"				<div>" +
									"					<p>项目状态</p>" +
									"					<p>"+rs[0].proStation+"</p>" +
									"					<p>更新时间</p>" +
									"					<p>"+rs[0].updatedAt+"</p>" +
									"				</div>"
							);
				  			shopStateSeach();
				 		},
				  		error:function(rs){
				 		}
				  });			 
				 
				 
				Window.selected=function(){

					 
					$.ajax({
						url:ctx+"/project/setLast",
						type:'get',
						data:{
							"proName": $('#itemName').html()
						},
						dataType:'json',
						success:function(rs){
							shopStateSeach();
						},
				  		error:function(rs){
				 		}
					});
					
					 $(".i-itemStyle-title").html($('#itemName').html());
					 $.ajax({ 
					 		url:ctx + '/project/getSome',
					 		type:'get',
							data:{
										"proName": $('#itemName').html()
									},
					 		dataType:'json',
					 		success:function(rs){
								 var str = '';
								 var i = 0 ;
					  			 $.each(rs,function(index,item){
					  				 
									$('.i-itemStyle-list').html(
											"				<div>" +
											"					<p>项目经理</p>" +
											"					<p>"+item.proManagerPro+"</p>" +
											"					<p>项目版本</p>" +
											"					<p>"+item.proEdition+"</p>" +
											"				</div>" +
											"				<div>" +
											"					<p>项目状态</p>" +
											"					<p>"+item.proStation+"</p>" +
											"					<p>更新时间</p>" +
											"					<p>"+item.updatedAt+"</p>" +
											"				</div>"
		
									);
					  				 
					  			 });

					 		},
					  		error:function(rs){
					 		}
					  });
				};
				/*
				 *	弹窗的使用方法  代码在global.js  app.alert
				*/
				//临时的方法 测试弹窗用
				//function ls(){
				//	alert("点了弹窗按钮");
				//}
				//app.alert("确定要退出吗？")			//只有确定按钮  		点击后关闭弹窗不执行任何操作		
				//app.alert("确定要退出吗？",2)			//有确定取消按钮  	点击2个按钮关闭弹窗都不执行任何操作
				//app.alert("确定要退出吗？",1,ls)		//只有确定按钮		点击后关闭弹窗并执行方法
				//app.alert("确定要退出吗？",2,ls)		//有确定取消按钮		点击确定关闭弹窗执行方法	点击取消弹窗关闭不执行方法
			})

</script>
		<script src="${ctx}/js/install.js" type="text/javascript" charset="utf-8"></script>

</body>
</html>