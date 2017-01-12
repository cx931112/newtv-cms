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
<title>预览模板列表</title>
<script type="text/javascript">
	//弹出修改预览模板页面
	function detailInfo(id) {
		if($("#editTemplate").length>0){
			var url = "previewTemplate/editTemplate/" + id;
			var dlgId = "topicDetail";
			var title = "修改预览模板";
			var options = {
				width : 580,
				height : 350,
				mask : true,
				closeOnEscape : true
			};
			$.pdialog.open(url, dlgId, title, options);
		}
	}
</script>
</head>

<body>

	<form id="pagerForm" action="previewTemplate/previewTemplateList"
		method="post" onsubmit="return navTabSearch(this);">
		<!--【可选】查询排序-->
		<input type="hidden" name="orderField" value="${orderField}" />
		<!--【可选】升序降序-->
		<input type="hidden" name="orderDirection" value="${orderDirection}" />
        <input type="hidden" name="pageNum" value="${pageNum}" /> 
        <input type="hidden" name="numPerPage" value="${numPerPage}" />

		<div class="pageHeader">
				<div class="searchBar">
					<table class="searchContent">
								<tr>
									<shiro:hasPermission name="previewTemplate_previewTemplateList">
										<td style="padding: 5px 5px 0 0">模板类型:</td>
											<td>
												<select
													name="search_EQ_templateType" class="combox"
													remoteUrl="sysMenu/getSystemDicByType?type=TEMPLATE_TP_TYPE"
													defaultVal="${param.search_EQ_templateType}"></select>
											<td><div class="buttonActive">
													<div class="buttonContent">
														<button type="submit">检索</button>
													</div>
												</div></td>
									</shiro:hasPermission>
								</tr>
					</table>
						<%-- <ul class="searchContent" style="height: 30px !important">
							
								<li style="width: 70px !important"><p
										style="height: 21px; text-align: center; line-height: 21px; font-size: 13px">上线状态:</p></li>
								<li style="width: 120px !important;"><select
									name="search_EQ_templateType" class="combox"
									remoteUrl="sysMenu/getSystemDicByType?type=TEMPLATE_TP_TYPE"
									defaultVal="${param.search_EQ_templateType}"></select></li>
								<li style="height: 28px !important;"><div class="buttonActive">
										<div class="buttonContent">
											<button type="submit" style="width: 62px;">检索</button>
										</div>
									</div></li>
							</shiro:hasPermission>
						</ul> --%>
				</div>
		</div>
	</form>
	<div class="pageContent">
		<div class="panelBar">
			<ul class="toolBar">
				<shiro:hasPermission name="previewTemplate_addTemplate">
					<li><a class="add" href="previewTemplate/addTemplate"
					target="dialog" mask="true" rel="dialog3" height="350" width="500"><span>添加模板</span></a></li>
				</shiro:hasPermission>
				<shiro:hasPermission name="previewTemplate_deleteTemplate">
					<li><a title="确实要删除这些记录吗?" target="selectedTodo" rel="ids"
					href="previewTemplate/deleteTemplate" class="delete"><span>删除模板</span></a></li>
				</shiro:hasPermission>
				<shiro:hasPermission name="previewTemplate_editTemplate">
					<li><a class="edit" href="previewTemplate/editTemplate/{id}" id="editTemplate"
					rel="ids" warn="请选中其中一条记录" target="dialog" mask="true" height="350"
					width="500"><span>修改模板信息</span></a></li>
				</shiro:hasPermission>
			</ul>
		</div>
		<table class="table"
			style="table-layout: fixed; word-wrap: break-word;" width="100%"
			layoutH="116" asc="asc" desc="desc">
			<thead>
				<tr>
					<th width="10px;"><input type="checkbox" group="ids"
						class="checkboxCtrl"></th>
					<th width="30px;" orderField="templateId"
						<c:if test='${orderField == "templateId" }'> class="${orderDirection}"</c:if>
						class="asc">模板编号</th>
					<th width="60px;" orderField="name"
						<c:if test='${orderField == "name" }'> class="${orderDirection}"</c:if>
						class="asc">模板名称</th>
					<th width="50px;">模板类型</th>
					<th width="50px;" orderField="description"
						<c:if test='${orderField == "description" }'> class="${orderDirection}"</c:if>
						class="asc">模板描述</th>
					<th width="50px;">是否包含节目集信息</th>
					<th width="50px;">所属平台</th>
					<th width="100px;">预览地址</th>
					<th width="50px;">模板详情</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="template" items="${previewTemplateList.content}">
					<tr target="id" rel="${template.templateId}"
						ondblclick="detailInfo(${template.templateId})">
						<td><input type="hidden" id="${template.templateId}"
							value="${template.templateId}"> <input name="ids"
							value="${template.templateId}" type="checkbox"></td>
						<td>${template.templateId }</td>
						<td>${template.name}</td>
						<td>${template.templateTypeName}</td>
						<td>${template.description}</td>
						<td><c:if test="${template.containPs==1}">是</c:if> <c:if
								test="${template.containPs==0}">否</c:if></td>
						<td>${template.platform.platformName}</td>
						<td>${template.htmlUrl}</td>
						<shiro:hasPermission name="previewTemplate_previewItemList">
							<td><a title="编辑模板项" style="color: #00C;" class="btnView"
								href="previewTemplate/previewItemList?templateId=${template.templateId}"
								target='navTab'></a> </a></td>
						</shiro:hasPermission>
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