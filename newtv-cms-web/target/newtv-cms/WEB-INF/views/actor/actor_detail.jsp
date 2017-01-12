<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="dt" uri="/dictionary" %>
<jsp:useBean id="now" class="java.util.Date" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<head>
</head>
<body>
<div class="pageContent">
    <form>
        <input type="hidden" name="actorId" value="${actor.actorId}" />
        <div class="pageFormContent" layoutH="56">
            <!-- <div class="panel collapse" minH="100"  defH="850"> -->
            <div>
                <p style="width: 400px">
                    <label>影人ID：</label>
                    <input  name="actorId" readonly="readonly"  type="text" style="width: 220px"
                            value="${actor.actorId}" />
                </p>
                <p style="width: 400px">
                    <label>影人姓名：</label>
                    <input  name="actorName" readonly="readonly"  type="text" style="width: 220px"
                            value="${actor.actorName}" />
                </p>
                <p style="width: 400px">
                    <label>影人姓名拼音：</label>
                    <input  name="actorNamePinyin" readonly="readonly"  type="text" style="width: 220px"
                            value="${actor.actorNamePinyin}" />
                </p>
                <p style="width: 400px">
                    <label>影人别名：</label>
                    <input  name="alias" readonly="readonly"  type="text" style="width: 220px"
                            value="${actor.alias}" />
                </p>
                <p style="width: 400px">
                    <label>影人性别：</label>
                    <c:choose>
                        <c:when test="${actor.sex==0}">
                            <input  name="sex" readonly="readonly"  type="text" style="width: 220px"
                                    value="男" />
                        </c:when>
                        <c:when test="${actor.sex==1}">
                            <input  name="sex" readonly="readonly"  type="text" style="width: 220px"
                                    value="女" />
                        </c:when>
                        <c:otherwise>
                            <input  name="sex" readonly="readonly"  type="text" style="width: 220px"
                                    value="${actor.sex}" />
                        </c:otherwise>
                    </c:choose>
                </p>
                <p style="width: 400px">
                    <label>出生日期：</label>
                    <input  name="birthday" readonly="readonly"  type="text" style="width: 220px"
                            value="${actor.birthday}" />
                </p>
                <p style="width: 400px">
                    <label>影人星座：</label>
                    <input  name="actorZodiac" readonly="readonly"  type="text" style="width: 220px"
                            value="${actor.actorZodiac}" />
                </p>
                <p style="width: 400px">
                    <label>影人籍贯：</label>
                    <input  name="nativeAddress" readonly="readonly"  type="text" style="width: 220px"
                            value="${actor.nativeAddress}" />
                </p>
                <p style="width: 400px">
                    <label>影人国籍：</label>
                    <input  name="actorCountry" readonly="readonly"  type="text" style="width: 220px"
                            value="${actor.actorCountry}" />
                </p>
                <p style="width: 400px">
                    <label>外部数据标识：</label>
                    <input  name="outSourceId" readonly="readonly"  type="text" style="width: 220px"
                            value="${actor.outSourceId}" />
                </p>
                <p style="width: 400px">
                    <label>是否显示：</label>
                    <c:choose>
                        <c:when test="${actor.isShow==0}">
                            <input  name="isShow" readonly="readonly"  type="text" style="width: 220px"
                                    value="已屏蔽" />
                        </c:when>
                        <c:when test="${actor.isShow==1}">
                            <input  name="isShow" readonly="readonly"  type="text" style="width: 220px"
                                    value="未屏蔽" />
                        </c:when>
                    </c:choose>
                </p>
                <p style="width: 400px">
                    <label>创建时间：</label>
                    <input  name="createTime" readonly="readonly"  datefmt="yyyy-MM-dd"  type="text" style="width: 220px"
                            value="<fmt:formatDate value="${actor.createTime}" pattern="yyyy-MM-dd HH:mm:ss" />" />
                </p>

                <p style="width: 800px;height: 85px">
                    <label>影人简介：</label>
                    <textarea name="actorDesc" readonly="readonly" rows="4"  style="width: 620px">${actor.actorDesc}</textarea>
                </p>
                <p style="width: 400px">
                    <label>大海报：</label>
                    <%--<input  name="actorBigPoster" readonly="readonly"  type="text" style="width: 220px"--%>
                            <%--value="${actor.actorBigPoster}" />--%>
                    <img src="${actor.actorBigPoster}" name="actorBigPoster" style="border:1px solid #000;width: 220px" />
                </p>
                <p style="width: 400px">
                    <label>小海报：</label>
                    <%--<input  name="actorSmallPoster" readonly="readonly"  type="text" style="width: 220px"--%>
                            <%--value="${actor.actorSmallPoster}" />--%>
                    <img src="${actor.actorSmallPoster}" name="actorSmallPoster"  style="border:1px solid #000;width: 220px" />
                </p>


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
