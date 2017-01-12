<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<body>
	<div class="pageContent">
		<form id="form" name="form"  method="post" action="roleManage/saveDatasecurity"
			onsubmit="return validateCallback(this, dialogAjaxDone);">
			<input type="hidden" name="roleId" value="${roleId}" />
			<div layoutH="50">
				<ul id='popedom-tree' class="tree treeFolder treeCheck expand">
				   <c:forEach var="menu" items="${menuList}">
					<li><a name="c" tvalue="${menu.menuId}">${menu.menuName}</a>
						<c:if test="${fn:length(menu.childs)>0}">
							<ul>
								<c:forEach var="child" items="${menu.childs}">
									<li><a name="c" tvalue="${child.menuId}">${child.menuName}</a>
											<c:if test="${fn:length(child.sdList)>0}">
												<ul>
													<c:forEach var="sd" items="${child.sdList}">
														<li><a name="c" tvalue="${sd.id}" tname="dataIds"
															<c:if test="${sd.checked==true}" >checked</c:if>>${sd.name}</a>
														</li>
													</c:forEach>
												</ul>
											</c:if>
									</li>
								</c:forEach>
							</ul>
						</c:if>
					</li>
					</c:forEach>
				</ul>
			</div>
			<div class="pageHeader">
				<div class="formBar">
					<ul>
						<li><div class="buttonActive">
								<div class="buttonContent">
									<button type="submit" onclick="save()">保存</button>
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
			</div>
		</form>
	</div>
	<script type="text/javascript">
		function save() {
			var strId = "";
			$("div.ckbox.checked >input").each(
					function() {
						strId += $(this).val() + ",";
					});
			$("div.ckbox.indeterminate >input").each(
					function() {
						strId += $(this).val() + ",";
					});
			$("#strId").val(strId);
		}
	</script>
</body>
</html>