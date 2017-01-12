<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script>
	jQuery.extend(jQuery.validator.messages, {
		remote : "该平台ID已存在,请修改",
	});
	$(document).ready(function() {
		var id = $("input[name='platformId']").val();
		if (null == id || "" == id) {
			id = -100;
		}
		$("#serverId").click(function() {
			$("#serverId").attr("remote", "platform/validate/" + id);
		});
	});
</script>
</head>
<body>
	<div class="pageContent">
		<form id="platform" name="platform" method="post"
			action="platform/saveInfo" class="pageForm required-validate"
			onsubmit="return validateCallback(this, dialogAjaxDone);">
			<input type="hidden" name="platformId" value="${platform.platformId}" />
			<div class="pageFormContent" layoutH="56">
				<p>
					<label>平台ID：</label> <input id="serverId" name="serverId"
						class="required" placeholder="请输入平台serverId" type="text" size="30"
						value="${platform.serverId}" remote="platform/validate/"  maxlength="30"/>
				</p>
				<p>
					<label>平台名称：</label> <input name="platformName" class="required"
						placeholder="请输入平台名称" type="text" size="30"
						value="${platform.platformName}" maxlength="30"/>
				</p>
				<p style="width: 90% !important">
					<label>内容提供商编码: </label>
					<c:forEach items="${dicList}" var="dic">
						<c:set var="cpCodes" value="${platform.cpCodes}" />
						<c:set var="code" value="${dic.name}" />
						<input type="checkbox" name="cpCodes" value="${dic.name}"
							<c:if test="${fn:contains(cpCodes, code)}">checked</c:if>>${dic.name}</input>
					</c:forEach>

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
