<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script>
	//模板类型为专题模板 分类模板值改变处理
	function definitionTypeOtherChange() {
		var definitionTypeOther = $("#definitionTypeOther").val();
		$("#definitionType").val(definitionTypeOther);
	}
	//模板类型为第三方推荐模板 分类模板值改变处理
	function definitionTypeThirdChange() {
		var definitionTypeThird = $("#definitionTypeThird").val();
		$("#definitionType").val(definitionTypeThird);
	}
	//模板类型改变时
	function preview_changeType(type){
		var templateType = $("#templateType").val();
		console.log(templateType);
		if( '-1' != type ){
			templateType = type;
		}
	    if(2 == templateType){
	    	$("#definitionTypeOther").addClass('required');
	    	$("#preivew_definition_type").css("display","block");
	    	$("#preivew_definition_type_third").css("display","none");
	    	$("#definitionTypeThird").removeClass('required');
	    }else if(3 == templateType){
	    	$("#definitionTypeThird").addClass('required');
	    	$("#preivew_definition_type_third").css("display","block");
	    	$("#preivew_definition_type").css("display","none");
	    	$("#definitionType").removeClass('required');
	    }else {
	    	$("#preivew_definition_type").css("display","none");
	    	$("#preivew_definition_type_third").css("display","none");
	    	$("#definitionType").val("${template.definitionType}");
	    	$("#definitionTypeOther").removeClass('required');
	    	$("#definitionTypeThird").removeClass('required');
	    }
	}
	$(function(){
		var type = $("#check_templateType").val();
		preview_changeType(type);
	})
</script>
</head>
<body>
	<div class="pageContent">
		<form id="previewTemplate" name="previewTemplate" method="post" action="previewTemplate/saveTemplateInfo" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
			<input type="hidden" name="templateId" value="${templateId}" />
			<input type="hidden" name="isDefault" value="${template.isDefault}" />
			<input type="hidden" id="check_templateType" value="${template.templateType}" />
			<div class="pageFormContent" layoutH="56">
				<p>
					<label>模板名称：</label>
					<input name="name" class="required" placeholder="请输入模板名称" type="text" style="width:175px;" value="${template.name}" />
				</p>
				<p>
					<label>模板描述：</label>
					<input name="description" class="required" placeholder="请输入模板描述" type="text" style="width:175px;" value="${template.description}" />
				</p>
				<p>
					<label>预览地址：</label>
					<input name="htmlUrl" placeholder="请输入预览地址" type="text" style="width:175px;" value="${template.htmlUrl}" />
				</p>
				<p>
					<label>模板类型：</label>
					<select name="templateType" id="templateType" class="combox required" onchange="preview_changeType(-1)" selectDisabled="false" remoteUrl="sysMenu/getSystemDicByType?type=TEMPLATE_TP_TYPE" defaultVal="${template.templateType}"></select>
				</p>
				
				<!-- 针对不同的模板类型加载不同的分类模板 -->
				<!-- 模板类型为专题模板 -->
				<p id="preivew_definition_type" style="display:none">
					<label>分类模板：</label>
					<select onchange="definitionTypeOtherChange()" name="definitionTypeOther" class="combox" remoteUrl="sysMenu/getSystemDicByType?type=TOPIC_PREVIEW_TEMPLATE" selectDisabled="false" id="definitionTypeOther" defaultVal="${template.definitionType}"></select>
				</p>
				<!-- 模板类型为第三方推荐 -->
				<p id="preivew_definition_type_third" style="display: none;">
					<label>分类模板：</label>
					<select onchange="definitionTypeThirdChange()" name="definitionTypeThird" class="combox" remoteUrl="sysMenu/getSystemDicByType?type=RECOMMEND_PREVIEW_TEMPLATE" selectDisabled="false" id="definitionTypeThird" defaultVal="${template.definitionType}"></select>
				</p>
				<!-- 用于接收分类模板的值 -->
				<input type="hidden" id="definitionType" name="definitionType" value="${template.definitionType}" />
				
				<p>
					<label>是否包含节目集信息：</label>
					<select name="containPs" class="combox" selectDisabled="false">
						<option value="0" <c:if test="${template.containPs==0 }">selected</c:if>>否</option>
						<option value="1" <c:if test="${template.containPs==1 }">selected</c:if>>是</option>
					</select>
				</p>
				<p>
					<label>所属平台：</label>
					<select name="platformId" class="combox required" selectDisabled="false" remoteUrl="previewTemplate/getPlatformList" defaultVal="${template.platformId}"></select>
				</p>
			</div>
			<div class="formBar">
				<ul>
					<li><div class="buttonActive">
							<div class="buttonContent">
								<button type="submit">保存</button>
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
