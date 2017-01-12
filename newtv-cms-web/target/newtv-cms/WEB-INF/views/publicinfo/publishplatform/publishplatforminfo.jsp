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
<title>运营管理</title>
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




	<div class="pageContent">
		<!-- <input type="hidden" name="isAdvencedSearch" value="0" /> -->
		<div class="panelBar">
			<ul class="toolBar">
				<shiro:hasPermission name="oper_platform_add">
					<li><a class="add" href="publishplatform/add" target="dialog"
						mask="true" rel="dialog1" mask="true" height="400"><span>添加</span></a></li>
				</shiro:hasPermission>

				<shiro:hasPermission name="oper_platform_update">
					<li><a class="edit" href="admin/user/update/{id}" rel="ids"
						id="userUpdate" warn="请选中其中一条记录" target="dialog" mask="true" height="400"><span>修改</span></a></li>
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
					<th>编号</th>
					<th>名称</th>
					<th>排序号</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="publishPlatform" items="${publishPlatformList}" >
					<tr target="id" rel="${publishPlatform.id}" 
					ondblclick="detailInfo(${publishPlatform.id})">
						<td><input name="ids" value="${publishPlatform.id}"
							type="checkbox"></td>
						<td>${publishPlatform.id}</td>
						<td>${publishPlatform.pubPlatName}</td>
						<td>${publishPlatform.sortNum}</td>
						
					</tr>
				</c:forEach>
			</tbody>

		</table>
	</div>
</body>
</html>