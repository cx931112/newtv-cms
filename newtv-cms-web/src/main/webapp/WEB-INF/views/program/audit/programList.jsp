<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="shiro" uri="http://www.springside.org.cn/tags/shiro"%>
<%@ taglib prefix="dt" uri="/dictionary" %>
<c:set var="pageId" value="programAudit_programList"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>节目审核</title>
<script type="text/javascript">
	// 节目审核显示审核意见页
	function programAudit_audit() {
		var arr = new Array();
		var url = "program/showAudit?ids=";
		var ids = '';
		$("input[name=ids]", navTab.getCurrentPanel())
		.filter("input:checked")
		.each(function(e) {
			programId = $(this).val();

			ids = programId + "," + ids;
			arr.push(programId);
		});
		if (!arr || arr.length == 0) {
			alertMsg.error("请选择要操作的内容！");
			return false;
		}
		ids = ids.substring(0, ids.length - 1);
		url += ids;
		
		$("#programAudit_audit", navTab.getCurrentPanel()).attr("href", url);
	}
	//弹出节目详情页面
	function program_detailInfo(id) {
		var url = "program/showProgramDetail/" + id;
		var dlgId = "programDetail";
		var title = "详细信息";
		var options = {
			width : 878,
			height : 575,
			mask : true,
			closeOnEscape : true
		};
		$.pdialog.open(url, dlgId, title, options);
	} 
</script>
</head>
<body>
	<form id="pagerForm" method="post" action="program/audit">
		<!--【必须】value=1可以写死-->
		<input type="hidden" name="pageNum" value="${pageNum }" />
		<!--【可选】每页显示多少条-->
		<input type="hidden" name="numPerPage" value="${numPerPage }" />
		
		<!--【可选】查询排序-->
		<input type="hidden" name="orderField" value="${orderField}" />
		<!--【可选】升序降序-->
		<input type="hidden" name="orderDirection" value="${orderDirection}" />
		<!--【查询条件】-->
		<input type="hidden" name="searchName" value="${searchName}" />
		<input type="hidden" name="searchValue" value="${searchValue}" />
		<input type="hidden" name="isAdvencedSearch" value="${isAdvencedSearch}" />
	</form>
	<div class="pageHeader">
		<form onsubmit="return navTabSearch(this);" action="program/audit">
			<div class="searchBar">
				<table class="searchContent">
					<tr>
						 
						<td style="padding: 5px 5px 0 0">
							<select class="combox" name="searchName" id="${pageId }_searchName">
								<option value="LIKE_programName"
									<c:if test="${searchName =='LIKE_programName'}">selected</c:if>>节目名称</option>
								<option value="EQ_programId"
									<c:if test="${searchName =='EQ_programId'}">selected</c:if>>节目ID</option>
							</select> 
							<span id="txt">
								<input type="text" name="searchValue" value="${searchValue}" id="${pageId }_searchValue"/>
							</span>
						</td>
						<td>
							<div class="buttonActive">
								<div class="buttonContent">
									<button type="submit" onclick="return checkInput('${pageId }_searchName','${pageId }_searchValue')">检索</button>
								</div>
							</div>
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>
	<div class="pageContent">
		<div class="panelBar">
			<ul class="toolBar">
				<shiro:hasPermission name="program_first_audit">
				<li><a id="programAudit_audit" class="edit" target="dialog" 
						mask="true" onmousedown="programAudit_audit()"
						drawable="false" resizable="false" maxable="false"
						height="310" width="440" href="#"><span>审核</span></a></li>
				</shiro:hasPermission>
				
			</ul>
		</div>
		<table class="table" style="table-layout: fixed; word-wrap: break-word;" width="2505px" layoutH="116">
			<thead>
				<tr>
					<th width="20px" align="center"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
					<th width="150px">节目ID</th>
		            <th width="200px">节目名称</th>
		            <th width="200px">节目名称拼音</th>
		            <th width="100px">节目别名</th>
		            <th width="100px">节目英文名称</th>
					<th width="100px">副标题</th>
					<th width="150px">节目集</th>
		            <th width="100px">节目类型</th>
		            <th width="100px">节目分类</th>
		            <th width="100px">地区</th>
		            <th width="100px">语言</th>
		            <th width="100px">年代</th>
		            <th width="100px">字幕</th>
		            <th width="100px">时长(秒)</th>
		            <th width="100px">集数</th>
		            <th width="100px">排序</th>
		            <th width="100px">试播时长(秒)</th>
		            <th width="100px">清晰度</th>
		            <th width="100px">外部数据标识</th>
		            <th width="100px">厂商编码</th>
		            <th width="100px">状态</th>
		            <th width="100px">最后修改时间</th>
		            <th width="100px">修改人</th>
		            <th width="100px">是否预告片</th>
		            <th width="100px">是否完整版</th>
		            <th width="100px">是否3D</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="program" items="${programList}">
					<tr target="id" rel="${program.programId}" ondblclick="program_detailInfo(${program.programId})">
						<td><input name="ids" value="${program.programId}" type="checkbox"></td>
						<td>${program.programId}</td>
						<td>${program.programName}</td>
						<td>${program.programPinyin}</td>
						<td>${program.programAlias}</td>
						<td>${program.programEnName}</td>
						<td>${program.subtitle}</td>
						<td>
						    <c:forEach var="programseriesName" items="${program.programSeriesNameList}">
						    ${programseriesName}
						    </c:forEach>
						</td>
						<td>${program.programType}</td>
						<td>${program.programClass}</td>
						<td>${program.zone}</td>
						<td>${program.language}</td>
						<td>${program.years}</td>
						<td>${program.caption}</td>
						<td>${program.programLength}</td>
						<td>${program.setNumber}</td>
						<td>${program.sortNum}</td>
						<td>${program.trialDura}</td>
						<td>${program.definitionCode}</td>
						<td>${program.outSourceId}</td>
						<td>${program.cpCode}</td>
						<td><dt:dict entity="ProgramStatus" key="${program.status }" /></td>
						<td><fmt:formatDate value="${program.lastModifyDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td>${program.updateUser}</td> 
						<td>${program.isPreview == 0 ? '否' : '是' }
						</td>  
						<td>${program.isFull == 0 ? '否' : '是' }
						</td>
						<td>${program.is3d == 0 ? '否' : '是' }
						</td>   
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<%@ include file="../../common/pagebottom.jsp" %>
	</div>
</body>
</html>