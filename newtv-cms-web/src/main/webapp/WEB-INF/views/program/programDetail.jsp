<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="dt" uri="/dictionary" %>
<jsp:useBean id="now" class="java.util.Date" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<head>
</head>
<body>
	<div class="pageContent">
		<form>
			<input type="hidden" name="programId" value="${program.programId}" />
			<div class="pageFormContent" layoutH="56">
				<!-- <div class="panel collapse" minH="100"  defH="850"> -->
				<div>
					<p style="width: 400px">
						<label>节目名称：</label> 
						<input  name="programName" readonly="readonly"  type="text" style="width: 220px"
							value="${program.programName}" />
					</p>
					<p style="width: 400px">
						<label>节目拼音：</label> 
						<input  name="programPinyin" readonly="readonly"  type="text" style="width: 220px"
							value="${program.programPinyin}" />
					</p>
					<p style="width: 400px">
						<label>节目副标题：</label> 
						<input  name="subtitle" readonly="readonly"  type="text" style="width: 220px"
							value="${program.subtitle}" />
					</p>
					<p style="width: 400px">
						<label>节目别名：</label> 
						<input  name="programAlias" readonly="readonly"  type="text" style="width: 220px"
							value="${program.programAlias}" />
					</p>
					<p style="width: 400px;">
						<label>节目英文名：</label>
						<input readonly="readonly" name="programEnName" value="${program.programEnName }" type="text" style="width: 220px"/>
					</p>
					<p style="width: 400px">
						<label>节目类型：</label>
						<input type="text" style="width:220px" readonly="readonly" value="${program.programType }" name="programType"/>
					</p>
					<p style="width: 400px">
						<label>节目分类：</label>
						<input type="text" style="width:220px"readonly="readonly" value="${program.programClass}" name="materialClass"/>
					</p>
					<p style="width: 400px">
						<label>地区：</label>
						<input type="text" style="width:220px" readonly="readonly" value="${program.zone}" name="zone"/>
					</p>
					<p style="width: 400px">
						<label>语言：</label>
						<input type="text" style="width:220px" readonly="readonly" value="${program.language}" name="language"/>
					</p>
					<p style="width: 400px">
						<label>清晰度：</label>
						<input type="text" style="width:220px" readonly="readonly" value="${program.definitionCode}" name="definitionCode"/>
					</p>
					<p style="width: 400px">
						<label>默认清晰度：</label>
						<input type="text" style="width:220px" readonly="readonly" value="${program.defaultDefinition}" name="defaultDefinition"/>
					</p>
					<p style="width: 400px">
						<label>导演：</label>
						<input type="text" style="width:220px" readonly="readonly" value="${program.director}" name="director"/>
					</p>
					<p style="width: 400px">
						<label>主演：</label>
						<input type="text" style="width:220px" readonly="readonly" value="${program.leadingRole}" name="leadingRole"/>
					</p>
					<p style="width: 400px">
						<label>年份：</label>
						<input type="text" style="width:220px" readonly="readonly" value="${program.years}" name="years"/>
					</p>
					<p style="width: 400px">
						<label>字幕：</label>
						<input type="text" style="width:220px" readonly="readonly" value="${program.caption}" name="caption"/>
					</p>
					<p style="width: 400px">
						<label>集数：</label>
						<input type="text" style="width:220px" readonly="readonly" value="${program.setNumber}" name="setNumber"/>
					</p>
					<p style="width: 400px">
						<label>试播时长(分钟)：</label>
						<input type="text" style="width:220px" readonly="readonly" datefmt="yyyy-MM-dd" value="${program.trialDura}" name="trialDura"/>
					</p>
					<p style="width: 400px">
						<label>下线时间：</label>
						<input type="text" style="width:220px" readonly="readonly" datefmt="yyyy-MM-dd" value="${program.offLineTime}" name="offLineTime"/>
					</p>
					<p style="width: 400px">
						<label>节目状态：</label>
						<input type="text" style="width:220px"  readonly="readonly" value="<dt:dict entity="ProgramStatus" key="${program.status }"/>" name="status"/>
					</p>
					<p style="width: 400px">
						<label>CDN分发状态：</label>
						<input type="text" style="width:220px"  readonly="readonly" value="${cdnStatus}" name="cdnStatus"/>
					</p>
					<p style="width: 400px">
						<label>节目时长(分钟)：</label>
						<input type="text" style="width:220px"  readonly="readonly" value="${program.programLength}" name="programLength"/>
					</p>
					<p style="width: 400px">
						<label>首播频道：</label>
						<input type="text" style="width:220px"  readonly="readonly" value="${program.premiereChannel}" name="premiereChannel"/>
					</p>
					<p style="width: 400px">
						<label>发布时间：</label>
						<input type="text" style="width:220px"  readonly="readonly" value="${program.publishDate}" name="publishDate"/>
					</p>
					<p style="width: 400px">
						<label>首播时间：</label>
						<input type="text" style="width:220px"  readonly="readonly" datefmt="yyyy-MM-dd" value="${program.premiereDate}" name="premiereDate"/>
					</p>
					<p style="width: 400px">
						<label>最后修改时间：</label>
						<input type="text" style="width:220px"  readonly="readonly" datefmt="yyyy-MM-dd" value="${program.lastModifyDate}" name="lastModifyDate"/>
					</p>
					<p style="width: 400px">
						<label>更新操作人：</label>
						<input type="text" style="width:220px" readonly="readonly" value="${program.updateUser}" name="updateUser"/>
					</p>
					<p style="width: 400px">
						<label>节目创建时间：</label>
						<input type="text" style="width:220px"  readonly="readonly" datefmt="yyyy-MM-dd" value="${program.createDate}" name="createDate"/>
					</p>
					<p style="width: 400px">
						<label>横海报：</label>
						<input type="text" style="width:220px"  readonly="readonly" value="${program.horizontalPoster}" name="horizontalPoster"/>
					</p>
					<p style="width: 400px">
						<label>竖海报：</label>
						<input type="text" style="width:220px"  readonly="readonly" value="${program.verticalPoster}" name="verticalPoster"/>
					</p>
					<p style="width: 400px">
						<label>节目排序：</label>
						<input type="text" style="width:220px" readonly="readonly" value="${program.sortNum}" name="sortNum"/>
					</p>
					<p style="width: 400px">
						<label>是否3D：</label>
						<input type="radio" disabled name="is3d" 
						<c:if test="${program.is3d==0}">checked</c:if> value="0">否</input> 
						<input type="radio" disabled name="is3d" value="1"
							<c:if test="${program.is3d==1}">checked</c:if>>是</input>
					</p>
					<p style="width: 400px">
						<label>是否预告片：</label>
						<input type="radio" disabled name="isPreview" 
						<c:if test="${program.isPreview==0}">checked</c:if> value="0">否</input> 
						<input type="radio" disabled name="isPreview" value="1"
							<c:if test="${program.isPreview==1}">checked="checked"</c:if>>是</input>
					</p>
					<p style="width: 400px">
						<label>是否完整版：</label>
						<input type="radio" disabled name="isFull" 
						<c:if test="${program.isFull==0}">checked</c:if> value="0">否</input> 
						<input type="radio" disabled name="isFull" value="1"
							<c:if test="${program.isFull==1}">checked</c:if>>是</input>
					</p>
					<p style="width: 400px">
						<label>外部数据标识：</label>
						<input type="text" style="width:220px" readonly="readonly" value="${program.outSourceId}" name="outSourceId"/>
					</p>
					<p style="width: 400px">
						<label>内容提供商编码：</label>
						<input type="text" style="width:220px" readonly="readonly" value="${program.cpCode}" name="cpCode"/>
					</p>
					<p style="width: 400px">
						<label>片头时间：</label>
						<input type="text" style="width:220px"  readonly="readonly"  value="${program.headTime}" name="headTime"/>
					</p>
					<p style="width: 400px">
						<label>片尾时间：</label>
						<input type="text" style="width:220px"  readonly="readonly"  value="${program.tailTime}" name="tailTime"/>
					</p>
					<p style="width: 400px">
						<label>审核意见：</label>
						<input type="text" style="width:220px" readonly="readonly" value="${program.auditDesc}" name="auditDesc"/>
					</p>
					<p style="width: 400px">
						<label>下线原因：</label>
						<input type="text" style="width:220px" readonly="readonly" value="${program.offReason}" name="offReason"/>
					</p>
					<p style="width: 400px">
						<label>重新上线原因：</label>
						<input type="text" style="width:220px" readonly="readonly" value="${program.reOnReason}" name="reOnReason"/>
					</p>
					<p style="width: 600px">
						<label>删除原因：</label>
						<input type="text" style="width:220px" readonly="readonly" value="${program.delReason}" name="delReason"/>
					</p>
					<p style="width: 600px">
						<label>回退原因：</label>
						<input type="text" style="width:220px" readonly="readonly" value="${program.backReason}" name="delReason"/>
					</p>
					<p style="width: 400px">
						<label>发布平台IDS：</label>
						<input type="text" style="width:220px" readonly="readonly" value="${publishPlatformIds}" name="publishPlatformIds"/>
					</p>
					<p style="width: 400px">
						<label>完成发布平台IDS：</label>
						<input type="text" style="width:220px" readonly="readonly" value="${finishPlatformIds}" name="finishPlatformIds"/>
					</p>
					<p style="width: 400px">
						<label>操作时间：</label>
						<input type="text" style="width:220px" readonly="readonly" value="${operateTime}" name="operateTime"/>
					</p>
					<p style="width: 400px">
						<label>操作类型：</label>
						<input type="text" style="width:220px" readonly="readonly" value="${operateType}" name="operateType"/>
					</p>
					<p style="width: 400px">
						<label>是否第三方删除：</label>
						<input type="radio" disabled name="isCpDelete" 
						<c:if test="${program.isCpDelete==0}">checked</c:if> value="0">否</input> 
						<input type="radio" disabled name="isCpDelete" value="1"
							<c:if test="${program.isCpDelete==1}">checked</c:if>>是</input>
					</p>
					<p style="width: 400px">
						<label>第一次上线时间：</label>
						<input type="text" style="width:220px" readonly="readonly" datefmt="yyyy-MM-dd" value="${program.firstOnlineTime}" name="firstOnlineTime"/>
					</p>
					<p style="width: 400px">
						<label>状态修改时间：</label>
						<input type="text" style="width:220px" readonly="readonly" datefmt="yyyy-MM-dd" value="${program.statusTime}" name="statusTime"/>
					</p>
					<p style="width: 400px">
						<label>第三方更新时间：</label>
						<input type="text" style="width:220px" readonly="readonly" datefmt="yyyy-MM-dd" value="${program.thirdModifyTime}" name="thirdModifyTime"/>
					</p>
					<p style="width: 400px">
						<label>版权开始日期：</label>
						<input type="text" style="width:220px" readonly="readonly" datefmt="yyyy-MM-dd" value="${program.copyrightStartDate}" name="copyrightStartDate"/>
					</p>
					<p style="width: 400px">
						<label>版权结束日期：</label>
						<input type="text" style="width:220px" readonly="readonly" datefmt="yyyy-MM-dd" value="${program.copyrightEndDate}" name="copyrightEndDate"/>
					</p>
					<p style="width: 400px">
						<label>版权信息名称：</label>
						<input type="text" style="width:220px" readonly="readonly" value="${program.copyrightName}" name="copyrightName"/>
					</p>
					<p style="width: 400px">
						<label>片单版权名称：</label>
						<input type="text" style="width:220px" readonly="readonly" value="${program.filmCpName}" name="filmCpName"/>
					</p>
					<p style="width: 400px">
						<label>评分：</label>
						<input type="text" style="width:220px" readonly="readonly" value="${program.score}" name="score"/>
					</p>
					<p style="width: 400px">
						<label>手动评分：</label>
						<input type="text" style="width:220px" readonly="readonly" value="${program.manualScore}" name="manualScore"/>
					</p>
					<p style="width: 400px">
						<label>播放次数：</label>
						<input type="text" style="width:220px" readonly="readonly" value="${program.playTimes}" name="playTimes"/>
					</p>
					<p style="width: 400px">
						<label>评分次数：</label>
						<input type="text" style="width:220px" readonly="readonly" value="${program.manualPlayTimes}" name="manualPlayTimes"/>
					</p>
					<p style="width: 800px;height: 85px">
						<label>简介：</label>
						<textarea name="programDesc" readonly="readonly" rows="4"  style="width: 620px">${program.programDesc}</textarea>
					</p>
					<%-- <p style="width: 878px;height:100%">
					<label>节目集：</label> 
					 	<c:forEach var="progSeries" items="${program.programSeries}">
					 		<label style="margin-top:4px;width: auto;">
					 			<a href="programSeriesMaintain/showProgramSeriesDetail/${progSeries.id }" target="dialog" rel="programProgramSeries_${now }"
									mask="true" width="878" height="575" drawable=false style="text-decoration:underline;color: #20B2AA ; ">${progSeries.programSeriesName }</a>
							</label>
						</c:forEach>
					</p> --%>
				</div>
			</div>
			<div class="formBar">
				<ul>
					<div class="button">
						<div class="buttonContent">
							<button type="button" class="close">确定</button>
						</div>
					</div>
				</ul>
			</div>
		</form>
	</div>
</body>
</html>
