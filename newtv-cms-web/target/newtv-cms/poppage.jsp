<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%
    response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>新消息</title>


<base target="_blank" />
<style>
*{ margin:0;padding:0;font-size:12px; list-style: none;}
body{font-size:12px;color:#333;font-weight:normal;font-family:5B8B4F53;  }
img {border:0; clear:both;}
i, em { font-style:normal; }
/* link */
a {color:#333;text-decoration: none;}
a:hover{color:#f60; text-decoration:underline;}
a.hot{ color:#f00;}
a.hot:hover{ color:#f60;}
.clear{clear:both;}
.lmt {width:250px; height:232px; padding:3px; overflow:hidden; background: url(static/images/bg_open.png) no-repeat;}
.lmt .top {width:256px; height:22px; line-height:24px;overflow:hidden; text-indent:30px; }
.lmt .top span{ font-weight:bold; color:#c00; font-size:12px;}
.lmt .top a:hover span,.lmt .top a:hover{color:#f60; text-decoration:underline}
.lmt .body_l { text-align:center;vertical-align:middle; clear:both; height:114px; width:223px; float: right; padding:0 4px; line-height:18px; padding-top:3px; _padding-top:0px;margin-right: 14px;}
.lmt .body_r { text-align:center;width:235px;overflow:hidden; float: left; margin: 0 auto;}
.lmt .body_r  h2{color: #d00;padding:5px 0 5px 0px;display:inline; }
.lmt .body_r  h2 a{color:#d00;font-size:16px; font-family:"Microsoft Yahei"}
.lmt .body_r em, .lmt .body_r em a{color:#777}
</style>
</head>
<script>
function jumpPage(current){
	window.parent.jumpPage(current);
}
</script>
<body>
<div id="ivy_div" style="display: none;"></div>
<div id="lmt_<%=request.getParameter("count")%>" class="lmt">
  <div class="top"><span> <%-- 第<%=Integer.parseInt(request.getParameter("count"))+1%>条消息 --%>系统通知</span><b style="margin-left:15px" title="消息">消息ID(<%=request.getParameter("messageId") %>)</b></div>
   <div class="body_l">
    	 <table border ="0" style="">
		  	<tr>
		  		<td width="100%" valign="middle" height="113px">
			    <h2 style="color: #4697e6"><%=request.getParameter("content")%></h2> 
		  		</td>
		  	</tr>
  		</table>
  </div> 
  <table border ="0">
  	<tr>
  		<td width="100">
  			<div class="body_r" style="padding-right: 30px;text-align: center">
	   	 <%-- <h2><%=request.getParameter("content") %></h2> --%>
	 	 </div>
  		</td>
  	</tr>
  </table>
    <table height=30 cellspacing=0 cellpadding=0 width=225 border=0>
      <tbody>
        <tr>
          <td width="144" style="padding-left: 14px">
  			<a href="" id = "jump_<%=request.getParameter("messageId")%>" onclick = "jumpPage(this);return false"><img style="padding-top: 4px" src="static/images/search.png" width=14 height=14  border="0" alt="查看">查看</a>
  			</td>
        </tr>
      </tbody>
    </table>
  <div class="clear"></div>
</div>
</body>
</html>
