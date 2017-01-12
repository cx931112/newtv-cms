<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<style>
p {
	text-align: center;
}
label {
	text-align: right;
}
</style>
<body>
	<div class="pageContent">
		<form id="inputForm"  method="post" name="inputForm" >
			<div class="pageFormContent" layoutH="56">
				<p>
					<label>消息ID：</label> <input  name="messageId" type="text"
						style="width:175px;"value="${userMessage.message.id}"  readonly="readonly"/>
				</p>
				<p>
					<label>发送人：</label> <input type="text" name="userId" 
						style="width:175px;"value="${userMessage.message.senderCode}" readonly="readonly"/>
				</p>
				<p>
					<label>有效时间：</label> <input type="text" name="effectiveTime" style="width:175px;"
						value="${userMessage.effectiveTime}" readonly="readonly" />
				</p>
				<p>
					<label>创建时间：</label> <input type="text" name="createTime" style="width:175px;"
						value="${userMessage.message.createTime}" readonly="readonly" />
				</p>
				<p>
					<label>接收人：</label>  <input type="text" name="receiverCodes" style="width:175px;"
						value="${userMessage.message.receiverCodes}" readonly="readonly" />
				</p>
				<p>
					<label>消息内容：</label> <textarea rows="4" cols="30" name="content"  resize="false" style="resize:none"
						readonly="readonly" >${userMessage.message.content}</textarea>
				</p>
			</div>
		</form>
	</div>
</body>
</html>
