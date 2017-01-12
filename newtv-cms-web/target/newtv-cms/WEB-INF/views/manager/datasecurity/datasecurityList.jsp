<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="shiro" uri="http://www.springside.org.cn/tags/shiro"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>数据权限管理</title>
		<script type="text/javascript">
			function edit(id){
				var url = "datasecurity/edit/"+id;
				var title = "修改权限";
				var options = {width:580,height:300,mask:true,closeOnEscape:true};
				$.pdialog.open(url, '', title,options);
			}
		</script>
	</head>
	<body>
		<div class="pageHeader">
			<form id="pagerForm" onsubmit="return navTabSearch(this);" action="datasecurity/init">
				<input type="hidden" name="pageNum" value="1" /> 
				<input type="hidden" name="numPerPage" />
				<div class="searchBar">
					<table class="searchContent">
						<shiro:hasPermission name="data_security_search">
							<tr>
								<td style="padding: 5px 5px 0 0">
									<span>权限名称：</span> 
									<input type="text" name="search_LIKE_name" value="${param.search_LIKE_name}" />
								</td>
								<td>
									<span>所属菜单：</span>
									<select name="search_EQ_menuId" class="combox required" selectDisabled="true" style="width: 150px">
										<option value="">选择菜单</option>
										<c:forEach var="menu" items="${menuList}">
											<option value="${menu.id}"
												<c:if test="${menu.id==param.search_EQ_menuId}">selected</c:if>>${menu.name}</option>
										</c:forEach>
									</select>
								</td>
								<td>
									<div class="buttonActive">
										<div class="buttonContent">
											<button type="submit">检索</button>
										</div>
									</div>
								</td>
							</tr>
						</shiro:hasPermission>
					</table>
				</div>
			</form>
		</div>
		<div class="pageContent">
			<div class="panelBar">
				<ul class="toolBar">
					<shiro:hasPermission name="data_security_add">
						<li>
							<a class="add" href="datasecurity/add" target="dialog" mask="true" mask="true">
								<span>添加权限</span>
							</a>
						</li>
					</shiro:hasPermission>
					<shiro:hasPermission name="data_security_delete">
						<li>
							<a title="确实要删除这些记录吗?" rel="ids" target="selectedTodo" href="datasecurity/delete" class="delete" warn="请选中其中要删除的记录">
								<span>删除权限</span>
							</a>
						</li>
					</shiro:hasPermission>
					<shiro:hasPermission name="data_security_edit">
						<li>
							<a class="edit" href="datasecurity/edit/{id}" rel="ids" warn="请选中其中一条记录" target="dialog" mask="true">
								<span>修改权限</span>
							</a>
						</li>
					</shiro:hasPermission>
				</ul>
			</div>
			<table class="table" width="99%" layoutH="116">
				<thead>
					<tr>
						<th width="40"><input type="checkbox" group="ids"class="checkboxCtrl"></th>
						<th>权限名称</th>
						<th>所属菜单</th>
						<th>字段名称</th>
						<th>操作符</th>
						<th>字段值</th>
						<th>描述</th>
						<th>创建时间</th>
					</tr>
				</thead>
				<tbody id="update">
					<c:forEach var="data" items="${page.content}">
						<tr target="id" rel="${data.id}" ondblclick="edit(${data.id})">
							<td><input name="ids" value="${data.id}" type="checkbox"></td>
							<td>${data.name}</td>
							<td>${data.menuName}</td>
							<td>${data.fieldName}</td>
							<td>${data.operator}</td>
							<td>${data.fieldValue}</td>
							<td>${data.description}</td>
							<td><fmt:formatDate value="${data.createTime }" pattern='yyyy-MM-dd HH:mm:ss' /></td>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="panelBar">
			<div class="pages">
				<span>显示</span> 
				<select id="numPerPage" name="numPerPage" onchange="navTabPageBreak({numPerPage:this.value})">
					<option value="20" <c:if test="${numPerPage==20}">selected</c:if>>20</option>
					<option value="50" <c:if test="${numPerPage==50}">selected</c:if>>50</option>
					<option value="100" <c:if test="${numPerPage==100}">selected</c:if>>100</option>
				</select> <span>条，共${totalCount}条</span>
			</div>
			<div id="pagination" class="pagination" targetType="navTab" totalCount="${totalCount}" numPerPage="${numPerPage}" pageNumShown="10" currentPage="${pageNum}"></div>
		</div>
	</body>
</html>