<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<style type="">
.combox {
	width: 53px;
}
.uploadify-queue {
	margin-bottom: 1em;
	width:50px;
}
.uploadify-queue-item {
	background-color: #F5F5F5;
	font: 1px Verdana, Geneva, sans-serif;
	margin-left: -20px !important;
	max-width: 35px;
	padding: 0px !important;
	height: 0px !important;
}
.uploadify {
position: relative;
height :10px !important;
}
</style>
<script type="text/javascript">
	$(function() {
		// 是否显示 
		var containPs = $("#containPs", $.pdialog.getCurrent()).val();
		if (null != containPs && containPs == 0) {
			$("#programSer", $.pdialog.getCurrent()).css("display", "none");
		}
		$("#previewForm ", $.pdialog.getCurrent()).validate(
				{
					rules : {

					// Age: { required: true ,number:true,min:1,max:100 }
					},
					messages : {
						dataType : {
							required : '<选择类型>中有未选择类型的项,请选择',
						},
						dataKey : {
							required : '<属性key>  中有未填写的项,请填写',
						},
						sortNum : {
							required : '<属性排序> 中有未填写的项,请填写',
						},
						dataValue : {
							required : '<属性value>中有未填写的项,请填写',
						},
						psDataType : {
							required : '<选择类型>中有未选择类型的项,请选择',
						},
						psDataKey : {
							required : '<属性key>中有未填写的项,请填写',
						},
						psSortNum : {
							required : '<属性排序>中有未填写的项,请填写',
						},
						psDataValue : {
							required : '<属性value>中有未填写的项,请填写',
						},
					},
					/*错误提示位置*/
					errorPlacement : function(error, element) {
						// 只显示其中一条 error信息
						error.insertAfter(
								$(".itemDetail", $.pdialog.getCurrent())).css(
								"width", "auto");
					}
				});
	});
	function changeUploadStyle(value, fileId) {
		$("div >span[for='dataType']").remove();
		var fileId1 = 'preview_templateDatafile_' + fileId;
		var fileId2 = 'preview_templateDataP_' + fileId;
		if (2 == value) {
			// 显示 上传按钮
			$("#" + fileId2).show();
			uploadController(fileId1, "id", fileId,'previewData_submitId');
		} else {
			// 隐藏 上传按钮
			$("#" + fileId2).hide();
		}
	}
	function changeStyle(option, value) {

		var fileId = randomVar();
		var fileId1 = 'preview_templateDatafile_' + fileId;
		var fileId2 = 'preview_templateDataP_' + fileId;
		$(option).parent().parent().parent().next().next().children('input')
				.attr('id', fileId);
		$(option).parent().parent().parent().next().next().children('p').attr(
				'id', fileId2);
		$(option).parent().parent().parent().next().next().children('p')
				.children('input').attr('id', fileId1);
		changeUploadStyle(value, fileId);
	}

	function randomVar() {
		var x = 10000000000;
		var y = 1;
		var rand = String.fromCharCode(Math.floor(Math.random() * 26)
				+ "a".charCodeAt(0))
				+ parseInt(Math.random() * (x - y + 1) + y)
				+ String.fromCharCode(Math.floor(Math.random() * 26)
						+ "a".charCodeAt(0));
		return rand;
	}
	function valiPreviewData(vl){
		if(vl==1){
			return false;
		}
		var v = true;
		 $("a[name='dataType'] ,a[name='psDataType'] ").each(function(){
			if($(this).text()=='请选择'){
				$(this).css("color", " #F80C11"); 	
				var error ='<span for="dataType" class="error" style="width: auto;">&lt;选择类型&gt;中有选择的项,请选择</span>';
				$(error).insertAfter($(".itemDetail" , $.pdialog.getCurrent())).css("width", "auto");
	            v =false;  
	            return false;
				
			}else {
				$(this).css("color", "black"); 	
				$("div").remove("span[for='dataType']");
				return true;
			}
			return v;
		});
		return v; 
	}
