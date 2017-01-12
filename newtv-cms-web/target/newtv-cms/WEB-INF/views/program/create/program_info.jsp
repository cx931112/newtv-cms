<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://www.springside.org.cn/tags/shiro"%>
<title>节目信息编辑</title>
<div class="pageHeader">
    <form id="pagerForm" onsubmit="return navTabSearch(this);" action="program/list" method="post">
        <input type="hidden" name="pageNum" value="${requestScope.page.currentPage}" />
        <input type="hidden" name="numPerPage" value="${requestScope.page.numPerPage}" />
        <div class="searchBar">
            <table class="searchContent">
                <tr>
                    <td>
                    	<div class="buttonActive">
                            <div class="buttonContent">
                                <button type="submit" style="padding: 0 5px;">查&nbsp;&nbsp;询</button>
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
           	<li><a class="edit" href="authority/f_role_update?id={r_id}" target="dialog" title="修改角色信息"><span>修改</span></a></li>
           	<li><a class="delete" href="authority/f_role_delete?id={r_id}" target="ajaxTodo" title="确定要删除吗?"><span>删除</span></a></li>
           	<li><a class="edit" href="authority/f_role_assign?id={r_id}" target="dialog" height="550" width="600" title="权限分配"><span>预发布</span></a></li>
        </ul>
    </div>

    <table class="table" width="3000px" layoutH="112">
        <thead>
        <tr>
            <th width="150px">节目ID</th>
            <th width="400px">节目名称</th>
            <th width="400px">节目名称拼音</th>
            <th width="100px">节目别名</th>
            <th width="100px">节目英文名称</th>
            <th width="100px">副标题</th>
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
            <th width="100px">首播时间</th>
            <th width="100px">首播频道</th>
            <th width="100px">发布时间</th>
            <th width="100px">清晰度</th>
            <th width="100px">默认播放清晰度</th>
            <th width="100px">横海报</th>
            <th width="100px">竖海报</th>
            <th width="100px">外部数据标识</th>
            <th width="100px">厂商编码</th>
            <th width="100px">状态</th>
            <th width="100px">CDN分发状态</th>
            <th width="100px">最后修改时间</th>
            <th width="100px">创建时间</th>
            <th width="100px">下线原因</th>
            <th width="100px">下线时间</th>
            <th width="100px">重新上线原因</th>
            <th width="100px">删除原因</th>
            <th width="100px">发布平台IDS</th>
            <th width="100px">分发完成平台IDS</th>
            <th width="100px">是否被第三方删除</th>
            <th width="100px">第三方操作时间</th>
            <th width="100px">操作类型</th>
            <th width="100px">第一次上线时间</th>
            <th width="100px">状态修改时间</th>
            <th width="100px">版权开始日期</th>
            <th width="100px">版权结束日期</th>
            <th width="100px">版权信息名称</th>
            <th width="100px">片单版权名称</th>
            <th width="100px">评分</th>
            <th width="100px">手动评分</th>
            <th width="100px">播放次数</th>
            <th width="100px">手动播放次数</th>
            <th width="100px">修改人</th>
            <th width="100px">是否预告片</th>
            <th width="100px">是否完整版</th>
            <th width="100px">是否3D</th>
            <th width="100px">片头时长(秒)</th>
            <th width="100px">片尾时长(秒)</th>
        </thead>
        <tbody>
        <c:forEach var="item" items="${requestScope.page.data}" varStatus="status">
           <tr target="r_id" rel="${item.programId}">
                <td>${item.programId}</td>
				<td>${item.programName}</td>
				<td>${item.programPinyin}</td>
				<td>${item.programAlias}</td>
				<td>${item.programEnName}</td>
				<td>${item.subtitle}</td>
				<td>${item.programType}</td>
				<td>${item.programClass}</td>
				<td>${item.zone}</td>
				<td>${item.language}</td>
				<td>${item.years}</td>
				<td>${item.caption}</td>
				<td>${item.programLength}</td>
				<td>${item.setNumber}</td>
				<td>${item.sortNum}</td>
				<td>${item.trialDura}</td>
				<td><fmt:formatDate value="${item.premiereDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
				<td>${item.premiereChannel}</td>
				<td><fmt:formatDate value="${item.publishDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
				<td>${item.definitionCode}</td>
				<td>${item.defaultDefinition}</td>
				<td>${item.horizontalPoster}</td>
				<td>${item.verticalPoster}</td>
				<td>${item.outSourceId}</td>
				<td>${item.cpCode}</td>
				<td>${item.status}</td>
				<td>${item.cdnStatus}</td>
				<td><fmt:formatDate value="${item.offReason}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
				<td><fmt:formatDate value="${item.offLineTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
				<td>${item.reOnReason}</td>
				<td>${item.delReason}</td>
				<td>${item.publishPlatformIds}</td>
				<td>${item.finishPlatformIds}</td>
				<td>${item.isCpDelete}</td>
				<td><fmt:formatDate value="${item.thirdModifyTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
				<td><fmt:formatDate value="${item.operateTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
				<td>
					<c:choose>
						<c:when test="${item.operateType==0}">
							<c:out value="上线" />
						</c:when>
						<c:when test="${item.operateType==1}">
							<c:out value="下线" />
						</c:when>
					</c:choose>
				</td>
				<td><fmt:formatDate value="${item.firstOnlineTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
				<td><fmt:formatDate value="${item.statusTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
				<td><fmt:formatDate value="${item.copyrightStartDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
				<td><fmt:formatDate value="${item.copyrightEndDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
				<td>${item.copyrightName}</td>
				<td>${item.filmCpName}</td>
				<td>${item.score}</td>
				<td>${item.playTimes}</td>                
				<td>${item.manualPlayTimes}</td>   
				<td>${item.updateUser}</td> 
				<td>
					<c:choose>
						<c:when test="${item.isPreview==0}">
							<c:out value="不是" />
						</c:when>
						<c:when test="${item.isPreview==1}">
							<c:out value="是" />
						</c:when>
					</c:choose>
				</td>  
				<td>
					<c:choose>
						<c:when test="${item.isFull==0}">
							<c:out value="不是" />
						</c:when>
						<c:when test="${item.isFull==1}">
							<c:out value="是" />
						</c:when>
					</c:choose>
				</td>
				<td>
					<c:choose>
						<c:when test="${item.is3d==0}">
							<c:out value="不是" />
						</c:when>
						<c:when test="${item.is3d==1}">
							<c:out value="是" />
						</c:when>
					</c:choose>
				</td>   
				<td>${item.headTime}</td>   
				<td>${item.tailTime}</td>   
				<td>${item.programDesc}</td>   
				<td>${item.auditDesc}</td>   
            </tr>
        </c:forEach>
        <c:if test="${requestScope.page.totalCount=='0'}">
            <tr target="r_id">
                <td colspan="8" align="center"><span style="color:red;">哦 ！NO ~ 没有数据！</span></td>
            </tr>
        </c:if>
        </tbody>
    </table>
    <jsp:include page="../../page/page.jsp"/>
</div>