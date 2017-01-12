(function() {
	// 注册命名空间 'COMMON' 到window对象上
	if (typeof (COMMON) == "undefined") {
		window.COMMON = {};
	} else {
		alert("重复的命名空间:COMMON");
	}

	// 清空查找带回的输入框,current为需要清空的id,多个时以逗号隔开
	function clearContent(current) {
		var c = current.split(',');
		for (var i = 0; i < c.length; i++) {
			$("#" + c[i]).val("");
		}
		;
		return false;
	}
	// 高级搜索将本页面所有输入清空
	function resetValue() {
		$("select", $.pdialog.getCurrent()).each(function(e) {
			$(this).prev().text("请选择");
			$(this).val("");
		});
	}
	// 高级搜索关闭当前对话框，dialogId为要关闭的dialog的id,
	// 关闭前会检验是否存在class=error且display=block的元素，如果存在则不进行任何操作
	function closeDialog(dialogId) {
		var hasError = false;
		$(".error").each(function() {
			if ($(this).css("display") == "block") {
				hasError = true;
			}
		});
		if (hasError) {
			return false;
		}
		$.pdialog.close(dialogId);
	}
	// 将当页面设置为只读页面
	function readOnly() {
		$("form input", $.pdialog.getCurrent()).prop("disabled", true);
		if ($("form input", $.pdialog.getCurrent()).hasClass("deleteInput")) {
			$("form input", $.pdialog.getCurrent()).removeClass("deleteInput");
		}
		$("form textarea", $.pdialog.getCurrent()).prop("readonly", true);
		$("form select", $.pdialog.getCurrent()).attr("selectDisabled", true);
		$("form select", $.pdialog.getCurrent()).attr("disabled", "disabled");
		$("form a[id!='materialName']", $.pdialog.getCurrent()).hide();
		$("form input:radio", $.pdialog.getCurrent()).prop("disabled", true);
		$("form button:button", $.pdialog.getCurrent()).hide();
		$(".formBar", $.pdialog.getCurrent()).hide();
		$("[placeholder]").removeAttr("placeholder");
	}
	// 判断是否是纯数字
	function isNum(a) {
		var num = /^([0-9]*)$/;
		;
		return (num.test(a));
	}
	// 校验mac地址
	function isValidMacAddress(address) {
		var c = '';
		var i = 0, j = 0;

		if ((address.toLowerCase() == 'ff:ff:ff:ff:ff:ff')
				|| (address.toLowerCase() == '00:00:00:00:00:00')) {
			return false;
		}

		var addrParts = address.split(':');
		if (addrParts.length != 6) {
			return false;
		}
		for (i = 0; i < 6; i++) {
			if (addrParts[i] == '') {
				return false;
			}
			if (addrParts[i].length != 2) {
				return false;
			}
			for (j = 0; j < addrParts[i].length; j++) {
				c = addrParts[i].toLowerCase().charAt(j);
				if ((c >= '0' && c <= '9') || (c >= 'a' && c <= 'f')) {
					continue;
				} else {
					return false;
				}
			}
		}
		/* 只校验基本格式，不校验生成规则 */
		/*
		 * if ((parseInt(addrParts[0], 16) % 2) == 1) { return false; }
		 */
		return true;
	}
	// 把创建的函数注册到 'window.COMMON'命名空间中
	window.COMMON.clearContent = clearContent;
	window.COMMON.resetValue = resetValue;
	window.COMMON.closeDialog = closeDialog;
	window.COMMON.readOnly = readOnly;
	window.COMMON.isNum = isNum;
	window.COMMON.isValidMacAddress = isValidMacAddress;

})();

// 处理点击ESC事件，关闭弹出窗口
function onkeyESC(event) {
	if (event.keyCode == DWZ.keyCode.ESC) {
		// alertMsg.correct("您修改的资料未保存，请选择保存或取消！");
		if ($.pdialog._current)
			$.pdialog.closeCurrent();
	}
}


function uploadController(id, type, val, submitId) {
	$("#" + id, $.pdialog.getCurrent())
			.uploadify(
					{
						method : 'post',
						swf : 'static/jquery/uploadify/uploadify.swf',
						uploader : 'upload/uploadify;jsessionid=${pageContext.session.id}',
						fileObjName : 'file', // The name of the file
						// object
						// to use in your server-side
						// script
						fileSizeLimit : '20MB', // The maximum size of an
						// uploadable file in KB
						// (Accepts units B KB MB GB if
						// string, 0 for no limit)
						successTimeout : 0, // The number of seconds to wait
						// for
						// Flash to detect the server's
						// response after the file has
						// finished uploading
						removeCompleted : true, // Remove queue items from
						// the
						// queue when they are done
						// uploading
						buttonText : '上传',
						height : 20,
						multi : false,
						onUploadProgress : function(file, bytesUploaded,
								bytesTotal, totalBytesUploaded, totalBytesTotal) {
							$('#' + submitId).attr(
									"onclick", "return false;");
						},
						fileTypeDesc : '*.jpg;*.png;',
						fileTypeExts : '*.jpg;*.png;',
						width : 50,
						'onUploadSuccess' : function(event, response) {
							$('#' + submitId).removeAttr("onclick");
							if (type == "name") {
								$("input[name='" + val + "']").val(response);
							} else if (type == "id") {
								$("#" + val).val(response);
							}
						},
						'onUploadError' : function(event, data, a, f, d, c, t) {
							$('#' + submitId).removeAttr("onclick");
							alert(event);
						}
					});
}


/**
 * 普通检索的选择框中含有"EQ"精确匹配的数据时，限制其输入
 * @param searchName 搜索条件select的id
 * @param searchValue  搜索值input的id
 */
function checkInput(searchName,searchValue){
		var searchNa = $("#"+searchName).val();
		var searchVa = $("#"+searchValue).val();
		if(searchNa.indexOf("EQ")>=0 && searchVa!= ''){
			if($.isNumeric(searchVa)==false){
				alertMsg.warn("请输入数字");
				$("#"+searchValue).val("");
				return false;
			}
			
		}
	}
