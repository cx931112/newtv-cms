<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<head>
<style type="text/css" media="screen">
</style>
<script type="text/javascript">
function dialogAjaxDone(json) {
	ajaxDone(json);
	if (json.statusCode == DWZ.statusCode.ok) {
		if (json.navTabId) {
			navTab.reload(json.forwardUrl, {}, json.navTabId);
		} else {
			navTab.reload();
		}
	}else if(json.statusCode==206){
		navTab.reload();
	}
	$.pdialog.closeCurrent();
}
function ajaxDone(json){
		if(json.statusCode == DWZ.statusCode.error) {
			if(json.message && alertMsg) alertMsg.error(json.message);
		} else if (json.statusCode == DWZ.statusCode.timeout) {
			if(alertMsg) alertMsg.error(json.message || DWZ.msg("sessionTimout"), {okCall:DWZ.loadLogin});
			else DWZ.loadLogin();
		}else if(json.statusCode==206){
			if(json.message && alertMsg) alertMsg.warn(json.message);
		}
		else {
			if(json.message && alertMsg) alertMsg.correct(json.message);
		};
}

var row_count=2;
function addFileItem() 
{ 
	
	var item0 = $("#item0"); 
	var files = $("div[id^='div_']");
	if(files.length==0){
		row_count=2;
	}
	var itemString = "";
	itemString = itemString+"<div id='div_"+row_count+"'><dl style='width: 400px' >";
	itemString = itemString+"<dt>Excel文件：</dt><dd>";
	itemString = itemString+"<table id='table1'>";
	itemString = itemString+"<tr><td>";
	itemString = itemString+"<input type='file' accept='application/vnd.ms-excel'  name='outterCR_"+row_count+"' class='required'/></td><td>";
	itemString = itemString+"<a class='btnDel' href='' onclick='return removeItem(this)'  id='del_"+row_count+"' style='margin-left: 10px' ><span>删除</span></a></td></tr></table></dd></dl></div>";
	if(row_count==2){
		item0.after(itemString);
	}else{
		var lastFile = files[files.length-1];
		$("#"+lastFile.id).after(itemString);
	}
	row_count++; 
	return false;
}
function removeItem(current){
	var currentId = $(current).attr("id");
	var cCount = currentId.substring(4);
	var deleteId = "div_"+cCount;
	$("#"+deleteId).remove();
	return false;
}
$(function(){
	var isChrome = navigator.userAgent.toLowerCase().match(/chrome/) != null;
	if(isChrome){
		$("#filmRightAddFile").css("padding","5px 5px 0 0");
	} 
});
</script>
</head>
<body>
	<shiro:hasPermission name="excel_export">
		<li><a class="icon" href="excel/export" id="export" 
			onmousedown="exportFilmright_Check()" target="dwzExport" targetType="navTab" title="确实要导出当前搜索条件的记录吗？"><span>导出</span></a></li>
	</shiro:hasPermission>
	<h2 class="contentTitle">片单导入</h2>
	
	<form id="uploadForm" action="excel/uploadExcel" method="post" enctype="multipart/form-data"  class="pageForm required-validate" onsubmit="return iframeCallback(this,dialogAjaxDone);" >
	<div class="pageContent">
		<div class="pageFormContent" layoutH="97" >
			<dl style="">
					<dd>
						<div class="buttonActive">
							<div class="buttonContent"  id="filmRightAddFile">
								<a style="top: 10px; text-decoration: none; color: #183152;"
									href="javascript:void(0)" onclick="addFileItem()" >添加导入文件</a>
							</div>
						</div>
					</dd>
				</dl>
			<div id="item0">
				<dl style="400px;" >
					<dt>Excel文件：</dt><dd>
					<table id="table1">
						<tr>
							<td>
								<input type="file" accept="application/vnd.ms-excel"  name="outterCR" id="outterCR" class="required"/>
							</td>
							<td>
								
							</td>
						</tr>
					</table>
					</dd>
				</dl>
			</div>
			<!-- <dl>
				<dt>导入数据处理方式：</dt>
				<dd>
					<input type="radio" name="importType" value="0">清除原记录</input> 
					<input type="radio" name="importType" value="1" checked>追加记录</input> 
				</dd>
			</dl> -->
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit" >上传</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button class="close" type="button">关闭</button></div></div></li>
			</ul>
		</div>
	</div>
	</form>
</body>
</html>
