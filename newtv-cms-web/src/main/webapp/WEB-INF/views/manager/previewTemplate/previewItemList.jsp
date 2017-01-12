<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%
    String realPath = "http://" + request.getServerName() + ":"
					+ request.getServerPort() + request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<title>专题节目集信息</title>

<script type="text/javascript">
	function initHoverEvent() {
		$('.boxgrid.caption', navTab.getCurrentPanel()).hover(function() {
			$(".edit", this).show().animate({
				bottom : '0px'
			});
			$(".topcover", this).show().animate({
				top : '0px'
			});
		}, function() {
			$(".edit", this).hide();
			$(".topcover", this).hide();
		});
	}
	$(function() {
		initHoverEvent();
	});

	//删除操作后-刷新该页面
	function topic_navTabAjax(json) {
		navTabAjaxDone(json);
		navTab.reload();
	}
	// 编辑模板 数据
	function previewItemEdit(templateId) {
		var url = "previewTemplate/editTemplateData?templateId=" + templateId;
		var dlgId = "previewTemplateData";
		var title = "预览模板重表数据";
		var options = {
			resizable : false,
			width : 800,
			height : 500,
			mask : true,
			maxable : false,
			closeOnEscape : true
		};
		$.pdialog.open(url, dlgId, title, options);
	}

	// 添加新的 模板项
	function previewTemplate_addItem() {
		var brick;
		brick = '<div class="boxgrid caption hw1" id="0" ';
		brick = brick + 'size="1,1"> <img src="${ctx}/static/images/index.png" >';
		brick = brick + '<p class="topcover cover boxcaption" style="margin-left: -10px" ';
		brick = brick + 'style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;"> ';
		brick = brick + '<a   name="rmLink" onclick="preview_deleteItem(this)"  style="float: left;" title="确定要删除该预览项？"  ';
		brick = brick + 'href="#" ';
		brick = brick + '>删除</a> <a style="float: right;" ';
		brick = brick + 'title="编辑该项"  href="javascript:view(0)" ';
		brick = brick + 'onclick="return openDwzDialog(\'previewTemplate/editPreviewItem?itemId=-100&templateId=${template.templateId}\')" ';
		brick = brick + 'target="dialog" mask="true" rel="dialog4" height="200" ';
		brick = brick + 'width="400">编辑 </a>';
		brick = brick + ' </p> </div>';
		$("#addItem", navTab.getCurrentPanel()).css("display", "none");

		$('.gridly', navTab.getCurrentPanel()).append(brick);
		//初始滑动事件
		initHoverEvent();
		return $('.gridly', navTab.getCurrentPanel()).gridly();
	};
	
	
	function preview_deleteItem(vr) {
		$("a[name=rmLink]", navTab.getCurrentPanel()).parent()
				.parent().remove();
		$("#addItem", navTab.getCurrentPanel()).show();
	}
	
	function openDwzDialog(url) {
		$("#dynaDwzDialog", navTab.getCurrentPanel()).attr("href", url).click();
		return false;
	}
</script>

</head>
<body style="height: 95%; width: 80%">
	<a id="dynaDwzDialog" href="#" style="display: none;" target="dialog"
		mask="true" rel="dialog5" height="300" width="400" title="编辑该项"> </a>
	<div class="pageHeader">
		<div class="searchBar">
			<ul class="searchContent" style="height: 30px !important">
				<li style="width: 90px !important">
				     <p style="height: 21px; text-align: center; line-height: 21px; font-size: 13px">预览模板名称:</p>
				</li>
				<li style="width: 120px !important;">
				     <input type="text" readOnly value="${template.name}" />
				</li>
				<li style="width: 100px !important; height: 30px !important; margin-left: 20px; margin-top: -2px">
					<div class="buttonActive">
							<div class="buttonContent">
								<button onclick="previewItemEdit('${template.templateId}')">编辑模板数据</button>
							</div>
					</div>
				</li>
				<li id="addItem" style="width: 85px !important; height: 30px !important;   margin-top: -2px">
				    <div class="buttonActive">
						<div class="buttonContent">
							<button onclick="previewTemplate_addItem('${template.templateId}')">添加模板项</button>
						</div>
					</div>
			   </li>
				<li style="width: 80px !important; height: 30px !important;   margin-top: -2px">
				     <div class="buttonActive">
						<div class="buttonContent">
								<button onclick="savePreviewItemSort()">更新排序</button>
						</div> 
					</div>
				</li>	
					
			</ul>

		</div>
	</div>
	<div class="pageContent scroll" layoutH="84px">
		<div class="gridly" width="99%">
			<c:forEach var="item" items="${template.previewItemList}">
				<div class="boxgrid caption hw1" id="${item.ioid}"
					size="${item.itemWidth},${item.itemHeight}">
					<p class="topcover cover boxcaption" style="margin-left: -10px; display: none;"
						style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
						<a style="float: left;" title="确定要删除该预览项？" target="ajaxTodo"
							href="previewTemplate/deletePreviewItem?itemId=${item.ioid}"
							callback="topic_navTabAjax">删除</a> <a style="float: right;"
							title="编辑该项"
							href="previewTemplate/editPreviewItem?itemId=${item.ioid}&templateId=${template.templateId}"
							target="dialog" mask="true" rel="dialog3" height="300"
							width="400">编辑 </a>
					</p>

				</div>

			</c:forEach>

		</div>
	</div>

</body>
<script>
	var array = null ,elements;
	function savePreviewItemSort() {
		if (!array) {
			alertMsg.info('没有做任何修改！');
			return;
		}
		elements.each(function(a, b, c) {
			if (parseInt(b.id)){
				//算出top 和 left 值
		        bTop = parseInt($("#"+b.id).position().top / minheight);
		        bLeft = parseInt($("#"+b.id).position().left /minwidth);
				array.push({
					"ioid" : parseInt(b.id),
					"sortNum" : a + 1,
					"left" : bLeft + 1,
					"top" : bTop + 1
				});
			}
		});

		ajaxTodo("previewTemplate/updatePreviewItemSort?json=" + $.toJSON(array));
		array = null;
		elements = null;
	}
	//开始拖动
	var reordering = function($elements) {
		return false;
	};
	//结束拖动
	var reordered = function($elements) {
		//初始化变动数据
		elements = $elements;
		array = [];

	};

	var items = $(".gridly div");
	//根据ponsition 和 size大小
	var minwidth = 170;
	var minheight = 140;
	var splitsize = 10;
	var columnCount = 10;
	var isDraggable = true;
	if ('${minWidth}') {
		minwidth = '${minWidth}';
	}
	if ('${minHeight}') {
		minheight = '${minHeight}';
	}
	if ('${splitSize}') {
		splitsize = '${splitSize}';
	}
	if ('${columnCount}') {
		columnCount = '${columnCount}' * 2;
	}
	if ('${isDraggable}' == "false") {
		isDraggable = false;
	}

	itemInitPositionAndSize(items, minwidth, minheight, splitsize, function() {
		$('.gridly').gridly({
			base : 80, // px 
			gutter : 10, // px
			columns : columnCount,
			draggable : isDraggable,
			callbacks : {
				reordering : reordering,
				reordered : reordered
			}
		});
	});
</script>
</html>