</script>
</head>
<body>
	<div class="pageContent">
		<form id="previewForm" name="previewForm" method="post"
			action="previewTemplate/saveTemplateData"
			class="pageForm required-validate"
			onsubmit="return validateCallback(this, dialogAjaxDone);">
			<input type="hidden" name="templateId" value="${template.templateId}" />
			<input type="hidden" id="containPs" value="${template.containPs}" />
			<div class="tabs" layoutH="45">
				<div class="tabsHeader">
					<div class="tabsHeaderContent">
						<ul>
							<li class="hover"><a href="javascript:;"><span>通用模板属性</span></a></li>
							<li id="programSer" class="hover"><a href="javascript:;"><span>节目集模板属性</span></a></li>
						</ul>
					</div>
				</div>
				<div class="tabsContent" style="height: 380px;">
					<div>
						<table class="list nowrap itemDetail" addButton="添加通用模板属性"
							width="100%">
							<thead>
								<tr>
									<th type="text" name="dataName" style="width:120px;">属性名称</th>
									<th type="enum"
										enumUrl="topic/getTemplateData?type=dataType&isPs=0"
										name="dataType" style="width:120px;">选择类型</th>
									<th type="enum"
										enumUrl="topic/getTemplateData?type=dataKey&isPs=0"
										name="dataKey" style="width:120px;">属性key</th>
									<th type="enum"
										enumUrl="topic/getTemplateData?type=dataValue&isPs=0"
										name="dataValue" style="width:240px;">属性value</th>
									<th type="enum" enumUrl="topic/getTemplateSortNum/0"
										name="sorNum" style="width:300px;">属性排序</th>
									<th type="del" width="50">操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="data" items="${dataList}" varStatus="dataId">
									<tr class="unitBox">
										<td><input type="text" name="dataName"
											value="${data.dataName}" style="width:120px;" /></td>

										<td><select name="dataType" class="combox required"
											onchange="changeUploadStyle(value,'${dataId.index}')"
											remoteUrl="sysMenu/getSystemDicByType?type=TEMPLATE_TYPE"
											defaultVal="${data.dataType}">
										</select></td>
										<td><input type="text" name="dataKey"
											value="${data.dataKey}" style="width:120px;" class="required"
											suggestfields="dataName,dataKey"  postfield="keyword"
											suggesturl="sysMenu/getSystemValueByType?type=TEMPLATE_DATA_KEY&containPs=0"
											autocomplete="off" style="cursor: auto;" /></td>
										<td><input type="text" name="dataValue"
											id="${dataId.index }" value="${data.dataValue}" style="width:165px;"
											class="textInput" />
											<p style="margin: -20px 0px 0px 180px; display: none"
												id="preview_templateDataP_${dataId.index}">
												<input id="preview_templateDatafile_${dataId.index}" type="file" />
											</p> <script>
												$(function() {
													var type = "${data.dataType}";
													if (null != type
															&& 2 == type) {
														// 显示 上传按钮
														$("#"+ 'preview_templateDataP_${dataId.index}').show();
														uploadController(
																'preview_templateDatafile_${dataId.index}',
																"id",
																'${dataId.index}','previewData_submitId');
													}
													;
												});
											</script></td>
										<td><input type="text" name="sortNum"
											  value="${data.sortNum}"
											class="number required"></input></td>
										<td><a href="javascript:void(0)" class="btnDel">删除</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div style="display: none;">
						<table class="list nowrap itemDetail" addButton="添加节目集属性"
							width="100%">
							<thead>
								<tr>
									<th type="text" name="psDataName" style="width:120px;">属性名称</th>
									<th type="enum"
										enumUrl="topic/getTemplateData?type=dataType&isPs=1"
										name="psDataType" style="width:120px;">选择类型</th>
									<th type="enum"
										enumUrl="topic/getTemplateData?type=dataKey&isPs=1"
										name="dataKey" style="width:120px;">属性key</th>
									<th type="enum"
										enumUrl="topic/getTemplateData?type=dataValue&isPs=1"
										name="psDataValue" style="width:240px;">属性value</th>
									<th type="enum" enumUrl="topic/getTemplateSortNum/1" style="width:300px;">属性排序</th>
									<th type="del" width="50">操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="psData" items="${psDataList}" varStatus="dataId">
									<tr class="unitBox">
										<td><input type="text" name="psDataName"
											value="${psData.dataName}" style="width:120px;"></input></td>
										<td><select name="psDataType" class="combox required"
											onchange="changeUploadStyle(value,'${dataId.index+50}')"
											remoteUrl="sysMenu/getSystemDicByType?type=TEMPLATE_TYPE"
											defaultVal="${psData.dataType}">
										</select></td>
										<td><input type="text" name="psDataKey"
											value="${psData.dataKey}" style="width:120px;" class="required" ></input></td>
										<td><input type="text" name="psDataValue"
											id="${dataId.index+50}" value="${psData.dataValue}" style="width:165px;"
											class="textInput"></input>
											<p style="margin: -20px 0px 0px 180px; display: none"
												id="preview_templateDataP_${dataId.index+50 }">
												<input id="preview_templateDatafile_${dataId.index+50 }" type="file" />
											</p> <script>
												$(function() {
													var type = "${psData.dataType}";
													if (null != type
															&& 2 == type) {
														// 显示 上传按钮
														$("#"+ 'preview_templateDataP_${dataId.index +50}').show();
														uploadController(
																'preview_templateDatafile_${dataId.index +50}',
																"id",
																'${dataId.index+50}','previewData_submitId');
													}
													;
												});
											</script></td>
										<td><input type="text" name="psSortNum"
											 value="${psData.sortNum}"
											class="number required"></input></td>
										<td><a href="javascript:void(0)" class="btnDel">删除</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="formBar">
				<ul>
					<li><div class="buttonActive">
							<div class="buttonContent">
								<button type="submit" onclick=" return valiPreviewData(2)" id='previewData_submitId'>保存</button>
							</div>
						</div></li>
					<li>
						<div class="button">
							<div class="buttonContent">
								<button type="button" class="close">取消</button>
							</div>
						</div>
					</li>
				</ul>
			</div>

		</form>
	</div>
</body>
</html>