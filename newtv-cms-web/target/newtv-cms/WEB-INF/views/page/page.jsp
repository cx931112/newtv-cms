<%--
  Created by IntelliJ IDEA.
  User: lufei
  Date: 15-11-23
  Time: 上午11:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="panelBar">
    <div class="pages">
        <span>显示</span>
        <select class="combox" name="numPerPage" onchange="navTabPageBreak({numPerPage:this.value})">
            <option value="20" <c:if test="${requestScope.page.numPerPage == 20}">selected</c:if>>20</option>
            <option value="50" <c:if test="${requestScope.page.numPerPage == 50}">selected</c:if>>50</option>
            <option value="100" <c:if test="${requestScope.page.numPerPage == 100}">selected</c:if>>100</option>
            <option value="200" <c:if test="${requestScope.page.numPerPage == 200}">selected</c:if>>200</option>
        </select>
        <span>条，共${requestScope.page.totalCount}条</span>
    </div>

    <div class="pagination" targetType="navTab"
         totalCount="${requestScope.page.totalCount}"
         numPerPage="${requestScope.page.numPerPage}" pageNumShown="10"
         currentPage="${requestScope.page.currentPage}">
    </div>

</div>