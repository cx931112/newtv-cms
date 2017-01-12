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
<title>菜单管理</title>
<script type="text/javascript">
//弹出修改菜单管理页面
function detailInfo(id) {
		var url = "sendMessage/addSendMessage?id="+id+"&isReadOnly=true&random="+Math.random();
		var dlgId = "messageDetail";
		var title = "查看";
		var options = {width:580,height:300,mask:true,closeOnEscape:true};
		$.pdialog.open(url, dlgId, title, options);
}		
</script>
</head>
<body>

	<form id="pagerForm" action="sendMessage/messageList" method="post">
		<!--【必须】value=1可以写死-->
		<input type="hidden" name="pageNum" value="${pageNum}" />
		<!--【可选】每页显示多少条-->
		<input type="hidden" name="numPerPage" value="${numPerPage}" />
		<input type="hidden" name="search_EQ_type"
		value="${param.search_EQ_type}" />
		<input type="hidden" name="search_GTE_createTime_DATE"
		value="${param.search_GTE_createTime_DATE}" />
		<input type="hidden" name="search_LTE_createTime_DATE"
		value="${param.search_LTE_createTime_DATE}" />
	</form>
	
	
	<div class="pageHeader">
		<form onsubmit="return navTabSearch(this);" id="messageForm" method="post"
			action="sendMessage/messageList">
			<div class="searchBar">
					<table class="searchContent">
					<tr>
						<shiro:hasPermission name="sendMessage_messageList">
							<td style="padding: 5px 5px 0 0"><label>创建时间：</label><input type="text" style="width:150px;"
								value="${param.search_GTE_createTime_DATE }"
								name="search_GTE_createTime_DATE" class="date"
								datefmt="yyyy-MM-dd HH:mm" readonly="readonly" />到 <input
								type="text" style="width:150px;" value="${param.search_LTE_createTime_DATE }"
								name="search_LTE_createTime_DATE" class="date"
								datefmt="yyyy-MM-dd HH:mm" readonly="readonly" />
							</td>
							<td><label>消息类型：</label><select name="search_EQ_type"
								class="combox"
								remoteUrl="sysMenu/getSystemDicByType?type=MESSAGE_TYPE"
								defaultVal="${(empty param.search_EQ_type) ? '' : param.search_EQ_type}">
							</select></td>
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
		<div class="panelBar">
			<ul class="toolBar">
				<shiro:hasPermission name="sendMessage_addSendMessage">
					<li><a class="add" href="sendMessage/addSendMessage" target="dialog"
						mask="true" rel="dialog1" mask="true" width="680" height="350"><span>发送消息</span></a></li>
				</shiro:hasPermission>
			</ul>
		</div>
		<table class="table" width="99%" layoutH="116">
			<thead>
				<tr>
					<th ><input type="checkbox" group="ids" width="40"
						class="checkboxCtrl"></th>
					<th>消息ID</th>
					<th>消息内容</th>
					<th>消息类型</th>
					<th>创建时间</th>
				</tr>
			</thead>
			<tbody id="ce">
				<c:forEach var="message" items="${messages.content}">
					<tr target="id" rel="${message.id}" id='${message.id}'
						ondblclick="detailInfo('${message.id}')">
						<td width="40"><input name="ids" value="${message.id}" type="checkbox"></td>
						<td width="80"> ${message.id }</td>
						<td width="380"> ${message.content }</td>
						<td width="80"> ${message.typeName }</td>
						<td width="">  ${message.createTime }</td>
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