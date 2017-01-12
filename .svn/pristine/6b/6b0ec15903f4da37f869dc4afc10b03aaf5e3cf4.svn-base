<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>批量修改数据权限</title>
</head>
<body>
	<div class="pageContent">
		<form method="post" action="admin/user/batchModify" name="pageForm"
			onsubmit="return validateCallback(this, dialogAjaxDone);">
			<div class="pageFormContent" layoutH="56">
				<input type="hidden" name="ids" value="${ids }" />
				<p style="width: 500px; height: 85px;">
					<label>CP数据权限:</label>
					<textarea class="cpCodes" name="cpCodes" readonly="readonly" style="width: 200px"
						cols="100" rows="4"></textarea>
					<input type="hidden" class="bring_cpCodes" value="" />
					<a class="btnLook" href="cpInfoBring/bringCpInfoList" target="dialog"
						rel="bringCpInfo" width="600" height="600" close="bringClose"
						param="['cpCodes']" mask="true" 
						drawable="false" resizable="false" maxable="false">选择內容商</a>
				</p>
				<p style="width: 500px; height: 85px;">
					<label>节目集类型权限：</label>
					<input type="hidden" class="programTypeIds" name="programTypeIds" value="" />
					<textarea class="programTypeNames" readonly="readonly" style="width: 200px" rows="4" cols="100"></textarea>
					<input type="hidden" class="bring_programTypeIds" value="" />
					<input type="hidden" class="bring_programTypeNames" value="" />
					<a class="btnLook" href="materialType/bringMaterialTypeList?classId=programTypeIds&className=programTypeNames" target="dialog"
						rel="bringProgramTypeIds" width="600" height="600" close="bringClose" 
						param="['programTypeIds','programTypeNames']" mask="true"
						drawable="false" resizable="false" maxable="false">选择节目集类型</a>
				</p>
				<p style="width: 500px; height: 85px;">
					<label>节目类型权限：</label>
					<input type="hidden" class="materialTypeIds" name="materialTypeIds" value="" />
					<textarea class="materialTypeNames" readonly="readonly" style="width: 200px" rows="4" cols="100"></textarea>
					<input type="hidden" class="bring_materialTypeIds" value="" />
					<input type="hidden" class="bring_materialTypeNames" value="" />
					<a class="btnLook" href="materialType/bringMaterialTypeList?classId=materialTypeIds&className=materialTypeNames" target="dialog"
						rel="bringMaterialTypeIds" width="600" height="600" close="bringClose" 
						param="['materialTypeIds','materialTypeNames']" mask="true"
						drawable="false" resizable="false" maxable="false">选择节目类型</a>
				</p>
			</div>
			<div class="formBar">
				<ul>
					<li><div class="buttonActive">
							<div class="buttonContent">
								<button type="submit">保存</button>
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