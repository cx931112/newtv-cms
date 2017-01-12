<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>操作日志</title>
<script type="text/javascript">

</script>
</head>
<body>
	<div class="pageContent">
		<form>
			<input type="hidden" name="logId" value="${operationLog.logId}" />
			<div class="pageFormContent" layoutH="56">
				<p>
					<label>日志记录时间：</label> <input name="logTime" 
						type="text" size="30" 
						value="${operationLog.logTime}" readOnly/>
				</p>
				<p>
					<label>操作数据主键：</label> <input name="oprDataId" 
						type="text" size="30" 
						value="${operationLog.oprDataId}" readOnly/>
				</p>
				<p>
					<label>操作数据类型：</label> <input name="oprDataType"
						type="text" size="30" 
						value="${operationLog.oprDataType}" readOnly/>
				</p>
				<p>
					<label>操作类型：</label> <input name="oprType"
						type="text" size="30" 
						value="${operationLog.oprType}" readOnly/>
				</p>
				<p>
					<label>操作用户ID：</label> <input name="oprUserId"
						type="text" size="30" 
						value="${operationLog.oprUserId}" readOnly/>
				</p>
				<p>
					<label>操作用户名称：</label> <input name="oprUserName"
						type="text" size="30" 
						value="${operationLog.oprUserName}" readOnly/>
				</p>
				<p style="width:90%">
					<label>日志内容：</label> <textarea id="logContent" name="logContent" 
						type="text" size="100" cols="90" rows="5"
						  readOnly>${operationLog.logContent}</textarea>
				</p>
			</div>
			<div class="formBar">
				<ul>
						<div class="button">
							<div class="buttonContent">
								<button type="button" class="close">确定</button>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</form>
	</div>
</body>
</html>