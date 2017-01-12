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
<title>用户管理</title>
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
		if ($("#userUpdate").length > 0) {
			var url = "admin/user/update/" + id;
			var dlgId = "userDetail";
			var title = "修改用户";
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

	<form id="pagerForm" action="admin/user/userList" method="post">
		<!--【必须】value=1可以写死-->
		<input type="hidden" name="pageNum" value="${pageNum}" />
		<!--【可选】每页显示多少条-->
		<input type="hidden" name="numPerPage" value="${numPerPage}" />
		<!--【查询条件】用户名字-->
		<input type="hidden" name="search_LIKE_name"
			value="${param.search_LIKE_name}" />
		<%-- <input type="hidden"
			name="isAdvencedSearch" value="${isAdvencedSearch}" /> --%>
	</form>

	<div class="pageHeader">
		<form onsubmit="return navTabSearch(this);"
			action="admin/user/userList">
			<!-- <input type="hidden" name="isAdvencedSearch" value="1" /> -->
			<div class="searchBar">
					<table class="searchContent">
						<tr>
							<shiro:hasPermission name="admin_user_userList">
								<td style="padding: 5px 5px 0 0">用户名：<input type="text" name="search_LIKE_name"
									value="${param.search_LIKE_name}" />
								</td>
								<!--  
								<td style="padding: 5px 5px 0 0"><label style="width:50px">所属平台：</label>
									<select class="combox" name="search_EQ_platformId">
											<option value="">请选择</option>
											<c:forEach var="plat" items="${platformList}">
												<option value="${plat.platformId}">${plat.platformName }</option>
											</c:forEach>
									</select>
								</td>
								-->
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
				<shiro:hasPermission name="user_add">
					<li><a class="add" href="register/add" target="dialog"
						mask="true" rel="dialog1" mask="true" height="400"><span>添加用户</span></a></li>
				</shiro:hasPermission>
				<shiro:hasPermission name="user_delete">
					<li><a title="确实要删除这些记录吗?" target="selectedTodo" rel="ids"
						href="admin/user/delete" class="delete" warn="请选中其中要删除的记录"><span>删除用户</span></a></li>
				</shiro:hasPermission>
				<shiro:hasPermission name="user_update">
					<li><a class="edit" href="admin/user/update/{id}" rel="ids"
						id="userUpdate" warn="请选中其中一条记录" target="dialog" mask="true" height="400"><span>修改用户</span></a></li>
				</shiro:hasPermission>
				<shiro:hasPermission name="user_batchModify">
					<li><a id="batchModify" class="edit" href="#" target="dialog" 
						mask="true" rel="batchModify" onmousedown="batchModify()" 
						drawable="false" resizable="false" maxable="false" 
						height="400"><span>批量添加数据权限</span></a></li>
				</shiro:hasPermission>
			</ul>
		</div>
		<table class="table" width="99%" layoutH="116">
			<thead>
				<tr>
					<th width="40"><input type="checkbox" group="ids"
						class="checkboxCtrl"></th>
					<th>登录名</th>
					<th>用户名</th>
					<th>邮箱</th>
					<th>创建时间</th>
					<th>配置用户角色</th>
				</tr>
			</thead>
			<tbody id="update">
				<c:forEach var="user" items="${user.content}">
					<tr target="id" rel="${user.id}"
						ondblclick="detailInfo(${user.id})">
						<td><input type="hidden" id="${user.id}"
							value="${user.roles}"> <input name="ids"
							value="${user.id}" type="checkbox"></td>
						<td>${user.loginName}</td>
						<td>${user.name}</td>
						<td>${user.email}</td>
						<td><fmt:formatDate value="${user.registerDate }"
								pattern='yyyy-MM-dd HH:mm:ss' /></td>
						<td><shiro:hasPermission name="user_assign_role">
								<a style="color: #00C;" title="配置用户角色" href="#"
									onclick="validateUser('${user.id}','${user.roles}')">配置角色 </a>
							</shiro:hasPermission></td>
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