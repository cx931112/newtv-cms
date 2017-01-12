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
span.error{
	margin-left: 140px;
}
</style>

<script language="javascript">
$(function(){
	var isReadOnly = ${isReadOnly};
	//如果是只读页面，设置所有信息为只读
	if(isReadOnly){
		$("form input", $.pdialog.getCurrent()).prop("disabled", true);
		$("form textarea", $.pdialog.getCurrent()).prop("readonly", true);
		$("form select", $.pdialog.getCurrent()).attr("selectDisabled", true);
		$("form select", $.pdialog.getCurrent()).attr("disabled", "disabled");
		$("form a", $.pdialog.getCurrent()).hide();
		$("form input:radio", $.pdialog.getCurrent()).prop("disabled",true);
		$(".formBar", $.pdialog.getCurrent()).hide();
		$("#file1", $.pdialog.getCurrent()).hide();
		$("[placeholder]").removeAttr("placeholder");
		
		var messageType = $("#messageType").val();
		if(messageType==2){
			$("#receiverCode").css("display","block");
		};
			
	}
});
function showReceiverCode(){
	var type=$("#type").val();
	if(type==2){
		$("#receiverCode").css("display","block");
		$("#receiverCodes").attr("class","required textInput");
	}else{
		$("#receiverCode").css("display","none");
		$("#receiverCodes").attr("class","textInput");
	}
}
</script>
<body>
	<div class="pageContent">
		<form id="inputForm" action="sendMessage/sendMessage"  method="post" name="inputForm" class="pageForm required-validate" 
			onsubmit="return validateCallback(this, dialogAjaxDone);">
			<input type="hidden" id="messageType" value='${message.type }'/>
			<div class="pageFormContent" layoutH="56">
				<p>
				<label>消息类型：</label><select name="type" id="type"
							class="combox required" onchange="showReceiverCode()"
							remoteUrl="sysMenu/getSystemDicByType?type=MESSAGE_TYPE" 
							defaultVal="${(empty message.type) ? '' : message.type}">
						</select>
				</p>
				<p id="receiverCode" style="display: none;height:50px;width:500px">
					<label >接收人：</label> 
					<textarea id="receiverCodes" name="receiverCodes" value="${message.receiverCodes}"  style="width:60%; height:100%;resize:none;" maxlength="512"
									placeholder="可多选，手动输入多个时以逗号隔开">${message.receiverCodes}</textarea>
								<a class="btnLook" href="sendMessage/getUserLoginNameList?type=1" target="dialog"  param="sub_dialog" width="878" height="575" drawable=false lookupGroup="">查找带回</a>
				</p>
				<p style="width:500px">
					<label>消息内容：</label> <textarea class="required"  name="content"  style="width:60%; height:100px;resize:none;" maxlength="512"
						 >${message.content}</textarea>
				</p>
			</div>
			<div class="formBar">
				<ul>
					<li><div class="buttonActive">
							<div class="buttonContent">
								<button type="submit">发送</button>
							</div>
						</div></li>
					<li>
						<div class="button">
							<div class="buttonContent">
								<button type="button" class="close">取消</button>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</form>
	</div>
</body>
</html>
