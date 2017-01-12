<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<body>
	<link href="static/styles/jquery.dataTables.css" rel="stylesheet"
		type="text/css" />
	<script src="static/jquery/jquery.dataTables.min.js"
		type="text/javascript"></script>
<script>
$(function() {
    $.extend($.fn.dataTable.defaults, {
        searching: true,
        ordering: false,
        scrollY: "400",
        scrollX: true,
        pageLength: 20,
        lengthChange: false,
        serverSide: false,
        autoWidth: false,
        info: false,
        pagingType: "full_numbers",
        language: {
            "emptyTable": "查无数据!",
            "zeroRecords": "查无数据!",
            "search": "${searchDesc}"==""?"搜索:":"${searchDesc}",
            "paginate": {
                "first": "首页",
                "previous": "上一页",
                "next": "下一页",
                "last": "末页"
            }
        }
    });
    var columns = [{
        "data": "${key}"
    }];
    var cols = "${cols}".split(",");
    $(cols).each(function() {
        columns.push({
            "data": this
        })
    });

    function isInTarget(val) {
        if ($.inArray(val, getTargetKeys()) > -1) {
            return true;
        }
        return false;
    }
    function getTargetKeys() {
        var keys = new Array();
        if (targetTable) {
            var nodes = targetTable.fnGetNodes();
            for (var i = 0; i < nodes.length; i++) {
                try {
                    keys.push(targetTable.fnGetData(nodes[i])['${key}']);
                } catch(e) {
                    console.warn(e);
                }
            }
        }
        return keys;
    }

    function targetdrawCallback() {
        $("#sourcecheckall").attr("checked", false);
        $("input[name='sourceids']").each(function(i) {
            if (isInTarget(this.value)) {
                $(this).attr("checked", true);
                $(this).attr("disabled", true);

            } else {
                $(this).attr("disabled", false);

            }
        });
    }

    function buildMultLookup() {
        // 清空重新加载
        $("#multLookupdiv").empty();
        var targetKeys = getTargetKeys();
        $.each(targetKeys,
        function(i, v) {
            $("#multLookupdiv").append("<input type='hidden' name='selectedkey' value='" + v + "'/>");
        });
    }
    var targetTable = $("#multselecttarget").dataTable({
        "columns": columns,
        "drawCallback": function(settings) {
            $("#targetcheckall").attr("checked", false);
        }
    });
    if ('${targetUrl}' != '') {
        $('#multselecttarget').dataTable().fnDestroy();
        targetTable = $("#multselecttarget").dataTable({
            "processing": true,
            "serverSide": false,
            "ajax": {
                "url": "${targetUrl}",
                "type": "POST",
            },
            "columns": columns,
            "columnDefs": [{
                "targets": 0,              
                "data": '${key}',
                "render": function(data, type, full) { // 返回自定义内容
                    return "<input type='checkbox' name='targetids' value='" + data + "'/>";
                }
            }],
            "drawCallback": targetdrawCallback
        });
    }
   
    var sourceTable = $("#multselectsource").dataTable({
        "processing": true,
        "serverSide": true,
        "ajax": {
            "url": "${sourceUrl}",
            "type": "POST",
            "data":function(d){
            	return {
            		"pageNo":d.start/d.length+1,
            		"searchTxt":d.search.value,
            	}
            }
        },
        "columns": columns,
        "columnDefs": [{
            "targets": 0,
            "data": '${key}',
            "render": function(data, type, full) { // 返回自定义内容
                return "<input type='checkbox' name='sourceids' value='" + data + "'/>";
            }
        }],
        "drawCallback": targetdrawCallback
    });
    $("#addbtn").click(function() {
        var checkedsource = $("input[name='sourceids']:not(:disabled):checked");
        if (checkedsource.length == 0) {
            alertMsg.warn("请选择要添加的数据!");
            return false;
        }
        $(checkedsource).each(function() {
            var data = sourceTable.fnGetData($(this).parents('tr'));
            if (!isInTarget(data['${key}'])) {
                targetTable.fnAddData(data);
            }
            $(this).attr("disabled", true);
            buildMultLookup();
            return true;
        });
    });
    $("#delbtn").click(function() {
        var checkedtarget = $("input[name='targetids']:checked");
        if (checkedtarget.length == 0) {
            alertMsg.warn("请选择要删除的数据!");
            return false;
        }
        $(checkedtarget).each(function() {
            var tr = $(this).parent().parent();
            targetTable.fnDeleteRow(tr);
        });
        targetdrawCallback();
        buildMultLookup();
    });
    $("#savebtn").click(function() {
        var keys = getTargetKeys();
        if (keys.length == 0) {
            alertMsg.warn("请选择数据!");
            return false;
        }
        var callBackFunc = '${callBack}';
        if (callBackFunc != "") {
            var fn = window[callBackFunc];
            if (typeof fn === "function") {
                fn.call(null, keys);
            } else {
                alertMsg.warn(callBackFunc + "不是一个有效的方法!");
            }
        }
        $.pdialog.closeCurrent();
    });
});
function checkall(name, obj ) {
    var selector = "input[name='" + name + "']:not(:disabled)";
    if (obj.checked == true) {
        $(selector).attr("checked", true);
    } else {
        $(selector).attr("checked", false);
    }
}
</script>
<style type="text/css">
#multselecttarget_wrapper {
	width: 45%;
	float: left;
	clear: left;
}

