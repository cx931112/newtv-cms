<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<style type="text/css">
span.error {
	display: block;
	overflow: hidden;
	width: 65px;
	height: 21px;
	padding: 0 3px;
	line-height: 21px;
	background: #F00;
	color: #FFF;
	position: absolute;
	top: 5px;
	left: 218px;
}
</style>

<script type="text/javascript">
	$(function() {
		// 节目集属性数据是否显示
		var containPs = $("#contain", $.pdialog.getCurrent()).val();
		if (null != containPs && 0 == containPs) {
			$("#common", $.pdialog.getCurrent()).css("display", "none");
		}
	});
</script>
</head>
<body>
	<div class="pageContent">
		<form id="FirmForm" name="FirmForm" method="post"
			action="previewTemplate/savePreviewItem" class="pageForm required-validate"
			onsubmit="return validateCallback(this, dialogAjaxDone);">
			<input type="hidden" name="ioid" id="ioid" value="${item.ioid}" /> <input
				type="hidden" id="templateId" name="templateId" value="${template.templateId}" />  
			<div class="pageFormContent" layoutH="50">
				<p>
					<label>高度：</label><select name="itemHeight" class="combox required" ref="itemWidth"
						selectDisabled="false"
						remoteUrl="sysMenu/getSystemDicByType?type=TEMPLATE_SIZE1_1"
						refUrl="sysMenu/getSystemDicByType?type=TEMPLATE_SIZE1_1_{value}"
						defaultVal="${item.itemHeight}"></select>
				</p>
				<p>
					<label>宽度：</label><select name="itemWidth" class="combox required"
						selectDisabled="false" id="itemWidth"
						defaultVal="${item.itemWidth}"></select>
				</p>
				<p>
					<label>排序号</label> <input name="sortNum" type="number"  style="width:60px; margin-left: 2px;"
						value="${sort}" readOnly/>
				</p>
			</div>

			<div class="formBar">
				<ul>
					<li><div class="buttonActive">
							<div class="buttonContent">
								<button type="submit" onclick="vali()">保存</button>
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
			<script type="text/javascript">
				
			</script>

		</form>
	</div>
</body>
</html>
