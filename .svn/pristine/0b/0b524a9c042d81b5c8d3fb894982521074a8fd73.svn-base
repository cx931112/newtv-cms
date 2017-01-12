<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>审核意见</title>
<script type="text/javascript">
	function auditStatus(value) {
		if ("1" == value) {
			$('#auditDesc').val('通过');
		} else {
			$('#auditDesc').val('不通过');
		}
	}
</script>
</head>
<body>
	<div class="pageContent">
		<form id="pagerForm" name="pagerForm" class="pageForm required-validate" 
			method="post" action="program/auditSubmit"
			onsubmit="return validateCallback(this, dialogAjaxDone);">
			<div class="pageFormContent" layoutH="56" style="padding: 10px 20px !important">
				<input name="ids" type="hidden" value="${ids}" />
				<p>
					<label>审核状态：</label>
					<input type="radio" name="status" value="1" onclick="auditStatus(this.value)" checked="checked" />通过
					<input type="radio" name="status" value="0" onclick="auditStatus(this.value)" />不通过
				</p>
				<p>
					<label>审核意见：</label>
					<textarea id="auditDesc" maxlength="1024" class="required" name="auditDesc" cols="50" rows="2">通过</textarea>
				</p>
			</div>
			<div class="formBar">
				<ul>
					<li>
						<div class="buttonActive">
							<div class="buttonContent">
								<button type="submit">确定</button>
							</div>
						</div>
					</li>
					<li>
						<div class="button">
							<div class="buttonContent">
								<button type="button" class="close">返回</button>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</form>
	</div>
</body>
</html>