<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<div class="pageHeader">
	<div class="searchBar">
		<div class="subBar">
			<ul>
				<li><div class="button"><div class="buttonContent"><button type="button" multLookup="orgId" warn="请选择部门">选择带回</button></div></div></li>
			</ul>
		</div>
	</div>
	</form>
</div>
<div class="pageContent">
  	<table class="table" layoutH="118" targetType="dialog" width="100%">
		<thead>
			<tr>
					<th width="30"><input type="checkbox" class="checkboxCtrl" group="orgId" /></th>
					<th width="250">类型</th>
					<th>值</th>
					<th>名称</th>
					<th>描述</th>
			</tr>
		</thead>
		<tbody>
		 	<c:forEach var="sysDic" items="${dicList}">
			<tr>
				<td><input type="checkbox" name="orgId" value="{channelRole:'${sysDic.value}', channelRoleName:'${sysDic.name}'}"/></td>
				<td>${sysDic.type}</td>
				<td>${sysDic.value}</td>
				<td>${sysDic.name}</td>
				<td>${sysDic.desc }</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>