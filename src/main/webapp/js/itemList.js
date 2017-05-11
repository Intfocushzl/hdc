/**
 * 
 */
$(function(){
	search();
	$.ajax({
		url:ctx+'/project/getCount',
		type:'get',
		dataType:'json',
		success:function(rs){
			
			$('.i-itemStyle-list').html('');	
			$.each(rs,function(index,item){
				if('all' == item.count_type){
					$('.i-itemStyle-list').append(
							"				<div>" +
							"					<p>合计项目</p>" +
							"					<p>"+item.pro_count+"</p>" +
							"				</div>"
					);	
				}else if('实施' == item.count_type){
					$('.i-itemStyle-list').append(
							"				<div>" +
							"					<p>实施项目</p>" +
							"					<p>"+item.pro_count+"</p>" +
							"				</div>"
					);	
				}else if('待启动' == item.count_type){
					$('.i-itemStyle-list').append(
							"				<div>" +
							"					<p>待启动项目</p>" +
							"					<p>"+item.pro_count+"</p>" +
							"				</div>"
					);	
				}else if('维护' == item.count_type){
					$('.i-itemStyle-list').append(
							"				<div>" +
							"					<p>维护项目</p>" +
							"					<p>"+item.pro_count+"</p>" +
							"				</div>"	
					);	
				}else if('停止' == item.count_type){
					$('.i-itemStyle-list').append(
							"				<div>" +
							"					<p>停止项目</p>" +
							"					<p>"+item.pro_count+"</p>" +
							"				</div>"	
					);	
				}
			});
			
		},
		error:function(rs){
			
		}
	});
})

var search = function(){
	 $.ajax({ 
	 		url:ctx + '/project/getSome',
	 		type:'get',
			data:{
					proName:$('#proName').val()
					},
	 		dataType:'json',
	 		success:function(rs){

				 $('.i-itemDetail').html('');
	  			 $.each(rs,function(index,item){
	  				 $('.i-itemDetail').append(
	  						 "			<div class='i-itemDetail-area'>" +
	  						 "<div class='i-itemDetail-area-title'>" +
	  						"					<div>"+item.proName+"</div>" +
	  						"					<p><a href='javascript:void(0)' onclick='gotoModify(\""+item.proId+"\")'>详情</a></p>" +
	  						"				</div>"+
	  						 "<div class='i-itemDetail-area-content'>"+
	  						"					<div class='content-row'>" +
	  						"						<p>项目经理</p>" +
	  						"						<p>"+item.proManagerPro+"</p>" +
	  						"					</div>" +
	  						"					<div class='content-row'>" +
	  						"						<p>项目状态</p>" +
	  						"						<p>"+item.proStation+"</p>" +
	  						"					</div>" +
	  						"					<div class='content-row'>" +
	  						"						<p>项目状态</p>" +
	  						"						<p>"+item.updatedAt+"</p>" +
	  						"					</div>" +
	  						"</div>"+
	  						"</div>"
	  				 );

	  			 });

	 		},
	  		error:function(rs){
	 		}
});	
}


function gotoModify(proId){
	location.href = ctx + '/project/gotoModify?proId=' + proId;
}

function create(){
	location.href = ctx + "/itemDetails.jsp";	
}