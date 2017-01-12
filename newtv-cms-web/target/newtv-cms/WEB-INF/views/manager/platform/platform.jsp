<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="shiro" uri="http://www.springside.org.cn/tags/shiro" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>平台管理</title>
<script type="text/javascript">
//弹出修改平台管理页面
function detailInfo(id) {
	if($("#platformUpdate").length>0){
		var url = "platform/edit/"+id;
		var dlgId = "platformDetail";
		var title = "修改";
		var options = {width:580,height:300,mask:true,closeOnEscape:true};
		$.pdialog.open(url, dlgId, title, options);
	}
}
</script>
</head>
<body>

	<form id="pagerForm" action="platform/platformList" method="post">
		<!--【必须】value=1可以写死-->
		<input type="hidden" name="pageNum" value="${pageNum}" />
		<!--【可选】每页显示多少条-->
		<input type="hidden" name="numPerPage" value="${numPerPage}" />
		<!--【查询条件】平台名字-->
		<input type="hidden" name="search_LIKE_platformName"
			value="${param.search_LIKE_platformName}" />
		<%-- <input type="hidden"
			name="isAdvencedSearch" value="${isAdvencedSearch}" /> --%>
	</form>

	<div class="pageHeader">
		<form onsubmit="return navTabSearch(this);"
			action="platform/platformList">
		<!-- <input type="hidden" name="isAdvencedSearch" value="1" /> -->
				<div class="searchBar">
						<table class="searchContent">
							<tr>
								<shiro:hasPermission name="platform_platformList">
									<td style="padding: 5px 5px 0 0">平台名字：<input type="text" name="search_LIKE_platformName"
										value="${param.search_LIKE_platformName}" />
									</td>
									<td><div class="buttonActive">
												<div class="buttonContent">
													<button type="submit">检索</button>
												</div>
											</div></td>
								</shiro:hasPermission>
							</tr>
						</table>
				</div>
		</form>
	</div>
	<div class="pageContent">
		<!-- <input type="hidden" name="isAdvencedSearch" value="0" /> -->
		<div class="panelBar">
			<ul class="toolBar">
				<shiro:hasPermission name="platform_add">
					<li><a class="add" href="platform/add" target="dialog" mask="true"
					rel="dialog1"><span>添加</span></a></li>
				</shiro:hasPermission>
				<shiro:hasPermission name="platform_delete">
					<li><a title="确实要删除这些记录吗?" target="selectedTodo" rel="ids"
					href="platform/delete" class="delete"><span>删除</span></a></li>
				</shiro:hasPermission>
				<shiro:hasPermission name="platform_update">
					<li><a class="edit" href="platform/edit/{id}" rel="ids" id="platformUpdate"
					warn="请选中其中一条记录" target="dialog" mask="true"><span>修改</span></a></li>
				</shiro:hasPermission>
				<!-- <li><a class="icon" href="demo/common/dwz-team.xls" target="dwzExport" targetType="navTab" title="实要导出这些记录吗?"><span>导出EXCEL</span></a></li> -->
			</ul>
		</div>
		<table class="table" width="99%" layoutH="116">
			<thead>
				<tr>
					<th width="40"><input type="checkbox" group="ids"
						class="checkboxCtrl"></th>
				    <th>平台ID</th>
					<th>平台名称</th>
					<th>内容提供商编码</th>
					<th>创建人</th>
					<th>更新日期</th>
					<th>创建日期</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="platform" items="${platform.content}">
					<tr target="id" rel="${platform.platformId}" 
					ondblclick="detailInfo(${platform.platformId})">
						<td><input name="ids" value="${platform.platformId}"
							type="checkbox"></td>
					    <td>${platform.serverId}</td>
						<td>${platform.platformName}</td>
						<td>${platform.cpCodes}</td>
                        <td>${platform.user.name }</td>
                        <td><fmt:formatDate value="${platform.updateTime}"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
					    <td><fmt:formatDate value="${platform.createTime}"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div class="panelBar">
			<div class="pages">
				<span>显示</span> <select id="numPerPage" name="numPerPage"
					onchange="navTabPageBreak({numPerPage:this.value})">
					<option value="20" <c:if test="${numPerPage==20}">selected</c:if>>20</option>
					<option value="50" <c:if test="${numPerPage==50}">selected</c:if>>50</option>
					<option value="100" <c:if test="${numPerPage==100}">selected</c:if>>100</option>

				</select> <span>条，共${totalCount}条</span>
			</div>
			<div id="pagination" class="pagination" targetType="navTab"
				totalCount="${totalCount}" numPerPage="${numPerPage}"
				pageNumShown="10" currentPage="${pageNum}"></div>
		</div>
	</div>
</body>
</html>