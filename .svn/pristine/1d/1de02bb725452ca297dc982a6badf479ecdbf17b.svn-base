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
<title>操作日志</title>
<script type="text/javascript">
//弹出查看日志详情页面
function detailInfo(id) {
	var url = "operationLog/showOperationLogData/"+id;
	var dlgId = "operationLogDataDetail";
	var title = "查看日志详情";
	var options = {width:850,height:500,mask:true,closeOnEscape:true};
	$.pdialog.open(url, dlgId, title, options);
}
</script>
</head>
<body>
	<form id="pagerForm" action="operationLog/operationLogList" method="post">
		<!--【必须】value=1可以写死-->
		<input type="hidden" name="pageNum" value="${pageNum}" />
		<!--【可选】每页显示多少条-->
		<input type="hidden" name="numPerPage" value="${numPerPage}" />
		<!--【查询条件】日志内容-->
		<input type="hidden" name="search_LIKE_logContent"
			value="${param.search_LIKE_logContent}" />
		<!--【查询条件】操作数据主键-->
		<input type="hidden" name="search_LIKE_oprDataId"
			value="${param.search_LIKE_oprDataId}" />
		<!--【查询条件】操作数据主键-->
		<input type="hidden" name="search_EQ_oprDataType"
			value="${param.search_EQ_oprDataType}" />
		<!--【查询条件】操作类型-->
		<input type="hidden" name="search_EQ_oprType"
			value="${param.search_EQ_oprType}" />
		<!--【查询条件】操作用户名称-->
		<input type="hidden" name="search_EQ_oprUserName"
			value="${param.search_EQ_oprUserName}" />
		<!--【查询条件】日志记录时间-->
		<input type="hidden" name="search_GTE_logTime_DATE"
			value="${param.search_GTE_logTime_DATE }" />
		<input type="hidden" name="search_LTE_logTime_DATE"
			value="${param.search_LTE_logTime_DATE}" />
			
	</form>
	<div class="pageHeader">
		<form action="operationLog/operationLogList"
			onsubmit="return navTabSearch(this);" method="post">
					<div class="searchBar">
							<table class="searchContent">
								<tr>
									<shiro:hasPermission name="operationLog_operationLogList">
										<td style="padding: 5px 5px 0 0">操作数据主键:</td>
										<td>
											<input name="search_LIKE_oprDataId" type="text"
												value="${param.search_LIKE_oprDataId}" size="8"/>
										</td>
										<td style="padding: 5px 5px 0 0">操作类型:</td>
										<td>
											<select name="search_EQ_oprType" class="combox required" 
												remoteUrl="sysMenu/getSystemDicByType?type=OPR_TYPE" 
												defaultVal="${param.search_EQ_oprType}">
											</select>
										</td>
										<td><div class="buttonActive">
												<div class="buttonContent">
													<button type="submit">检索</button>
												</div>
											</div></td>
									</shiro:hasPermission>
									<shiro:hasPermission name="operationLog_operationLogList_advanced">
										<td><div class="buttonActive">
												<div class="buttonContent" style="padding: 5px 5px 0 0">
													<a
														style="float: right; top: 10px; text-decoration: none; color: #183152;"
														href="operationLog/advanceSearch" target="dialog" mask="true"
														mask="true" title="查询框" width="600" height="400">高级检索</a>
												</div>
											</div></td>
									</shiro:hasPermission>
								</tr>
							</table>
					</div>
			</form>
	</div>
	<div class="pageContent">
		<div class="panelBar">
			<ul class="toolBar">
				<shiro:hasPermission name="operationLog_delete">
					<li><a title="确实要删除这些记录吗?" target="selectedTodo" rel="ids"
					href="operationLog/delete" class="delete"><span>删除</span></a></li>
				</shiro:hasPermission>
			</ul>
		</div>
		<table class="table" width="70%" layoutH="116" style="table-layout: fixed; word-wrap: break-word;">
			<thead>
				<tr>
					<th width="40"><input type="checkbox" group="ids"
						class="checkboxCtrl"></th>
					<th width="80">ID</th>
					<th width="80">用户名称</th>
					<th width="80">操作数据类型</th>
					<th width="80">操作数据主键</th>
					<th width="80">操作类型</th>
					<th width="200">操作内容</th>
					<th width="150">记录时间</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="operationLog" items="${operationLogList.content}">
					<tr target="id" rel="${operationLog.logId}" 
					ondblclick="detailInfo(${operationLog.logId})">
						<td><input name="ids" value="${operationLog.logId}" type="checkbox"></td>
						<td>${operationLog.logId }</td>
						<td>${operationLog.oprUserName }</td>
						<td>${operationLog.oprDataType }</td>
						<td>${operationLog.oprDataId }</td>
						<c:if test="${operationLog.oprName==null}"><td>${operationLog.oprType}</td></c:if>
						<c:if test="${operationLog.oprName!=null}"><td>${operationLog.oprName}</td></c:if>
						<td>${operationLog.logContent }</td>
						<td><fmt:formatDate value="${operationLog.logTime }" pattern='yyyy-MM-dd HH:mm:ss' /></td>
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