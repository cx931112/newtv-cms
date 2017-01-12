<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="shiro" uri="http://www.springside.org.cn/tags/shiro"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>运营平台</title>
<script type="text/javascript">
	function user_check() {
		$("input[name='ids']:checked", navTab.getCurrentPanel()).each(
				function(e) {
					var name = $("#" + $(this).val()).val();
					if ($.trim("system_user") == $.trim(name)) {
						alertMsg.error("所选用户中,存在不可删除的用户");
					}
				});
	}

	function checkUpdate() {
		var ts = $("tr.selected input", navTab.getCurrentPanel())[0].value;
		if ("system_user" == ts) {
			alertMsg.error("所选用户为[系统用户] 不可修改");
		}
	}

	function validateUser(v1, v2) {
		if ("system_user" == v2) {
			alertMsg.warn("该用户不可执行配置角色操作");
			return false;
		}
		var url = "admin/user/setUserRole?id=" + v1;
		var dlgId = "dialoguser";
		var title = "角色配置";
		var options = {
			width : 500,
			height : 400,
			mask : true
		};
		$.pdialog.open(url, dlgId, title, options);
	}
	//弹出修改用户页面
	function detailInfo(id) {
		if ($("#operateplatformUpdate").length > 0) {
			var url = "operateplatform/edit/" + id;
			var dlgId = "operatePlatformDetail";
			var title = "修改运营平台";
			var options = {
				width : 580,
				height : 300,
				mask : true,
				closeOnEscape : true
			};
			$.pdialog.open(url, dlgId, title, options);
		}
	}
	
	function batchModify() {
		var arr = new Array();
		var url = "admin/user/pageBatchInfo?ids=";
		var ids = '';
		$("input[name=ids]", navTab.getCurrentPanel())
		.filter("input:checked")
		.each(function(e) {
			userId = $(this).val();

			ids = userId + "," + ids;
			arr.push(userId);
		});
		if (!arr || arr.length == 0) {
			alertMsg.error("请选择要操作的内容！");
			return false;
		}
		ids = ids.substring(0, ids.length - 1);
		url += ids;
		
		$("#batchModify", navTab.getCurrentPanel()).attr("href", url);
	}
</script>
</head>
<body>
		<form id="pagerForm" action="publicinfo/operateplatform"
		method="post">
		<!--【必须】value=1可以写死-->
		<input type="hidden" name="pageNum" value="${pageNum}" />
		<!--【可选】每页显示多少条-->
		<input type="hidden" name="numPerPage" value="${numPerPage}" />
		<%-- <input type="hidden"
			name="isAdvencedSearch" value="${isAdvencedSearch}" /> --%>
	</form>

	<div class="pageHeader">
		<form onsubmit="return navTabSearch(this);"
			action="publicinfo/operateplatform">
			<div class="searchBar">
				<!-- <input type="hidden" name="isAdvencedSearch" value="1" /> -->
					<table class="searchContent">
						<tr >
							<%-- <shiro:hasPermission name="systemConfig_systemConfigList"> --%>
								<td style="padding: 5px 5px 0 0">名称：<input type="text" name="search_LIKE_name"
									value="${param.search_LIKE_configName}" />
								</td>
								<td><div class="buttonActive">
										<div class="buttonContent">
											<button type="submit">检索</button>
										</div>
									</div></td>
							<%-- </shiro:hasPermission> --%>
						</tr>
					</table>
			</div>
		</form>
	</div>



	<div class="pageContent">
		<!-- <input type="hidden" name="isAdvencedSearch" value="0" /> -->
		<div class="panelBar">
			<ul class="toolBar">
				<shiro:hasPermission name="oper_platform_add">
					<li><a class="add" href="operateplatform/add" target="dialog"
						mask="true" rel="dialog1" mask="true" height="400"><span>添加</span></a></li>
				</shiro:hasPermission>

				<shiro:hasPermission name="oper_platform_update">
					<li><a class="edit" href="operateplatform/edit/{id}" rel="ids"
						id="operateplatformUpdate" warn="请选中其中一条记录" target="dialog" mask="true" height="400"><span>修改</span></a></li>
				</shiro:hasPermission>

			</ul>
		</div>
		<table class="table" width="99%" layoutH="116">
			<thead>
				<tr>
					<th width="40"><input type="checkbox" group="ids"
						class="checkboxCtrl"></th>
					<th>编号</th>
					<th>名称</th>
					<th>排序号</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="operatePlatform" items="${operatePlatformList.content}" >
					<tr target="id" rel="${operatePlatform.id}" 
					ondblclick="detailInfo(${operatePlatform.id})">
						<td><input name="ids" value="${operatePlatform.id}"
							type="checkbox"></td>
						<td>${operatePlatform.id}</td>
						<td>${operatePlatform.name}</td>
						<td>${operatePlatform.sortNum}</td>
						
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