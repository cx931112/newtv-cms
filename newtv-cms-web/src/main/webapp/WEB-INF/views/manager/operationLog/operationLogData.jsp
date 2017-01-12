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
						type="text" style="width:175px;"
						value="${operationLog.logTime}" readOnly/>
				</p>
				<p>
					<label>数据ID：</label> <input name="dataId" 
						type="text" style="width:175px;"
						value="${operationLog.dataId}" readOnly/>
				</p>
				<p>
					<label>操作ID：</label> 
					<c:if test="${operationLog.oprName==null}"><input name="oprId" 
						type="text" style="width:175px;"
						value="" readOnly/></c:if>
					<c:if test="${operationLog.oprName!=null}"><input name="oprId" 
						type="text" style="width:175px;"
						value="${operationLog.oprId}" readOnly/></c:if>
				</p>
				<p>
					<label>操作名称：</label> <input name="oprType"
						type="text" style="width:175px;"
						value="${operationLog.oprType}" readOnly/>
				</p>
				<p>
					<label>操作用户ID：</label> <input name="oprUserId"
						type="text" style="width:175px;"
						value="${operationLog.oprUserId}" readOnly/>
				</p>
				<p>
					<label>操作用户名称：</label> <input name="oprUserName"
						type="text" style="width:175px;"
						value="${operationLog.oprUserName}" readOnly/>
				</p>
				<p>
					<label>操作用户类型：</label> <input name="oprUserType"
						type="text" style="width:175px;"
						value="${operationLog.oprUserType}" readOnly/>
				</p>
				<p>
					<label>操作用户IP：</label> <input name="oprUserIp"
						type="text" style="width:175px;"
						value="${operationLog.oprUserIp}" readOnly/>
				</p>
				<p style="width:90%">
					<label>日志内容：</label> <textarea id="logContent" name="logContent" 
						type="text"  style="width:75%; min-height:100px;resize:none;overflow-y:visible"
						  readOnly disabled>${operationLog.logContent}</textarea>
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