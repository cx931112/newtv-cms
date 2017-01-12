<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="dt" uri="/dictionary" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>内容商-选择带回</title>
<script type="text/javascript">
	// 页面加载定时器，为处理刚进入页面时页面整体未渲染完毕自动勾选无效问题
	$(function() {
		setTimeout('load("cpCodes","cpCode",",")', 500);
	});
</script>
</head>
<body>
	<form id="pagerForm" action="cpInfoBring/bringCpInfoList" method="post">
		<!--【必须】当前页数-->
		<input type="hidden" name="pageNum" value="${pageNum}" />
		<!--【可选】每页显示多少条-->
		<input type="hidden" name="numPerPage" value="${numPerPage}" />
		<!--【查询条件】内容商代码-->
		<input type="hidden" name="search_LIKE_cpCode" value="${param.search_LIKE_cpCode }" />
	</form>
	<div class="pageHeader">
		<form action="cpInfoBring/bringCpInfoList" onsubmit="return dialogSearch(this);" method="post">
			<div class="searchBar">
				<table class="searchContent">
					<tr>
						<td>内容商代码:</td>
						<td>
							<input type="text" name="search_LIKE_cpCode" value="${param.search_LIKE_cpCode }" />
						</td>
						<td>
							<div class="buttonActive">
								<div class="buttonContent">
									<button type="submit">检索</button>
								</div>
							</div>
						</td>
						<td>
							<div class="button">
								<div class="buttonContent">
									<button type="button" class="close" onmousedown="bringBack(['cpCodes'])">选择带回</button>
								</div>
							</div>
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>
	<div class="pageContent">
		<table class="table" width="100%" layoutH="90" style="table-layout: fixed; word-wrap: break-word;">
			<thead>
				<tr>
					<th width="25"><input type="checkbox" id="checkAll" onclick="checkAll('cpCode', this.checked)" /></th>
					<th width="80">内容商ID</th>
					<th width="280">内容商名称</th>
					<th width="280">内容商代码</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="cpInfo" items="${cpInfoList}">
					<tr target="id" rel="${cpInfo.cpCode}">
						<td>
							<input class="cpCode" value="${cpInfo.cpCode}" type="checkbox"
								onclick="bring([['cpCodes','${cpInfo.cpCode}',',']], this.checked)" />
						</td>
						<td>${cpInfo.cpId}</td>
						<td>${cpInfo.cpName}</td>
						<td>${cpInfo.cpCode}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="panelBar">
			<div class="pages">
				<span>显示</span>
				<select id="numPerPage" name="numPerPage" onchange="dialogPageBreak({numPerPage:this.value})">
					<option value="20" <c:if test="${numPerPage==20}">selected</c:if>>20</option>
					<option value="50" <c:if test="${numPerPage==50}">selected</c:if>>50</option>
					<option value="100" <c:if test="${numPerPage==100}">selected</c:if>>100</option>
				</select>
				<span>条，共${totalCount}条</span>
			</div>
			<div id="pagination" class="pagination" targetType="dialog" totalCount="${totalCount}" numPerPage="${numPerPage}" pageNumShown="3" currentPage="${pageNum}"></div>
		</div>
	</div>
</body>
</html>