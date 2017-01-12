<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="shiro" uri="http://www.springside.org.cn/tags/shiro"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="pageId" value="actorList"/>
<title>影人信息</title>
<script type="text/javascript">

    function force_out_actors(tag) {
        var title = '';
        var url = '';
        if(tag==0){
            title = '确定屏蔽所选影人？';
            url = 'actor/forceOutActors/';
        }
        if(tag==1){
            title = '确定解禁所选影人？';
            url = 'actor/disForceOutActors/';
        }
        var arr = new Array();
        var ids = '';
        var actorId = '';
        $("input[name=ids]")
                .filter("input:checked")
                .each(function(e) {
                    actorId = $(this).val();

                    ids = actorId + "," + ids;
                    arr.push(actorId);
                });
        if (!arr || arr.length == 0) {
            alertMsg.warn("请选择要操作的内容！");
            return false;
        }
        ids = ids.substring(0, ids.length - 1);
        alertMsg.confirm(title,{okCall:function(){
            $.ajax({
                type: "POST",
                url: url + ids,
                async: true,
                error: function(data) {
                    alert("Connection error");
                },
                success: function(data){
                    alert(data.message);
                    navTab.reload("actor/list");
                }
            });
        }});
    }
    //弹出影人详情页面
    function actor_detailInfo(id) {
        var url = "actor/showActorDetail/" + id;
        var dlgId = "actorDetail";
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
<div class="pageHeader">
    <form id="pagerForm" onsubmit="return navTabSearch(this);" action="actor/list" method="post">
        <input type="hidden" name="pageNum" value="${requestScope.page.currentPage}" />
        <input type="hidden" name="numPerPage" value="${requestScope.page.numPerPage}" />
        <div class="searchBar">
            <table class="searchContent">
                <tr>
                    <td style="padding: 5px 5px 0 0">
                        <select class="combox" name="searchName" id="${pageId }_searchName">
                            <option value="LIKE_actorName"
                                    <c:if test="${searchName =='LIKE_actorName'}">selected</c:if>>影人姓名</option>
                            <option value="EQ_actorId"
                                    <c:if test="${searchName =='EQ_actorId'}">selected</c:if>>影人ID</option>
                        </select>
							<span id="txt">
								<input type="text" name="searchValue" value="${searchValue}" id="${pageId }_searchValue"/>
							</span>
                    </td>
                    <td style="padding: 5px 5px 0 0">
                        <span>
                        <select class="combox" name="isShow" id="isShow">
                            <option value=""
                                    <c:if test="${isShow ==''}">selected</c:if>>全部影人</option>
                            <option value="0"
                                    <c:if test="${isShow =='0'}">selected</c:if>>屏蔽影人</option>
                            <option value="1"
                                    <c:if test="${isShow =='1'}">selected</c:if>>未屏蔽影人</option>
                        </select></span>
                    </td>
                    <td style="padding: 5px 5px 0 0">
                        <div class="buttonActive">
                            <div class="buttonContent">
                                <button type="submit" style="padding: 0 5px;" onclick="return checkInput('${pageId }_searchName','${pageId }_searchValue')">查&nbsp;&nbsp;询</button>
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
            <shiro:hasPermission name="actor_force_out">
                <li><a class="edit" href="javascript:;" onclick="force_out_actors(0);"><span>屏蔽</span></a></li>
            </shiro:hasPermission>
            <shiro:hasPermission name="actor_disForce_out">
                <li><a class="edit" href="javascript:;" onclick="force_out_actors(1);"><span>解禁</span></a></li>
            </shiro:hasPermission>
        </ul>
    </div>

    <table class="table" width="1500px" layoutH="112">
        <thead>
            <th width="20px" align="center"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
            <th width="100px">影人ID</th>
            <th width="100px">影人姓名</th>
            <th width="100px">影人姓名拼音</th>
            <th width="100px">别名</th>
            <th width="100px">性别</th>
            <th width="100px">出生日期</th>
            <th width="100px">星座</th>
            <th width="100px">籍贯</th>
            <th width="100px">国籍</th>
            <th width="100px">外部数据标识</th>
            <th width="100px">是否显示</th>
            <th width="100px">创建时间</th>
        </thead>
        <tbody>
        <c:forEach var="item" items="${requestScope.page.data}" varStatus="status">
            <tr target="r_id" rel="${item.actorId}" ondblclick="actor_detailInfo(${item.actorId})">
                <td><input name="ids" value="${item.actorId}" type="checkbox"></td>
                <td width="100px">${item.actorId}</td>
                <td width="100px">${item.actorName}</td>
                <td width="100px">${item.actorNamePinyin}</td>
                <td width="100px">${item.alias}</td>
                <td width="100px">
                    <c:choose>
                        <c:when test="${item.sex==0}">
                            <c:out value="男" />
                        </c:when>
                        <c:when test="${item.sex==1}">
                            <c:out value="女" />
                        </c:when>
                        <c:otherwise>
                            ${item.sex}
                        </c:otherwise>
                    </c:choose>
                </td>
                <td width="100px">${item.birthday}</td>
                <td width="100px">${item.actorZodiac}</td>
                <td width="100px">${item.nativeAddress}</td>
                <td width="100px">${item.actorCountry}</td>
                <td width="100px">${item.outSourceId}</td>
                <td width="100px">
                    <c:choose>
                        <c:when test="${item.isShow==0}">
                            <c:out value="已屏蔽" />
                        </c:when>
                        <c:when test="${item.isShow==1}">
                            <c:out value="未屏蔽" />
                        </c:when>
                    </c:choose>
                </td>
                <td width="100px"><fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>

            </tr>
        </c:forEach>
        <c:if test="${requestScope.page.totalCount=='0'}">
            <tr target="r_id">
                <td colspan="16" align="center"><span style="color:red;">哦 ！NO ~ 没有数据！</span></td>
            </tr>
        </c:if>
        </tbody>
    </table>
    <jsp:include page="../page/page.jsp"/>
</div>