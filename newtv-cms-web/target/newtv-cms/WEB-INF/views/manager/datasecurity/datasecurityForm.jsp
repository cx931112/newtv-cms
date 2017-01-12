<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<script type="text/javascript">
		$(function(){
			changeOp();
		})
		function changeOp(){
			if($("select[name='operator']").val()=="ISNULL"||$("select[name='operator']").val()=="ISNOTNULL"){
				$("input[name='fieldValue']").removeClass("required");
				$("input[name='fieldValue']").val("");
				$("input[name='fieldValue']").attr("disabled",true);
			}else{
				$("input[name='fieldValue']").addClass("required");
				$("input[name='fieldValue']").attr("disabled",false);
			}
		}
	</script>
</head>
<body>
	<div class="pageContent">
		<form method="post" action="datasecurity/save" onsubmit="return validateCallback(this, dialogAjaxDone);">
			<input type="hidden" name="id" value="${entity.id}"/>
			<div class="pageFormContent" layoutH="56">
				<p>
					<label>权限名称：</label> 
					<input type="text" style="width:175px;" name="name" class="required" value="${entity.name}"/>
				</p>
				<p>
					<label>所属菜单：</label>
					<select name="menuId" class="combox required" selectDisabled="true" style="width:150px">
						<option value="">选择菜单</option>
						<c:forEach var="menu" items="${menuList}">
							<option value="${menu.id}"
								<c:if test="${menu.id==entity.menuId}">selected</c:if>>${menu.name}</option>
						</c:forEach>
					</select>
				</p>
				<p>
					<label>字段名称：</label>
					<input type="text" style="width:175px;" name="fieldName" class="required" value="${entity.fieldName}"/>
				</p>
				<p>
					<label>操作符：</label>
					<select name="operator" class="combox required" selectDisabled="true" style="width:150px" onchange="changeOp()">
						<option value="">请选择</option>
						<c:forEach var="operator" items="${operatorList}">
							<option value="${operator.value}"
								<c:if test="${operator.value==entity.operator}">selected</c:if>>${operator.name}</option>
						</c:forEach>
					</select>
				</p>
				<p>
					<label>字段值：</label>
					<input type="text" style="width:175px;" name="fieldValue" value="${entity.fieldValue}"/>
				</p>
				<p>
					<label>描述：</label>
					<input type="text" style="width:175px;" name="description" value="${entity.description}"/>
				</p>
			</div>
			<div class="formBar">
				<ul>
					<li><div class="buttonActive">
							<div class="buttonContent">
								<button type="submit">保存</button>
							</div>
						</div></li>
					<li>
						<div class="button">
							<div class="buttonContent">
								<button type="button" class="close">取消</button>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</form>
	</div>
</body>
</html>
