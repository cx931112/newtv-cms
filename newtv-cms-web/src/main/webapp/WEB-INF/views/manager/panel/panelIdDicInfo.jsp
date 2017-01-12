<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script>
	jQuery.extend(jQuery.validator.messages, {
		remote : "该屏代码已存在,请修改",
	});
	$(document).ready(function() {
		$("#panelMark").click(function() {
			$("#panelMark").attr("remote", "panelConfig/validate/");
		});
		
		//修改页面，只能修改面板名称，其他都只读
		var isEditable = ${isEditable};
		if(isEditable){
			$("form input[name='panelMark']").prop("readonly",true);
			$("form select").prop("disabled", "disabled");
		}
	}); 
</script>
</head>
<body>
	<div class="pageContent">
		<form id="panelIdDic" name="panelIdDic" method="post"
			action="panelConfig/save" class="pageForm required-validate"
			onsubmit="return validateCallback(this, dialogAjaxDone);">
			<input type="hidden" name="platformId" value="${panelIdDic.platformId}" />
			<div class="pageFormContent" layoutH="56">
				<p>
					<label>面板名称：</label> <input name="markName" 
						class="required" placeholder="请输入面板名称" type="text" style="width:175px;"
						value="${panelIdDic.markName}" />
				</p>
				<p>
					<label>屏代码：</label> <input name="panelMark" id="panelMark" class="required"
						placeholder="请输入屏代码" type="text" style="width:175px;"
						value="${panelIdDic.panelMark}" />
				</p>
				<p style="width: 90% !important">
					<label>是否为组合: </label>
					<select id="isCombined" name="isCombined" required>
						<option value="0"
							<c:if test="${panelIdDic.isCombined==0}">selected</c:if>>非组合</option>
						<option value="1"
							<c:if test="${panelIdDic.isCombined==1}">selected</c:if>>组合</option>
					</select>
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
