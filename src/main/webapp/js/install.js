/**
 * 
 */
 loadCombobox("installState","install");			
 loadCombobox("eqType","equipment_type");					

$('#middle').bind('click',function(){
	shopStateSeach();
	 
});

var shopStateSeach = function(){
	var shopSta = '';
	 $.ajax({ 
	 		url:ctx + '/shops/getSome',
	 		type:'get',
			data:{
				"proId":$('#itemName').html(),
				'shopName':$('#middle').val(),
				"installStation":delAll('installState' ),
				"eqType":delAll('eqType')
			},
	 		dataType:'json',
	 		success:function(rs){
 				$('.i-itemDetail-area').html('');
	 			$.each(rs,function(index,item){
	 				
	 				if("无需安装" == item.installStation){
	 					shopSta = 'on1';
	 				}else if("已安装" == item.installStation){
	 					shopSta = 'on2';
	 				}else if("安装失败" == item.installStation){
	 					shopSta = 'on3';
	 				}else if("未安装" == item.installStation){
	 					shopSta = 'on4';
	 				}else if("未开业" == item.installStation){
	 					shopSta = 'on5';
	 				}else if("已拆除" == item.installStation){
	 					shopSta = 'on6';
	 				}

	 				$('.i-itemDetail-area').append(
	 						"				<div class='i-itemDetail-area-title'>" +
	 						"					<div>"+item.shopName+"("+item.shopPosition+")</div>" +
	 						(undefined == item.installId ? "" : "					<p><a href = 'javascript:void(0)' onClick='gotoModify("+item.installId+")' target='_self'>详情</a></p>")
	 						 +
	 						"				</div>" +
	 						"				<div class='i-itemDetail-area-content'>" +
	 						"					<div class='content-row'>" +
	 						"						<p>采集点编号</p>" +
	 						"						<p>"+item.eqId+"</p>" +
	 						"						<!-- i标签 on1无需安装   on2已安装   on3安装失败  on4未安装   on5未开业  on6已拆除 -->" +
	 						"						<p><i class='"+shopSta+"'></i>"+item.installStation+"</p>" +
	 						"					</div>" +
	 						"					<div class='content-row'>" +
	 						"						<p>采集接口类型</p>" +
	 						"						<p>"+(undefined == item.eqType?"":item.eqType)+"</p>" +
	 						"					</div>" +
//	 						"					<div class='content-row'>" +
//	 						"						<p>收银机操作系统</p>" +
//	 						"						<p>"+(undefined == item.cashSystem?"":item.cashSystem)+"</p>" +
//	 						"					</div>" +
	 						"				</div>"
	 					
	 				);	
	 			});
	 		},
	  		error:function(rs){
	 		}
	  });	
}

var equipmentTypeSeach = function(){
	shopStateSeach();
}
var gotoModify = function(link){
	location.href = ctx + "/install/gotoModify?installId=" +link;
}


