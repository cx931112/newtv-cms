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
var messagecenter = new Object();
messagecenter.detailInfo = function (id) {
		dealMessage(id);
		var url = "message/detail/"+id;
		var dlgId = "messageDetail";
		var title = "查看";
		var options = {width:450,height:350,mask:true,closeOnEscape:true};
		$.pdialog.open(url, dlgId, title, options);
}		

function readMessage(a) {
	$("#ce>tr").each(function(i) {
		if ($(this).hasClass("selected")) {
			itemId = $(this).attr("id");
			dealMessage(itemId);
		}
	});
}
function dealMessage(id){
	var cStatus = $("#status_"+id).html();
	if(cStatus.indexOf("未读")>-1){
		$("#status_"+id).html("已读");
		var cNumber = $("#messageNumber",window.parent.document);
		if(parseInt(cNumber.html())>0){
			cNumber.html(parseInt(cNumber.html())-1);
		}
	}
}
</script>
</head>
<body>

	<form id="pagerForm" action="message/messageList" method="post">
		<!--【必须】value=1可以写死-->
		<input type="hidden" name="pageNum" value="${pageNum}" />
		<!--【可选】每页显示多少条-->
		<input type="hidden" name="numPerPage" value="${numPerPage}" />
		<!--【查询条件】菜单名字-->
		<input type="hidden" name="search_EQ_message.id"
		value="${search_EQ_id}" />
		<input type="hidden" name="search_EQ_message.type"
		value="${search_EQ_type}" />
		<input type="hidden" name="search_EQ_status"
		value="${param.search_EQ_status}" />
		<input type="hidden" name="search_GTE_message.createTime_DATE"
		value="${search_GTE_createTime_DATE}" />
		<input type="hidden" name="search_LTE_message.createTime_DATE"
		value="${search_LTE_createTime_DATE}" />
	</form>
	
	
	<div class="pageHeader">
		<form onsubmit="return dialogSearch(this);" id="messageForm" method="post"
			action="message/messageList">
			<div class="searchBar">
					<table class="searchContent">
					<tr>
						<td><label>消息ID：</label><input type="text"
							name="search_EQ_message.id" style="width:150px;" value="${search_EQ_id}" />
						</td>
						<td><label>创建时间：</label><input type="text" style="width:150px;"
							value="${search_GTE_createTime_DATE }"
							name="search_GTE_message.createTime_DATE" class="date"
							datefmt="yyyy-MM-dd HH:mm" readonly="readonly" />到 <input
							type="text" style="width:150px;" value="${search_LTE_createTime_DATE }"
							name="search_LTE_message.createTime_DATE" class="date"
							datefmt="yyyy-MM-dd HH:mm" readonly="readonly" />
						</td>
					</tr>
					<tr>
						<td><label>消息类型：</label><select name="search_EQ_message.type"
							class="combox"
							remoteUrl="sysMenu/getSystemDicByType?type=MESSAGE_TYPE"
							defaultVal="${(empty search_EQ_type) ? '' : search_EQ_type}">
						</select></td>
						<td><label>状态：</label><select name="search_EQ_status"
							class="combox"
							remoteUrl="sysMenu/getSystemDicByType?type=MESSAGE_STATUS"
							defaultVal="${(empty param.search_EQ_status) ? '' : param.search_EQ_status}">
						</select></td>
						<td><div class="buttonActive">
								<div class="buttonContent">
									<button type="submit">检索</button>
								</div>
							</div></td>

					</tr>
				</table>
			</div>
		</form>
	</div>
	<div class="pageContent">
		<div class="panelBar">
			<ul class="toolBar">
					<li><a class="edit" href="message/detail/{id}" rel="ids" id="message"
					warn="请选中其中一条记录"  target="dialog" width="450" height="350" onclick="readMessage(this)"
					mask="true"><span>查看</span></a></li>
			</ul>
		</div>
		<table class="table" width="99%" layoutH="138">
			<thead>
				<tr>
					<th ><input type="checkbox" group="ids"
						class="checkboxCtrl"></th>
					<th>消息ID</th>
					<th>消息内容</th>
					<th>消息类型</th>
					<th>状态</th>
					<th>创建时间</th>
				</tr>
			</thead>
			<tbody id="ce">
				<c:forEach var="userMessage" items="${messages.content}">
					<tr target="id" rel="${userMessage.id}" id='${userMessage.id}'
						ondblclick="messagecenter.detailInfo('${userMessage.id}')">
						<td width="40"><input name="ids" value="${userMessage.id}" type="checkbox"></td>
						<td width="80">${userMessage.message.id}</td>
						<td width="280"> ${userMessage.message.content }</td>
						<td width="80"> ${userMessage.message.typeName }</td>
						<td width="80" ><div id="status_${userMessage.id}"> ${userMessage.statusName }</div></td>
						<td width="120">  ${userMessage.message.createTime }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div class="panelBar">
			<div class="pages">
				<span>显示</span> <select id="numPerPage" name="numPerPage"
					onchange="dialogPageBreak({numPerPage:this.value})">
					<option value="20" <c:if test="${numPerPage==20}">selected</c:if>>20</option>
					<option value="50" <c:if test="${numPerPage==50}">selected</c:if>>50</option>
					<option value="100" <c:if test="${numPerPage==100}">selected</c:if>>100</option>

				</select> <span>条，共${totalCount}条</span>
			</div>
			<div id="pagination" class="pagination" targetType="dialog"
				totalCount="${totalCount}" numPerPage="${numPerPage}"
				pageNumShown="10" currentPage="${pageNum}"></div>
		</div>
	</div>
</body>
</html>