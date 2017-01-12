<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<script type="text/javascript">
	$("#search",$.pdialog.getCurrent()).click(function() {
		$.pdialog.closeCurrent();
	});
	 function resetValue(){
 		 $("select",$.pdialog.getCurrent()).each(
			 function(e){
				$(this).prev().text("请选择");
				$(this).val("");
	      }); 
	 }
</script>
<script type="text/javascript">
	$(document).ready(function() {
		var sr = $("#s1",$.pdialog.getCurrent()).val();
		if (1 == sr) {
			$("#s2 option[value='2']",$.pdialog.getCurrent()).remove();
			$("#s2 option[value='3']",$.pdialog.getCurrent()).remove();
		}
	});
	function channel_doAction() {
		var str = $("#s1",$.pdialog.getCurrent()).val();
		if (1 == str) {
			$("#s2 option[value='2']",$.pdialog.getCurrent()).remove();
			$("#s2 option[value='3']",$.pdialog.getCurrent()).remove();
		} else {
			$("#s2 option[value='2']",$.pdialog.getCurrent()).remove();
			$("#s2 option[value='3']",$.pdialog.getCurrent()).remove();
			$("#s2",$.pdialog.getCurrent()).append("<option value='2'>好友可见</option>");
			$("#s2",$.pdialog.getCurrent()).append("<option value='3'>仅自己可见</option>");
		}
	}
</script>
</head>
<body>

	<div class="pageContent">
		<form method="post" action="operationLog/operationLogList" method="post"
			class="pageForm" onsubmit="return navTabSearch(this);">
			<input type="hidden" name="isAdvencedSearch" value="0" />
			<div class="pageFormContent" layoutH="50">
				<div class="unit">
					<label>操作类型：</label>
					<input name="search_LIKE_oprType" type="text"
							value="${param.search_LIKE_oprType}" style="width:36px;"/>
				</div>
				<div class="unit">
					<label>操作名称：</label>
					<select name="search_EQ_oprId" class="combox required" 
							remoteUrl="sysMenu/getSystemDicByType?type=OPR_TYPE">
					</select>
				</div>
				<div class="unit">
					<label>操作用户名称：</label>
					<select name="search_EQ_oprUserName" class="combox required" 
							remoteUrl="admin/user/getUser">
					</select>
				</div>
				<div class="unit">
					<label>操作用户类型：</label>
					<select name="search_EQ_oprUserType" class="combox required" 
							remoteUrl="sysMenu/getSystemDicByType?type=OPR_USER_TYPE">
					</select>
				</div>
				<div class="unit">
					<label>日志记录时间：</label> <input type="text" style="width:150px;"
						name="search_GTE_logTime_DATE" class="date" datefmt="yyyy-MM-dd HH:mm"  readonly="readonly"/> <label
						style="float: left; width: 10px !important;">到</label> <input
						type="text" style="width:150px;" name="search_LTE_logTime_DATE" class="date" datefmt="yyyy-MM-dd HH:mm"  readonly="readonly"/>
				</div>

			</div>
			<div class="formBar">
				<ul>
					<li><div class="buttonActive">
							<div class="buttonContent">
								<button type="submit" id="search">开始检索</button>
							</div>
						</div></li>
					<li><div class="button">
							<div class="buttonContent">
								<button type="reset" onclick="resetValue()">清空重输</button>
							</div>
						</div></li>
				</ul>
			</div>
		</form>
	</div>
</body>
</html>
