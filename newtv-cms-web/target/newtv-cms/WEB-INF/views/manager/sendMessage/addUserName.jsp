<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>节目集管理</title>
<style type="text/css">
ul.rightTools {
	float: right;
	display: block;
}

ul.rightTools li {
	float: left;
	display: block;
	margin-left: 5px
}
</style>
<script type="text/javascript">
	var uid = 0;
	//只能选中一个值;  
	function get_onclick(obj) {
		uid = obj.value;
		var chk = document.getElementsByName("ids");
		for ( var i = 0; i < chk.length; i++) {
			chk[i].checked = false;
		}
		obj.checked = true;
	}
</script>
</head>
<body>
	<form id="pagerForm" method="post"
		action="sendMessage/getUserLoginNameList?type=${type}">
		<input type="hidden" name="type" value="${type}" /> <input
			type="hidden" name="value" value="${value}" /> <input type="hidden"
			name="key" value="${key}" /> <input type="hidden" name="pageNum"
			value="1" /> <input type="hidden" name="numPerPage"
			value="${numPerPage}" /> <input type="hidden"
			name="search_LIKE_loginName" value="${param.search_LIKE_loginName}" /><input
			type="hidden" name="search_LIKE_name"
			value="${param.search_LIKE_name}" /> <input type="hidden"
			name="search_LIKE_roles" value="${param.search_LIKE_roles}" /> <input
			type="hidden" name="search_LIKE_platformName"
			value="${param.search_LIKE_platformName}" /> <input type="hidden"
			name="ids" checked=true value="" /> <input type="hidden"
			name="search_EQ_bzprocess" value="${param.search_EQ_bzprocess}" />
	</form>
	<div class="pageHeader">
		<form id="userForm" onsubmit="return dialogSearch(this);"
			action="sendMessage/getUserLoginNameList?type=${type}" method="post">
			<div class="searchBar" style="width: 70%">
				<table class="searchContent">
					<tr>
						<td><select class="combox" name="key">
								<option value="search_LIKE_loginName">登陆名</option>
								<option value="search_LIKE_name">用户名</option>
								<option value="search_LIKE_roles">用户角色</option>
								<option value="search_LIKE_platformName">平台名称</option>
						</select></td>
						<td><input type="text" name="value" value="${value}" /></td>
						<td>
							<div class="subBar">
								<ul>
									<li><div class="buttonActive">
											<div class="buttonContent">
												<button type="submit">检索</button>
											</div>
										</div></li>
									<li><div class="button">
											<div class="buttonContent">
												<button type="button" multLookup="ids">选择带回</button>
											</div>
										</div></li>
								</ul>
							</div>
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>

	<table id="currentTable" class="table" width="99%" layoutH="140">
		<thead>
			<tr>
				<!-- <th width="10px"><input type="checkbox" group="ids"
					class="checkboxCtrl"></th> -->
				<th></th>
				<th>登录名</th>
				<th>用户名</th>
				<th>用户角色</th>
				<th>平台名称</th>
			</tr>
		</thead>
		<tbody id="ce">
			<c:forEach items="${users}" var="user">
				<td><input name="ids" id="back" 
				<c:if test="${type ne 1}">
					onclick="get_onclick(this)"
				</c:if>			
				type="checkbox"
					<c:if test="${type==1}">
							value="{receiverCodes:'${user.loginName}'}"
						</c:if>>
				</td>
				<td>${user.loginName}</td>
				<td>${user.name}</td>
				<td>${user.roles}</td>
				<td>${user.platform.platformName}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="panelBar">
		<div class="pages">
			<span>显示</span> <select class="combox" id="numPerPage"
				name="numPerPage"
				onchange="dialogPageBreak({numPerPage:this.value})">
				<c:choose>
					<c:when test="${type eq 1}">
						<option value ="${numPerPage}" selected>${numPerPage}</option>
					</c:when>
					<c:otherwise>
						<option value="20" <c:if test="${numPerPage==20}">selected</c:if>>20</option>
						<option value="50" <c:if test="${numPerPage==50}">selected</c:if>>50</option>
						<option value="100" <c:if test="${numPerPage==100}">selected</c:if>>100</option>
					</c:otherwise>
				</c:choose>
			</select> <span>条，共${totalCount}条</span>
		</div>
		<div id="pagination" class="pagination" totalCount="${totalCount}"
			targetType="dialog" numPerPage="${numPerPage}" pageNumShown="5"
			currentPage="${pageNum}"></div>
	</div>


</body>
</html>