#multselectsource_wrapper {
	width: 45%;
	float: right;
	clear: right
}
.dataTables_wrapper .dataTables_paginate {
  float: right;
  text-align: right;
  padding-top: 0.25em;
  border-width: 1px 0;
  padding: 0;
  margin: 0
}
.dataTables_wrapper .dataTables_paginate .paginate_button {
  box-sizing: border-box;
  display: inline-block;
  min-width: 0.5em;
  padding: 0.3em 0.3em;
  margin-left: 1px;
  text-align: center;
  text-decoration: none !important;
  cursor: pointer;
  *cursor: hand;
  color: #333333 !important;
  border: 1px solid transparent;
}
.dataTables_wrapper .dataTables_paginate .paginate_button span{
 background:url(./static/dwz/themes/default/images/grid/grid.png) no-repeat;
}

.dataTables_wrapper .dataTables_paginate .paginate_button.disabled .first {
  padding: 0 0 0 10px;
  background-position: 0 -447px;
}
.dataTables_wrapper .dataTables_paginate .paginate_button.disabled .previous{
	padding: 0 0 0 10px;
  background-position: 0 -497px;
}
.dataTables_wrapper .dataTables_paginate .paginate_button.disabled .next{
  padding: 0 10px 0 0;
  background-position: 100% -547px;
}
.dataTables_wrapper .dataTables_paginate .paginate_button.disabled .last{
  padding: 0 10px 0 0;
  background-position: 100% -597px;
}
.dataTables_wrapper .dataTables_paginate .paginate_button .first {
  padding: 0 0 0 10px;
  background-position: 0 -247px;
}
.dataTables_wrapper .dataTables_paginate .paginate_button .previous{
	padding: 0 0 0 10px;
  background-position: 0 -297px;
}
.dataTables_wrapper .dataTables_paginate .paginate_button .next{
  padding: 0 10px 0 0;
  background-position: 100% -347px;
}
.dataTables_wrapper .dataTables_paginate .paginate_button .last{
  padding: 0 10px 0 0;
  background-position: 100% -397px;
}
.dataTables_wrapper .dataTables_paginate .paginate_button.current, .dataTables_wrapper .dataTables_paginate .paginate_button.current:hover {
  color: red !important;
  font-weight:bold;
}
.dataTables_wrapper .dataTables_paginate .paginate_button.disabled, .dataTables_wrapper .dataTables_paginate .paginate_button.disabled:hover, .dataTables_wrapper .dataTables_paginate .paginate_button.disabled:active {
  cursor: default;
  color: #666 !important;
  border: 1px solid transparent;
  background: transparent;
  box-shadow: none;
}
.dataTables_wrapper .dataTables_paginate .paginate_button:hover {
  color: white !important;
  border: 1px solid #111111;
  background-color: #585858;
  background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #585858), color-stop(100%, #111111));
  /* Chrome,Safari4+ */
  background: -webkit-linear-gradient(top, #585858 0%, #111111 100%);
  /* Chrome10+,Safari5.1+ */
  background: -moz-linear-gradient(top, #585858 0%, #111111 100%);
  /* FF3.6+ */
  background: -ms-linear-gradient(top, #585858 0%, #111111 100%);
  /* IE10+ */
  background: -o-linear-gradient(top, #585858 0%, #111111 100%);
  /* Opera 11.10+ */
  background: linear-gradient(to bottom, #585858 0%, #111111 100%);
  /* W3C */
}
.dataTables_wrapper .dataTables_paginate .paginate_button:active {
  outline: none;
  background-color: #2b2b2b;
  background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #2b2b2b), color-stop(100%, #0c0c0c));
  /* Chrome,Safari4+ */
  background: -webkit-linear-gradient(top, #2b2b2b 0%, #0c0c0c 100%);
  /* Chrome10+,Safari5.1+ */
  background: -moz-linear-gradient(top, #2b2b2b 0%, #0c0c0c 100%);
  /* FF3.6+ */
  background: -ms-linear-gradient(top, #2b2b2b 0%, #0c0c0c 100%);
  /* IE10+ */
  background: -o-linear-gradient(top, #2b2b2b 0%, #0c0c0c 100%);
  /* Opera 11.10+ */
  background: linear-gradient(to bottom, #2b2b2b 0%, #0c0c0c 100%);
  /* W3C */
  box-shadow: inset 0 0 3px #111;
}

.multbtn {
	border:1px double #b8d0d6;
	background:none;
	font-size: 12px;
	font-weight: bold;
	padding: 5px 5px 5px 5px;
}
</style>
	<table id="multselecttarget" class="cell-border" cellspacing="0"
		width="100%">
		<thead>
			<tr>
				<th><input type="checkbox" id="targetcheckall" onclick="checkall('targetids',this)"/></th>
				<c:forEach items="${colNames }" var="col">
					<th>${col }</th>
				</c:forEach>
			</tr>
		</thead>
	</table>
	<table id="multselectsource" class="cell-border" cellspacing="0"
		width="100%">
		<thead>
			<tr>
				<th><input type="checkbox" id="sourcecheckall" onclick="checkall('sourceids',this)"/></th>
				<c:forEach items="${colNames }" var="col">
					<th>${col }</th>
				</c:forEach>
			</tr>
		</thead>
	</table>
	<div
		style="width: 10%; float: left; clear: none; text-align: center; margin-top: 15%" >
		<button type="button" id="addbtn" class="multbtn">&lt;添加</button>
		<button type="button" id="delbtn" class="multbtn">删除&gt;</button>
	</div>
	<div style="width: 100%; float: left; text-align: right;margin-top: 15px;margin-bottom: 15px" >
		<button type="button" id="savebtn" class="multbtn">确定</button>
	</div>
	<div style="display:none" id="multLookupdiv">
	</div>
</body>
</html>
